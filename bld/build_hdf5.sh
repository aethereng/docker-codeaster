#!/bin/bash

VERSION=1.10.3
cd /work
rm -rf hdf5
mkdir hdf5
wget --no-check-certificate --quiet \
    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-${VERSION}/src/hdf5-${VERSION}.tar.gz \
    -O hdf.tar.gz
tar xf hdf.tar.gz -C hdf5 --strip-components 1
cd hdf5
./configure --prefix=/scif/apps/hdf5
make -j 4 && make install 