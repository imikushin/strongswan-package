#!/bin/bash
set -e

. ./.docker-env.arm || echo "Need to source .docker-env.arm to access Docker on ARM"

mkdir -p dist/artifacts

VERSION="5.4.0"
PACKAGE="-1"
VARIANT="_arm"

docker build --build-arg VERSION=${VERSION} -t strongswan-build -f Dockerfile.arm .
docker run --rm strongswan-build cat strongswan-${VERSION}.tar.gz > dist/artifacts/strongswan-${VERSION}${PACKAGE}${VARIANT}.tar.gz
