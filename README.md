# Dockerfiles related to Storm

All Docker containers related to Storm are hosted at the [movesrwth organization](https://hub.docker.com/u/movesrwth) on DockerHub.
This repository provides Dockerfiles for the base images used by Storm.
For the libraries [storm](https://github.com/moves-rwth/storm), [stormpy](https://github.com/moves-rwth/stormpy) and [carl-storm](https://github.com/moves-rwth/carl-storm), Dockerfiles and dedicated CI workflows for creating and deploying Docker images are available in the respective repositories.

## Actions
Docker containers can be automatically generated via [Github Actions](https://github.com/moves-rwth/docker-storm/actions/).
- `Build basesystem`: builds all base systems for Storm.
- `Build base with dependencies`: builds Docker containers containing all dependencies for Storm.

## File structure
- [storm-basesystem](storm-basesystem): Dockerfile and build script for the Linux base images with the dependencies required by Storm.
- [storm-dependencies](storm-dependencies): Dockerfile and build script preparing the dependencies for Storm (Spot, MathSAT, SoPlex, etc.)
- [doc](doc): General documentation, for example on building Docker containers for new releases.

## Configuration options
- The configuration options are given at the top of each Dockerfile.
   A configuration `arg_name` can be changed from the commandline by adding `--build-arg <arg_name>=<value>`.
- Common configurations options are:
    * The base image `BASE_IMAGE` used for the Dockerfile.
- The resources for Docker (number of CPUs, memory, etc.) can be configured in the Docker settings.
