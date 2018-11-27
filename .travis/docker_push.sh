#!/bin/bash

set -o errexit
set -o pipefail

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
docker push "shoginn/adsb:rpi-${APP}"
