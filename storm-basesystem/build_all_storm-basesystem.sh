#!/bin/bash
set -e

# Build all images of Linux systems currently supporting Storm
##############################################################

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

# Build Debian 12 "Bookworm"
echo "### Building Debian 12 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:debian-12 --build-arg LINUX_BASE=debian:12 .
docker push movesrwth/storm-basesystem:debian-12
echo "### Building Debian 12 base finished."

# Build Ubuntu 23.10 "Lunar Lobster"
echo "### Building Ubuntu 23.10 base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:ubuntu-23.10 --build-arg LINUX_BASE=ubuntu:23.10 .
docker push movesrwth/storm-basesystem:ubuntu-23.10
echo "### Building Ubuntu 23.10 base finished."

# Build latest Ubuntu release version
echo "### Building latest Ubuntu base..."
docker build --no-cache --pull -t movesrwth/storm-basesystem:latest .
docker push movesrwth/storm-basesystem:latest
echo "### Building latest Ubuntu base finished."
