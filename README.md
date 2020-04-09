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
  - [setupTests.js](https://github.com/acefei/ace-react/tree/master/configs/setupTests.js)
    - We don't need to add setupFilesAfterEnv for Jest config and just put setupTests.js into src/ dir, the rest of thing has been done by react-script (3.4.0) which is installed by create-react-app.

- Multi-stage [Dockerfile](https://github.com/acefei/ace-react/blob/master/configs/Dockerfile) for CI/CD

- Dockerfile against BuildKit to accelarate `docker build`
  - Set `DOCKER_BUILDKIT=1` with docker CLI
  - Set `COMPOSE_DOCKER_CLI_BUILD=1` with docker-compose CLI
  - Using `RUN --mount=type=cache` in Dockerfile which begin with `# syntax = docker/dockerfile:experimental`

## Read More
[useEffect and exhaustive-deps](https://pauldrummond.dev/posts/useeffect-and-exhaustive-deps/)
