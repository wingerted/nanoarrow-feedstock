#!/bin/bash
set -e
set -x

mkdir -p build && pushd build

cmake ${CMAKE_ARGS} -GNinja \
    -DCMAKE_PREFIX_PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DNANOARROW_IPC=ON \
    "$SRC_DIR"

ninja

# The `install` command will take care of copying the files to the right place
ninja install

popd
uv pip install -p $PYTHON python/ -vv --no-deps --no-build-isolation
