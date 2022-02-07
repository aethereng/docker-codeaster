#!/bin/bash

VERSION=5.1.2_aster6
cd /work
rm -rf mumps_seq
hg clone --noupdate http://hg.code.sf.net/p/prereq/mumps mumps_seq
cd mumps_seq
hg update ${VERSION}
LIBPATH="/scif/apps/scotch_seq/lib /scif/apps/metis/lib /scif/apps/parmetis/lib" \
    INCLUDES="/scif/apps/scotch_seq/include /scif/apps/metis/include /scif/apps/parmetis/include" \
    python3 ./waf configure --enable-openmp --enable-metis --enable-scotch \
        --install-tests --prefix=/scif/apps/mumps_seq
python3 ./waf build --jobs=1
python3 ./waf install --jobs=1
