#!/bin/sh
#
# Raspberry Pi (berrie) CI script runner for GEOS
#
# Copyright (c) 2018 Regina Obe <lr@pcorp.us>
#
# This is free software; you can redistribute and/or modify it under
# the terms of the GNU Lesser General Public Licence as published
# by the Free Software Foundation.
# See the COPYING file for more information.
#
# auto tools
if true; then
    sh autogen.sh
    ./configure
    make
    make check
fi


# cmake
if false; then
    rm -rf build
    mkdir -p build
    cd build
    cmake ../
    make
    [ -f CMakeCache.txt ] && \
        ctest --output-on-failure . || \
        make check
fi
