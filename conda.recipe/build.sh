#!/bin/bash
set -e
set -x

mkdir -p build && cd build

export CC=gcc
export CXX=g++

cmake ${CMAKE_ARGS} -GNinja \
    -DCMAKE_PREFIX_PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DNANOARROW_IPC=ON \
    "$SRC_DIR"

ninja

# The `install` command will take care of copying the files to the right place
ninja install

cd ../python

$PYTHON -m pip install . --no-build-isolation
