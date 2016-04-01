#!/bin/bash
set -ev

here=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
. $here/_env.sh

docker login -e noemail -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
docker tag -f "$REPO:$BUILD_TAG" "$REPO:latest"
docker push "$REPO:$BUILD_TAG"
docker push "$REPO:latest"
