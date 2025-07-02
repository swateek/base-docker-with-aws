# Base Docker With AWS

An basic docker image to run AWS commands inside.

This is intended to be used with GitLab's CI/CD pipeline as a docker image.

| Package  | Version   |
| -------- | --------- |
| `DOCKER` | `28.3.0`  |
| `AWSCLI` | `2.27.47` |

## Getting Started

1. Setting up development environment

```bash
    pre-commit install
```

2. Helpful commands

```bash

# Build the docker locally
docker build -t base-builder-docker .

# (For debug)
docker build --progress=plain -t base-builder-docker .

# Run the docker locally, get into docker
docker run --name base-builder-docker --rm -ti base-builder-docker bash

```

## Usage

1. On GitLab CI

```yaml
job-build:
  image: swateekj/docker-aws:latest
  stage: build
  script: |
    echo "Your commands go here"
  rules:
    - if: $CI_PIPELINE_SOURCE == 'merge_request_event'
```

2. Testing Image

```bash
echo "USE db; SELECT * FROM users_tbl;" > tmp.sql
export MYSQL_PWD=tmp123
mysql -h "host" -u "user" -D "db" < tmp.sql
```

## Notes

1. Latest `aws-cli` can be looked up from [this link](https://raw.githubusercontent.com/aws/aws-cli/v2/CHANGELOG.rst).

2. Latest `mysql` version needs to be googled to get the exact filename
