#!/bin/bash
set -e

# Install (optional) dependencies for Storm
###########################################
carl_version=14.25

echo "### Building docker image for dependencies of Storm ..."
docker build --no-cache --pull --build-arg BASE_IMAGE=movesrwth/carl-storm:$carl_version -t movesrwth/storm-dependencies:latest .
docker push movesrwth/storm-dependencies:latest
echo "### Building docker image for dependencies of Storm finished."

echo "### Building docker image for dependencies of Storm in debug configuration ..."
docker build --no-cache --pull --build-arg BASE_IMAGE=movesrwth/carl-storm:$carl_version-debug -t movesrwth/storm-dependencies:latest-debug .
docker push movesrwth/storm-dependencies:latest-debug
echo "### Building docker image for dependencies of Storm in debug configuration finished."
