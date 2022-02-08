#!/bin/bash

VERSION=15.5.1
BASE=/work/aster
BUILD=std
ln -s /usr/lib/x86_64-linux-gnu/ /usr/lib64

LD_LIBRARY_PATH=/scif/apps/hdf5/lib:/scif/apps/med/lib:/scif/apps/metis/lib:/scif/apps/mumps_seq/lib:/scif/apps/scotch_seq/lib:$LD_LIBRARY_PATH
LIBPATH=/scif/apps/hdf5/lib:/scif/apps/med/lib:/scif/apps/metis/lib:/scif/apps/mumps_seq/lib:/scif/apps/scotch_seq/lib:$LIBPATH
INCLUDES=/scif/apps/hdf5/include:/scif/apps/med/include:/scif/apps/metis/include:/scif/apps/mumps_seq/include:/scif/apps/mumps_seq/include_seq:/scif/apps/scotch_seq/include:$INCLUDES

URLdevtools=http://hg.code.sf.net/p/codeaster/devtools
URLsrc=http://hg.code.sf.net/p/codeaster/src

repo=devtools
cd ${BASE}/${repo}
hg pull --rev default && hg update default

repo=src
cd ${BASE}/${repo}
hg pull --rev ${VERSION} && hg update ${VERSION}

cd ${BASE}/src
./waf configure --prefix=/scif/apps/aster --use-config-dir=/scif/apps/aster/lib --use-config=scif_std && ./waf build && ./waf -j 8 install
[ $? -ne 0 ] && exit 1
# && cat /work/aster/src/build/std/config.log
# clean config.txt
grep -v /work /scif/apps/aster/share/aster/config.txt > config.tmp
echo 'SRCTEST        | src     | -     | $ASTER_VERSION_DIR/tests' >> config.tmp
cp config.tmp /scif/apps/aster/share/aster/config.txt
mkdir -p /scif/apps/asrun/stable && cp config.tmp /scif/apps/asrun/stable/config.txt
# cat /scif/apps/aster/share/aster/config.txt
# keep only some testcases
rm /scif/apps/aster/share/aster/tests
mkdir /scif/apps/aster/share/aster/tests
for name in forma01a hsnv100a pynl01a sdll100a sslv155a ssnv128a zzzz100f
do
    cp ${BASE}/src/astest/${name}* /scif/apps/aster/share/aster/tests/
done
