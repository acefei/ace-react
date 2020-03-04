# syntax = docker/dockerfile:experimental
FROM node:alpine as base
WORKDIR /app

COPY package*.json .

RUN --mount=type=cache,target=/app/node_modules \
    --mount=type=cache,target=/root/.npm \
        npm install

# linter stage
FROM base as linter
COPY .eslintrc.js .prettierrc.js .
COPY src ./src
RUN --mount=type=cache,target=/app/node_modules \
        npm run lint 

# builder stage
FROM base as builder
COPY public ./public
COPY src ./src
RUN --mount=type=cache,target=/app/node_modules \
        npm run build 

# publisher stage
FROM nginx as publisher
COPY --from=builder /app/build /usr/share/nginx/html
