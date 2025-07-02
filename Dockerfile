ARG BUILD_VERSION
ARG DOCKER_VERSION="28.3.0"
ARG AWS_CLI_VERSION="2.27.47"

FROM docker:${DOCKER_VERSION} AS build-image
ARG BUILD_VERSION
ARG AWS_CLI_VERSION

RUN apk update
RUN apk add --no-cache \
    curl \
    unzip \
    jq \
    openssh-client \
    python3 \
    py3-pip \
    less \
    groff \
    bash \
    aws-cli

# # Install glibc (required by AWS CLI v2)
# ENV GLIBC_VERSION=2.35-r1

# RUN curl -sSL -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
#     curl -sSL -o /glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
#     apk add --no-cache /glibc.apk && \
#     rm -f /glibc.apk

# # Download and install AWS CLI
# RUN curl -sS -O "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
#     unzip -qq "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
#     ./aws/install && \
#     rm -rf aws "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip"
