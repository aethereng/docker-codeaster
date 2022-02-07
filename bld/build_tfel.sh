#!/bin/bash

VERSION=3.2.1
cd /work
rm -rf tfel
mkdir tfel
wget --no-check-certificate --quiet \
    https://github.com/thelfer/tfel/archive/TFEL-${VERSION}.tar.gz \
    -O tfel.tar.gz
tar xf tfel.tar.gz -C tfel --strip-components 1
cd tfel
mkdir build
cd build
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DTFEL_SVN_REVISION=${VERSION} -DTFEL_APPEND_VERSION=${VERSION} \
    -DCMAKE_Fortran_COMPILER=/usr/bin/gfortran \
    -Dlocal-castem-header=ON -Denable-fortran=OFF \
    -Denable-broken-boost-python-module-visibility-handling=ON \
    -Denable-python-bindings=ON \
    -Denable-cyrano=ON -Denable-aster=ON \
    -Ddisable-reference-doc=ON -Ddisable-website=ON \
    -Denable-portable-build=ON \
    -DPython_ADDITIONAL_VERSIONS=3.6 -Denable-python=ON \
    -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python3 \
    -DPYTHON_LIBRARY:FILEPATH=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6.so \
    -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python3.6 \
    -DCMAKE_INSTALL_PREFIX=/scif/apps/tfel
make -j 4 && make install
ln -s /scif/apps/tfel/bin/mfront-${VERSION} /usr/local/bin/
