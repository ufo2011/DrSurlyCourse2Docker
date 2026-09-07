#!/bin/bash

docker build -t throwtheswitch/drsurly-course2:latest -f build/release/Dockerfile .
# To build a local test image without pushing:
#   docker build -t throwtheswitch/drsurly-course2:dev -f build/release/Dockerfile .