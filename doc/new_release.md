The following steps should be performed after releasing a new Storm version.

1. Update storm-basesystem
   * Add new versions of Ubuntu and Debian as base images to the CI configuration file `.github/workflows/basesystem.yml`.
   * Remove old versions of Ubuntu and Debian which are not supported anymore from the same configuration file.
   * If changes were made, then manually trigger the Github Action `Build basesystem` in the CI. This creates Docker containers as base for Storm for all currently supported Linux systems.

2. Create carl-storm
   * (Optional) update the Carl version in `carl-storm/build_carl-storm.sh`.
   * Run the script `carl-storm/build_carl-storm.sh` to create Docker containers for the Carl library. This should always be done because even if the Carl version did not change the underlying Ubuntu version might have changed.

3. Create storm-dependencies
   * (Optional) update the Carl version in `.github/workflows/dependencies.yml`.
   * Manually trigger the Github Action `Build base with dependencies` in the CI. This creates Docker containers containing the dependencies for Storm (carl, Spot, MathSAT, SoPlex).

4. Create Storm:
   * Set the new `version` of Storm in `storm/build_storm.sh`.
   * Run the script `storm/build_storm.sh`.
     Note that this step can take more than an hour for building the Storm Docker containers.
     Afterwards, approximately 4GB need to be uploaded. Ensure that you are using a fast internet connection or wait for some time.

5. Create stormpy:
   * Set the new `version` of stormpy in `stormpy/build_stormpy.sh`.
     Note that this version also coincides with the version of Storm which will be used as a base image.
   * Run the script `stormpy/build_stormpy.sh`.
     This step can again take some time and needs to upload larger amounts of data.
