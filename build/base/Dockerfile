FROM ubuntu:22.04

MAINTAINER Michael Karlesky <michael@karlesky.net>

# Prevent interactive prompts during package installation (tzdata etc.)
ENV DEBIAN_FRONTEND=noninteractive


##
## Development environment: compiler toolchain, QEMU, Ruby, and supporting tools
##

# Install everything from Ubuntu 22.04 repos — no PPA or from-source builds needed
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
       nano \
       unzip \
       gcc \
       python3 \
       pkg-config \
       build-essential \
       gcc-arm-none-eabi \
       libnewlib-arm-none-eabi \
       qemu-system-arm \
       ruby \
       ruby-dev \
  && apt-get autoremove \
  && apt-get clean all \
  && apt-get autoclean all \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/debconf/*

# When the container launches, drop into a shell
ENTRYPOINT ["/bin/bash"]
