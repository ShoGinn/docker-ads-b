#!/bin/bash

set -o errexit
set -o pipefail

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
TAG="${TRAVIS_BRANCH}" docker-compose push "${SUB_IMAGE}"
