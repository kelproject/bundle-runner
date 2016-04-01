#!/bin/bash
set -ev

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

docker pull "$REPO" || true
docker build --tag "$REPO:$BUILD_TAG" .
