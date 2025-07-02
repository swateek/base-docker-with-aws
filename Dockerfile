ARG BUILD_VERSION
ARG DOCKER_VERSION="28.3.0"
ARG AWS_CLI_VERSION="2.27.47"

FROM docker:${DOCKER_VERSION} AS build-image
ARG BUILD_VERSION
ARG AWS_CLI_VERSION

RUN apk add --no-cache \
    curl \
    unzip \
    jq \
    openssh-client \
    python3 \
    py3-pip \
    less \
    groff \
    bash

# Download and install AWS CLI
RUN curl -sS -O "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
    unzip -qq "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
    ./aws/install && \
    rm -rf aws "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip"
