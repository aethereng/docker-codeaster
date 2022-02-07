#!/bin/bash

VERSION=6.0.4_aster7
cd /work
rm -rf scotch_mpi
hg clone --noupdate http://hg.code.sf.net/p/prereq/scotch scotch_mpi
cd scotch_mpi
hg update ${VERSION}
cd src
sed -i -e 's/CFLAGS\s*=/CFLAGS = -Wl,--no-as-needed/g' \
    -e 's/CCD\s*=.*$/CCD = mpicc/g' Makefile.inc
make scotch
make ptscotch
make esmumps
mkdir -p /scif/apps/scotch_mpi
make install prefix=/scif/apps/scotch_mpi
