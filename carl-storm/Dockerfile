# Dockerfile for Carl-storm library
###################################
# The Docker image can be built by executing:
# docker build -t movesrwth/carl-storm:latest .
# A different base image can be set from the commandline with:
# --build-arg BASE_IMAGE=<new_base_image>

# Set base image
ARG BASE_IMAGE=movesrwth/storm-basesystem:latest
FROM $BASE_IMAGE
MAINTAINER Matthias Volk <m.volk@utwente.nl>


# Configuration arguments
#########################
# The arguments can be set from the commandline with:
# --build-arg <arg_name>=<value>

# Branch of the Carl repo to use
ARG carl_branch=master
# CMake build type
ARG build_type=Release
# Number of threads to use for parallel compilation
ARG no_threads=2



# Build Carl-storm
##################
WORKDIR /opt/

# Obtain Carl-storm from public repository
RUN git clone -b $carl_branch https://github.com/moves-rwth/carl-storm.git

# Switch to build directory
RUN mkdir -p /opt/carl-storm/build
WORKDIR /opt/carl-storm/build

# Configure Carl-storm
RUN cmake .. -DCMAKE_BUILD_TYPE=$build_type -DUSE_CLN_NUMBERS=ON -DUSE_GINAC=ON -DTHREAD_SAFE=ON

# Build Carl-storm library
RUN make lib_carl -j $no_threads
