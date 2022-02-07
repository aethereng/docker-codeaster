#!/bin/bash

VERSION=4.0.3_aster3
cd /work
rm -rf parmetis
hg clone --noupdate http://hg.code.sf.net/p/prereq/parmetis parmetis
cd parmetis
hg update ${VERSION}
make config CFLAGS="-fPIC -DINTSIZE64" prefix=/scif/apps/parmetis
make -j 4 && make install
