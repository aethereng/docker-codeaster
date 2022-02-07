#!/bin/bash

VERSION=4.0.0
cd /work
rm -rf med
mkdir med
wget --no-check-certificate --quiet \
    http://files.salome-platform.org/Salome/other/med-${VERSION}.tar.gz \
    -O med.tar.gz
tar xf med.tar.gz -C med --strip-components 1
cd med
alias python=python3
F77=gfortran CXXFLAGS='-std=gnu++98' PYTHON=/usr/bin/python3 \
    ./configure --disable-mesgerr --with-hdf5=/scif/apps/hdf5 \
        --prefix=/scif/apps/med
make -j 4 && make install
# documentation costs ~100 MB
rm -rf /scif/apps/med/share/doc/med
