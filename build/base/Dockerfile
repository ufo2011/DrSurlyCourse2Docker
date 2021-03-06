FROM ubuntu:18.04

MAINTAINER Michael Karlesky <michael@karlesky.net>


# Update Ubuntu package management environment
# Nano is just a convenient text editor for use within the container
# Unzip is unarchives course materials
RUN set -ex \
  && apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y nano unzip --no-install-recommends


##
## Grab all our assets pulled into image
##
  
COPY assets/qemu assets/qemu


##
## Custom Qemu for ARM emulation
##

# Install tools needed to build Qemu and needed by course mini-projects (e.g. DIY mocking material)
RUN set -ex \
  && apt-get update \
  && apt-get install -y gcc python pkg-config build-essential libglib2.0-dev --no-install-recommends

# Build Qemu
RUN set -ex \
  && cd /assets/qemu/qemu-stable-1.1 \
  && ./configure --target-list=arm-softmmu --disable-docs --disable-pie --disable-usb-redir --disable-guest-base --disable-slirp --disable-nptl --disable-blobs --audio-drv-list="" --audio-card-list="" --disable-linux-aio --disable-curl --disable-curses --disable-zlib-test \
  && make \
  && cd /
  
# Copy built Qemu into tools directory
RUN mv /assets/qemu/qemu-stable-1.1/arm-softmmu/qemu-system-arm /usr/local/bin


# Cleanup
RUN set -ex \
  # Remove Qemu source directory
  && rm -rf /assets \
  # Remove packages not needed in the final course environment
  && apt-get purge -y --auto-remove python pkg-config libglib2.0-dev
  

##
## Development environemnt: compiler toolchain & supporting tools
##

# Install packages needed for ARM-based cross-compiling
RUN set -ex \
  && apt-get update \
  && apt-get install -y gcc-arm-none-eabi libnewlib-arm-none-eabi libglib2.0-0 --no-install-recommends

# Install Ruby
RUN set -ex \
  # Install apt-add-repository command
  && apt-get update \
  && apt-get install -y software-properties-common --no-install-recommends  \
  && apt-add-repository -y ppa:brightbox/ruby-ng \
  && apt-get update \
  && apt-get install -y ruby2.4 --no-install-recommends \
  && apt-get purge -y --auto-remove software-properties-common

##
## Cleanup
##
RUN set -ex \
  # Clean up apt-get leftovers and package lists
  && apt-get autoremove \
  && apt-get clean all \
  && apt-get autoclean all \
  && rm -rf /var/lib/apt/lists/* \
  # Unneeded Debconf templates
  && rm /var/cache/debconf/*

# When the container launches, drop into a shell
ENTRYPOINT ["/bin/bash"]

