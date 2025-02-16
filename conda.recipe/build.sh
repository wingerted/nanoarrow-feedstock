#!/bin/bash
set -e
set -x

# 将 conda 环境中的 bin 目录放到 PATH 的最前端，确保使用的是 conda 提供的工具
export PATH="$PREFIX/bin:$PATH"

mkdir -p build && cd build

cmake ${CMAKE_ARGS} -GNinja \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    $SRC_DIR

ninja

# The `install` command will take care of copying the files to the right place
ninja install