#!/bin/bash

VERSION=15.5.1
BASE=/work/aster

URLdevtools=http://hg.code.sf.net/p/codeaster/devtools
URLsrc=http://hg.code.sf.net/p/codeaster/src

mkdir -p ${BASE}
repo=devtools
printf "creating repository '${repo}'...\n"
cd ${BASE}
hg clone ${URLdevtools} ${repo} > /dev/null

repo=src
printf "creating repository '${repo}'...\n"
cd ${BASE}
hg clone ${URLsrc} ${repo} > /dev/null