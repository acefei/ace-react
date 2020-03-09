.PHONY: help
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

APP_NAME=ace-app
WORKSPACE=$(PWD)/workspace
APP_DIR=$(WORKSPACE)/$(APP_NAME)
RUN=docker run --rm -u $(shell id -u):$(shell id -g) -v $(WORKSPACE):/workspace $(APP_NAME)
CONFIG_DIR=configs/
DEPS=clean docker_build creat_react set_eslint_prettier add_npm_run_lint add_npm_run_format
.PHONY: init $(DEPS)

init: $(DEPS) ## init react app with recommended config

docker_build: Dockerfile
	docker build -t $(APP_NAME) --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) $(<D)

creat_react: docker_build
	mkdir -p $(WORKSPACE)
	$(RUN) npx create-react-app $(APP_NAME) \
		&& cd $(APP_DIR) \
		&& npm i -D prettier eslint-config-prettier eslint-plugin-prettier
	
set_eslint_prettier: 
	cp -r $(CONFIG_DIR)/. $(APP_DIR)

add_npm_run_lint:
	sed -i '/react-scripts start/i\    "lint": "eslint --ext .js,.jsx src",' $(APP_DIR)/package.json

add_npm_run_format:
	sed -i '/react-scripts start/i\    "format": "eslint --fix --ext .js,.jsx src",' $(APP_DIR)/package.json

clean:
	rm -rf $(WORKSPACE)
