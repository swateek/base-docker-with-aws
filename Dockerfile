ARG BUILD_VERSION
ARG DOCKER_VERSION="28.3.0"
ARG AWS_CLI_VERSION="2.27.47-r0"

FROM docker:${DOCKER_VERSION} AS builder
ARG AWS_CLI_VERSION

RUN apk update && \
    apk add --no-cache aws-cli

# RUN curl -sS -O "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
#     unzip -qq "awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" && \
#     ./aws/install --install-dir /aws-cli --bin-dir /aws-cli/bin

# FROM docker:${DOCKER_VERSION}
# COPY --from=builder /aws-cli /usr/local/aws-cli
# RUN ln -s /aws-cli/bin/aws /usr/local/bin/aws
