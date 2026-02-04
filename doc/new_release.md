The following steps should be performed to update the Docker images.

## Update storm-basesystem
* Add new versions of Ubuntu and Debian as base images to the CI configuration file `.github/workflows/basesystem.yml`. Make sure to add the same names also in the merge step.
* Remove old versions of Ubuntu and Debian which are not supported anymore from the same configuration file.
* Trigger the action [Build basesystem](https://github.com/stormchecker/docker-storm/actions/workflows/basesystem.yml) in the CI to create Docker images for [storm-basesystem](https://hub.docker.com/r/stormchecker/storm-basesystem/).

## Create storm-dependencies
* Update the versions of the dependencies used in `storm-dependencies/Dockerfile`:
  * [MathSAT](https://mathsat.fbk.eu/download.html)
  * [Spot](https://spot.lre.epita.fr/install.html)
  * [Soplex](https://soplex.zib.de/)
  * [Gurobi](https://github.com/Gurobi/docker-optimizer/tree/master)
* Trigger the action [Build base with dependencies](https://github.com/stormchecker/docker-storm/actions/workflows/dependencies.yml) in the CI to create Docker images for [storm-dependencies](https://hub.docker.com/r/stormchecker/storm-dependencies/).
