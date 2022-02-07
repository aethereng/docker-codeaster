#!/bin/bash

VERSION=5.1.2_aster6
cd /work
rm -rf mumps_mpi
hg clone --noupdate http://hg.code.sf.net/p/prereq/mumps mumps_mpi
cd mumps_mpi
hg update ${VERSION}
LIBPATH="/scif/apps/scotch_mpi/lib /scif/apps/metis/lib /scif/apps/parmetis/lib" \
    INCLUDES="/scif/apps/scotch_mpi/include /scif/apps/metis/include /scif/apps/parmetis/include" \
    python3 ./waf configure --enable-mpi --enable-openmp --enable-metis --enable-parmetis --enable-scotch \
        --install-tests --prefix=/scif/apps/mumps_mpi
python3 ./waf build --jobs=1
python3 ./waf install --jobs=1
