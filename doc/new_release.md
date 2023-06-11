The following steps should be performed after releasing a new Storm version.

1. Check if new Ubuntu or Debian versions are available.
   If yes, add the new versions as base images to the script `storm-basesystem/build_all_storm-basesystem.sh`.

2. Clean-up old Linux version.
   * Remove old versions of Ubuntu and Debian which are not supported anymore from `storm-basesystem/build_all_storm-basesystem.sh`.

3. Create storm-basesystem
   * This step can be skipped if no changes were made in the previous two steps.
   * Run the script `storm-basesystem/build_all_storm-basesystem.sh` to create Docker containers as base for Storm for all currently supported Linux systems.

4. Create carl
   * (Optional) update the Carl version in `carl/build_carl.sh`.
   * Run the script `carl/build_carl.sh` to create Docker containers for the Carl library.

5. Create Storm:
   * Set the new `version` of Storm in `storm/build_storm.sh`.
   * Run the script `storm/build_storm.sh`.
     Note that this step can take more than an hour for building the Storm Docker containers.
     Afterwards, approximately 4GB need to be uploaded. Ensure that you are using a fast internet connection or wait for some time.

6. Create stormpy:
   * Set the new `version` of stormpy in `stormpy/build_stormpy.sh`.
     Note that this version also coincides with the version of Storm which will be used as a base image.
   * Run the script `stormpy/build_stormpy.sh`.
     This step can again take some time and needs to upload larger amounts of data.
