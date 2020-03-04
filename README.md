# ace-react
make init for react project from scratch 

## Usage
```
make init
```

## What is integrated 
- Configuration files for eslint+prettier+vscode
  - [.eslintrc.js](https://github.com/acefei/ace-react/blob/master/configs/.eslintrc.js)
  - [.prettierrc.js](https://github.com/acefei/ace-react/blob/master/configs/.prettierrc.js)
  - [.vscode](https://github.com/acefei/ace-react/tree/master/configs/.vscode)

- Multi-stage [Dockerfile](https://github.com/acefei/ace-react/blob/master/configs/Dockerfile) for CI/CD

- Dockerfile against BuildKit to accelarate `docker build`
  - Set `DOCKER_BUILDKIT=1` with docker CLI
  - Set `COMPOSE_DOCKER_CLI_BUILD=1` with docker-compose CLI
  - Using `RUN --mount=type=cache` in Dockerfile which begin with `# syntax = docker/dockerfile:experimental`
