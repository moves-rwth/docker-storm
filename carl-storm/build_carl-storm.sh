#!/bin/bash
set -e

# Build images for Carl-storm library
#####################################

version=14.25

echo "### Clone repository..."
git clone https://github.com/moves-rwth/carl-storm -b $version
cd carl-storm

echo "### Building docker image for Carl-storm $version ..."
#docker build . --no-cache --pull --build-arg build_type=Release --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/carl-storm:$version
#docker push movesrwth/carl-storm:$version
echo "### Building docker image for Carl-storm $version finished."

echo "### Building docker image for Carl-storm $version in debug configuration ..."
docker build . --no-cache --pull --build-arg build_type=Debug --build-arg BASE_IMAGE=movesrwth/storm-basesystem:latest -t movesrwth/carl-storm:$version-debug
#docker push movesrwth/carl-storm:$version-debug
echo "### Building docker image for Carl-storm $version in debug configuration finished."
