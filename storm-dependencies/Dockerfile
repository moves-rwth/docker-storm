# Dockerfile installing all dependencies for Storm
##################################################
# The Docker image can be built by executing:
# docker build -t yourusername/storm-dependencies .
# A different base image can be set from the commandline with:
# --build-arg BASE_IMAGE=<new_base_image>

# Set base image
ARG BASE_IMAGE=movesrwth/carl-storm:stable
FROM $BASE_IMAGE
ARG TARGETPLATFORM
LABEL org.opencontainers.image.authors="dev@stormchecker.org"

# Specify configurations
# These configurations can be set from the commandline with:
# --build-arg <config_name>=<value>

# Specify number of threads to use for parallel compilation
ARG no_threads=2

# Specify library versions
ARG MATHSAT_VERSION=5.6.11
ARG SPOT_VERSION=2.13
ARG SOPLEX_VERSION=714
ARG GUROBI_VERSION=12.0.2
ARG GUROBI_SHORT_VERSION=12.0

# Carl-storm is already installed in the base image


# Install additional packages
#############################
RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
	curl \
	gnupg2 \
	wget \
    && update-ca-certificates


# Install Spot
##############
# Based on https://gitlab.lre.epita.fr/spot/spot/-/issues/544#note_29198
#RUN wget -q -O - https://www.lrde.epita.fr/repo/debian.gpg | apt-key add - \
#    && echo 'deb [trusted=true] https://download.opensuse.org/repositories/home:/adl/xUbuntu_22.04/ ./' >/etc/apt/sources.list \
#    && apt-get update \
#    && apt-get install -y libspot-dev

# Manual installation
WORKDIR /opt/
RUN curl -L -o spot.tar.gz http://www.lre.epita.fr/dload/spot/spot-${SPOT_VERSION}.tar.gz \
    && tar -xzf spot.tar.gz \
    && rm spot.tar.gz \
    && cd spot-${SPOT_VERSION} \
    && ./configure --disable-python \
    && make -j $no_threads \
    && make install -j $no_threads \
    && cd /opt \
    && rm -r spot-${SPOT_VERSION}


# Install MathSAT
#################
WORKDIR /opt/
RUN curl -L -o mathsat5.tar.gz "https://mathsat.fbk.eu/release/mathsat-${MATHSAT_VERSION}-linux-x86_64.tar.gz" \
    && tar -xzf mathsat5.tar.gz \
    && mv mathsat-${MATHSAT_VERSION}-linux-x86_64 mathsat5 \
    && rm mathsat5.tar.gz
ENV MATHSAT_ROOT=/opt/mathsat5


# Install SoPlex
################
WORKDIR /opt/
RUN curl -L -o soplex.tar.gz https://github.com/scipopt/soplex/archive/refs/tags/release-${SOPLEX_VERSION}.tar.gz \
    && tar -xzf soplex.tar.gz \
    && rm soplex.tar.gz \
    && mv soplex-release-${SOPLEX_VERSION} soplex \
    && mkdir soplex/build \
    && cd soplex/build \
    && cmake .. \
    && make -j $no_threads \
    && make install -j $no_threads \
    && rm -r /opt/soplex


# Install Gurobi
#################
# From https://github.com/Gurobi/docker-optimizer/blob/master/12.0.2/Dockerfile
WORKDIR /opt
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        export GRB_PLATFORM="armlinux64"; \
    else \
        export GRB_PLATFORM="linux64"; \
    fi \
    && wget -v https://packages.gurobi.com/${GUROBI_SHORT_VERSION}/gurobi${GUROBI_VERSION}_$GRB_PLATFORM.tar.gz \
    && tar -xvf gurobi${GUROBI_VERSION}_$GRB_PLATFORM.tar.gz  \
    && rm *.tar.gz \
    && mv -f gurobi* gurobi \
    && mv -f gurobi/$GRB_PLATFORM* gurobi/linux \
    && rm -rf gurobi/linux/docs

ENV GUROBI_HOME=/opt/gurobi/linux
ENV PATH=$PATH:$GUROBI_HOME/bin
ENV LD_LIBRARY_PATH=$GUROBI_HOME/lib
