ARG BUILD_VERSION
ARG DOCKER_VERSION="28.3.0"
ARG AWS_CLI_VERSION="2.27.25-r0"

FROM docker:${DOCKER_VERSION} AS builder
ARG AWS_CLI_VERSION

RUN apk update && \
    apk add --no-cache \
        jq \
        aws-cli=${AWS_CLI_VERSION}
