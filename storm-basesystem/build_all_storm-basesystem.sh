#!/bin/bash
set -e

# Build all images of Linux systems currently supporting Storm
##############################################################

# Build Debian 10 "Buster"
echo "### Building Debian 10 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:debian-10 --build-arg LINUX_BASE=debian:10 .
docker push movesrwth/storm-basesystem:debian-10
echo "### Building Debian 10 base finished."

# Build Ubuntu 20.04 LTS "Focal Fossa"
echo "### Building Ubuntu 20.04 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:ubuntu-20.04 --build-arg LINUX_BASE=ubuntu:20.04 .
docker push movesrwth/storm-basesystem:ubuntu-20.04
echo "### Building Ubuntu 20.04 base finished."

# Build Debian 11 "Bullseye"
echo "### Building Debian 11 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:debian-11 --build-arg LINUX_BASE=debian:11 .
docker push movesrwth/storm-basesystem:debian-11
echo "### Building Debian 11 base finished."

# Build Ubuntu 22.04 LTS "Jammy Jellyfish"
echo "### Building Ubuntu 22.04 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:ubuntu-22.04 --build-arg LINUX_BASE=ubuntu:22.04 .
docker push movesrwth/storm-basesystem:ubuntu-22.04
echo "### Building Ubuntu 22.04 base finished."

# Build Ubuntu 23.04 "Lunar Lobster"
echo "### Building Ubuntu 23.04 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:ubuntu-23.04 --build-arg LINUX_BASE=ubuntu:23.04 .
docker push movesrwth/storm-basesystem:ubuntu-23.04
echo "### Building Ubuntu 23.04 base finished."

# Build latest Ubuntu release version
echo "### Building latest Ubuntu base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:latest .
docker push movesrwth/storm-basesystem:latest
echo "### Building latest Ubuntu base finished."
