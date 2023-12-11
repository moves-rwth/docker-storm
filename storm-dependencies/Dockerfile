# Dockerfile installing all dependencies for Storm
##################################################
# The Docker image can be built by executing:
# docker build -t yourusername/storm-deps .
# A different base image can be set from the commandline with:
# --build-arg BASE_IMAGE=<new_base_image>

# Set base image
ARG BASE_IMAGE=movesrwth/carl-storm:stable
FROM $BASE_IMAGE
MAINTAINER Matthias Volk <m.volk@tue.nl>

# Specify configurations
# These configurations can be set from the commandline with:
# --build-arg <config_name>=<value>
# Specify MathSAT version
ARG mathsat_version=5.6.10
# Specify SoPlex version
ARG soplex_version=604

# Carl-storm is already installed in the base image

# Install additional packages
#############################
RUN apt-get -y update; apt-get -y install curl gnupg2 wget


# Install Spot
##############
RUN wget -q -O - https://www.lrde.epita.fr/repo/debian.gpg | apt-key add -
RUN echo 'deb http://www.lrde.epita.fr/repo/debian/ stable/' >> /etc/apt/sources.list
RUN apt-get update; apt-get -y install libspot-dev


# Install MathSAT
#################
WORKDIR /opt/
# Obtain MathSAT 5
RUN curl -L -o mathsat5.tar.gz "https://mathsat.fbk.eu/download.php?file=mathsat-$mathsat_version-linux-x86_64.tar.gz"
RUN tar -xzf mathsat5.tar.gz && mv mathsat-$mathsat_version-linux-x86_64 mathsat5 && rm mathsat5.tar.gz


# Install SoPlex
################
# Obtain Soplex
RUN curl -L -o soplex.tar.gz https://github.com/scipopt/soplex/archive/refs/tags/release-$soplex_version.tar.gz
RUN tar -xzf soplex.tar.gz && rm soplex.tar.gz && mv soplex-release-$soplex_version soplex
RUN mkdir soplex/build
WORKDIR /opt/soplex/build
RUN cmake .. && make && make install
