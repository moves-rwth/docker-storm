#!/bin/bash
set -e

# Build images for stormpy
##########################
# This script downloads a clean Storm repository and uses the Dockerfile available in the stormpy repository to create the Docker images.

version=1.8.0

echo "### Clone repository..."
git clone https://github.com/moves-rwth/stormpy -b $version
cd stormpy

echo "### Building docker image for stormpy $version ..."
docker build --no-cache --pull --build-arg build_type=Release --build-arg setup_args="" --build-arg BASE_IMAGE=movesrwth/storm:$version -t movesrwth/stormpy:$version .
docker push movesrwth/stormpy:$version
echo "### Building docker image for stormpy $version finished."

echo "### Building docker image for stormpy $version in debug configuration ..."
docker build --no-cache --pull --build-arg build_type=Debug --build-arg setup_args="--debug" --build-arg BASE_IMAGE=movesrwth/storm:$version-debug -t movesrwth/stormpy:$version-debug .
docker push movesrwth/stormpy:$version-debug
echo "### Building docker image for stormpy $version in debug configuration finished."

echo "### Updating stable images ..."
docker image tag movesrwth/stormpy:$version movesrwth/stormpy:stable
docker push movesrwth/stormpy:stable
docker image tag movesrwth/stormpy:$version-debug movesrwth/stormpy:stable-debug
docker push movesrwth/stormpy:stable-debug
echo "### Updating stable images finished."
