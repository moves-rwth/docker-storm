#!/bin/bash
set -e

# Build images for Storm
########################
# This script downloads a clean Storm repository and uses the Dockerfile available in the Storm repository to create the Docker images.

version=1.8.0
cmake_args_release="-DSTORM_DEVELOPER=OFF -DSTORM_LOG_DISABLE_DEBUG=ON -DSTORM_PORTABLE=ON -DSTORM_USE_SPOT_SHIPPED=ON"
cmake_args_debug="-DSTORM_DEVELOPER=ON -DSTORM_LOG_DISABLE_DEBUG=OFF -DSTORM_PORTABLE=ON -DSTORM_USE_SPOT_SHIPPED=ON"

echo "### Clone repository..."
git clone https://github.com/moves-rwth/storm -b $version
cd storm

echo "### Building docker image for Storm $version ..."
docker build --no-cache --pull --build-arg build_type=Release --build-arg cmake_args="$cmake_args_release" --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/storm:$version .
docker push movesrwth/storm:$version
echo "### Building docker image for Storm $version finished."

echo "### Building docker image for Storm $version in debug configuration ..."
docker build --no-cache --pull --build-arg build_type=Debug --build-arg cmake_args="$cmake_args_debug" --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/storm:$version-debug .
docker push movesrwth/storm:$version-debug
echo "### Building docker image for Storm $version in debug configuration finished."

echo "### Updating stable images ..."
docker image tag movesrwth/storm:$version movesrwth/storm:stable
docker push movesrwth/storm:stable
docker image tag movesrwth/storm:$version-debug movesrwth/storm:stable-debug
docker push movesrwth/storm:stable-debug
echo "### Updating stable images finished."
