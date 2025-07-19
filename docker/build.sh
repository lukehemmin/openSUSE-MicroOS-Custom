#!/bin/bash
set -e
cd "$(dirname "$0")"
mkdir -p ../output
# build image and run
DockerCompose="docker-compose"
if docker compose version >/dev/null 2>&1; then
  DockerCompose="docker compose"
fi
$DockerCompose build
$DockerCompose run --rm build
