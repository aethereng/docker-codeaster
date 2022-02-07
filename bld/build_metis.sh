#!/bin/bash

VERSION=5.1.0_aster4
cd /work
rm -rf metis
hg clone --noupdate http://hg.code.sf.net/p/prereq/metis metis
cd metis
hg update ${VERSION}
make config prefix=/scif/apps/metis
make -j 4 && make install
