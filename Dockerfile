ARG BUILD_VERSION
ARG DOCKER_VERSION="29.2.1"
ARG AWS_CLI_VERSION="2.34.0"

FROM docker:${DOCKER_VERSION} AS builder
ARG AWS_CLI_VERSION

RUN apk update && \
    apk add --no-cache \
        jq \
        aws-cli=${AWS_CLI_VERSION}
