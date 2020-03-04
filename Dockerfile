FROM node

# circumvent the restriction against the default node user
RUN groupmod -g 999 node && usermod -u 999 -g 999 node

ARG USER=docker
ARG UID=1000
ARG GID=1000

RUN addgroup --gid "$GID" "$USER" \
        && adduser \
        --disabled-password \
        --gecos "" \
        --uid "$UID" \
        --gid "$GID" \
        "$USER"

USER $USER
WORKDIR /workspace
