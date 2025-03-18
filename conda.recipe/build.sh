#!/bin/bash
set -e
set -x


# 显式指定使用 conda 环境中的 clang 和 clang++（此步可作为保险，同时 PATH 也已修改）
export CC="$BUILD_PREFIX/bin/clang"
export CXX="$BUILD_PREFIX/bin/clang++"

mkdir -p build && cd build

cmake ${CMAKE_ARGS} -GNinja \
    -DCMAKE_PREFIX_PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_CXX_FLAGS=="-fpic" \
    "$SRC_DIR"

ninja

# The `install` command will take care of copying the files to the right place
ninja install
