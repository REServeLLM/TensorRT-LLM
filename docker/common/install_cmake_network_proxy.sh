#!/bin/bash

set -ex

ARCH=$(uname -m)
CMAKE_VERSION="3.24.4"

PARSED_CMAKE_VERSION=$(echo $CMAKE_VERSION | sed 's/\.[0-9]*$//')
CMAKE_FILE_NAME="cmake-${CMAKE_VERSION}-linux-${ARCH}"
RELEASE_URL_CMAKE=https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_FILE_NAME}.tar.gz

PROXY_SERVER="http://127.0.0.1:7890"
http_proxy=${PROXY_SERVER} https_proxy=${PROXY_SERVER} wget --no-verbose ${RELEASE_URL_CMAKE} -P /tmp

tar -xf /tmp/${CMAKE_FILE_NAME}.tar.gz -C /usr/local/
ln -s /usr/local/${CMAKE_FILE_NAME} /usr/local/cmake

echo 'export PATH=$PATH:/usr/local/cmake/bin' >> "${ENV}"
