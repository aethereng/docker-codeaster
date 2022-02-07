#!/bin/bash

VERSION=11.12_aster2
cd /work
rm -rf homard
hg clone http://hg.code.sf.net/p/prereq/homard homard
cd homard
hg pull --rev ${VERSION} && hg update ${VERSION}
export LANG=en_US.UTF-8 LC_MESSAGES=POSIX
python3 setup_homard.py --prefix=/scif/apps/homard
ln -s /scif/apps/homard/homard /usr/local/bin/
