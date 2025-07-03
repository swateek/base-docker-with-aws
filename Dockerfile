ARG BUILD_VERSION
ARG DOCKER_VERSION="28.3.0"
ARG AWS_CLI_VERSION="2.27.47"

FROM docker:${DOCKER_VERSION} AS builder
ARG AWS_CLI_VERSION

RUN apk add --no-cache curl unzip bash

RUN curl -sS -O "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
    unzip -qq "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
    cd aws && \
    ./aws/install --install-dir /aws-cli --bin-dir /aws-cli/bin

FROM docker:${DOCKER_VERSION}
COPY --from=builder /aws-cli /usr/local/aws-cli
RUN ln -s /usr/local/aws-cli/bin/aws /usr/local/bin/aws
