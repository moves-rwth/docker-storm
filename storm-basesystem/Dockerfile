# Base Dockerfile for Storm dependencies
########################################
# The Docker image can be built by executing:
# docker build -t yourusername/storm-basesystem .
# A different Linux base system image can be set from the commandline with:
# --build-arg BASE_IMAGE=<new_base_image>

# Set Linux base image
ARG BASE_IMAGE=ubuntu:rolling
FROM $BASE_IMAGE
LABEL org.opencontainers.image.authors="dev@stormchecker.org"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
# - ca-certificates is needed for cloning from Github
# - all other dependencies are the recommended packages for Storm (see https://www.stormchecker.org/documentation/obtain-storm/dependencies.html#-debian-and--ubuntu)
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    automake \
    ca-certificates \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libcln-dev \
    libginac-dev \
    libglpk-dev \
    libgmp-dev \
    libhwloc-dev \
    libeigen3-dev \
    libxerces-c-dev \
    libz3-dev
