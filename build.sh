#!/bin/bash
set -e

mkdir -p dist/artifacts

VERSION="5.4.0"
PACKAGE="-1"

docker build --build-arg VERSION=${VERSION} -t strongswan-build .
docker run --rm strongswan-build cat strongswan-${VERSION}.tar.gz > dist/artifacts/strongswan-${VERSION}${PACKAGE}.tar.gz
