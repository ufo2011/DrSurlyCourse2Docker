FROM throwtheswitch/drsurly-course2-base:2.0.0

MAINTAINER Michael Karlesky <michael@karlesky.net>


##
## Copy assets for inclusion in image
##

COPY assets/gems              /assets/gems
COPY assets/course            /usr/local/bin
COPY assets/awesomesauce2.zip /home/drsurly/awesomesauce2.zip

RUN chmod +x /usr/local/bin/course


# Install Ceedling and its dependencies
RUN gem install --force --local --no-document /assets/gems/*.gem \
  && rm -rf /assets


# Symlink QEMU to the path expected by course project files (old image had it at /qemu/)
RUN mkdir -p /qemu && ln -s /usr/bin/qemu-system-arm /qemu/qemu-system-arm

RUN mkdir -p /lab

# ENTRYPOINT set in base image

WORKDIR /lab
