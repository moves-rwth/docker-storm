# Dockerfiles related to Storm

All Docker containers related to Storm are hosted at the [movesrwth organization](https://hub.docker.com/u/movesrwth) on DockerHub.
The Dockerfiles are present in the corresponding repositories.

## File structure
- [storm-basesystem](storm-basesystem): Dockerfile and build script for the Linux base images with the dependencies required by Storm.
- [carl-storm](carl-storm): Build script for [Carl-storm library](https://github.com/moves-rwth/carl-storm).
- [storm](storm): Build script for [Storm](https://github.com/moves-rwth/storm/).
- [stormpy](stormpy): Build script for [stormpy](https://github.com/moves-rwth/stormpy/).
- [doc](doc): General documentation, for example on building Docker containers for new releases.

## Configuration options
- The configuration options are given at the top of each Dockerfile.
   A configuration `arg_name` can be changed from the commandline by adding `--build-arg <arg_name>=<value>`.
- Common configurations options are:
    * The base image `BASE_IMAGE` used for the Dockerfile.
    * The CMake build type `build_type` can be set to either `Release` or `Debug`.
    * The number of threads `no_threads` to use for parallel compilation.
- The resources for Docker (number of CPUs, memory, etc.) can be configured in the Docker settings.
