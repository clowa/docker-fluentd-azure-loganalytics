[![Build docker images](https://github.com/clowa/docker-fluentd-azure-loganalytics/actions/workflows/docker-buildx.yml/badge.svg)](https://github.com/clowa/docker-fluentd-azure-loganalytics/actions/workflows/docker-buildx.yml)
[![Check base image update](https://github.com/clowa/docker-fluentd-azure-loganalytics/actions/workflows/check-base-image-update.yml/badge.svg)](https://github.com/clowa/docker-fluentd-azure-loganalytics/actions/workflows/check-base-image-update.yml)

# Overview

This repository contains a Dockerfile for building a Fluentd image that can be used to send logs to Azure Log Analytics.

Supported platforms:

- `linux/amd64`
- `linux/arm64/v8`

## Build the image locally

```bash
docker build -t clowa/fluentd-azure-loganalytics --push .
```

## CI setups

- Checks every night if the base image has been updated. This is currently limited to to the used tag of the image.
