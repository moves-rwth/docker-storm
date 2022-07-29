#!/bin/bash
set -e

# Build images for Carl library
###############################

echo "### Building docker image for Carl ..."
docker build --no-cache --pull --build-arg carl_branch=master14 --build-arg build_type=Release --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/carl:master14 .
docker push movesrwth/carl:master14
echo "### Building docker image for Carl finished."

echo "### Building docker image for Carl in debug configuration ..."
docker build --no-cache --pull --build-arg carl_branch=master14 --build-arg build_type=Debug --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/carl:master14-debug .
docker push movesrwth/carl:master14-debug
echo "### Building docker image for Carl in debug configuration finished."
