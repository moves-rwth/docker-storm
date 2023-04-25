# Base Dockerfile for Storm dependencies
########################################
# The Docker image can be built by executing:
# docker build -t movesrwth/storm-basesystem:latest .
# A different Linux base system image can be set from the commandline with:
# --build-arg LINUX_BASE=<new_base_image>

# Set Linux base image
ARG LINUX_BASE=ubuntu:rolling
FROM $LINUX_BASE
MAINTAINER Matthias Volk <m.volk@utwente.nl>

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
# - ca-certificates is needed for cloning from Github
# - all other dependencies are the recommended packages for Storm (see https://www.stormchecker.org/documentation/obtain-storm/dependencies.html#-debian-and--ubuntu)
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    git \
    cmake \
    libboost-all-dev \
    libcln-dev \
    libgmp-dev \
    libginac-dev \
    automake \
    libglpk-dev \
    libhwloc-dev \
    libz3-dev \
    libxerces-c-dev \
    libeigen3-dev
