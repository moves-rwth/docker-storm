The following steps should be performed after releasing a new Storm version.

1. Update storm-basesystem
   * Add new versions of Ubuntu and Debian as base images to the CI configuration file `.github/workflows/basesystem.yml`.
   * Remove old versions of Ubuntu and Debian which are not supported anymore from the same configuration file.
   * Trigger the action [Build basesystem](https://github.com/moves-rwth/docker-storm/actions/workflows/basesystem.yml) in the CI to create Docker images for [storm-basesystem](https://hub.docker.com/r/movesrwth/storm-basesystem/).

2. Create carl-storm
   * Trigger the action [Release Docker](https://github.com/moves-rwth/carl-storm/actions/workflows/release_docker.yml) from the right tag/branch with the right version tag in the CI to create Docker images for [carl-storm](https://hub.docker.com/r/movesrwth/carl-storm/).
     Also create Docker images for the `stable` version.

3. Create storm-dependencies
   * Trigger the action [Build base with dependencies](https://github.com/moves-rwth/docker-storm/actions/workflows/dependencies.yml) in the CI to create Docker images for [storm-dependencies](https://hub.docker.com/r/movesrwth/storm-dependencies/).

4. Create Storm
   * Trigger the action [Release Docker](https://github.com/moves-rwth/storm/actions/workflows/release_docker.yml) from the right tag/branch with the right version tag in the CI to create Docker images for [storm](https://hub.docker.com/r/movesrwth/storm/).
     Also create Docker images for the `stable` version.

5. Create stormpy
   * Trigger the action [Release Docker](https://github.com/moves-rwth/stormpy/actions/workflows/release_docker.yml) from the right tag/branch with the right version tag in the CI to create Docker images for [stormpy](https://hub.docker.com/r/movesrwth/stormpy/).
     Also create Docker images for the `stable` version.
