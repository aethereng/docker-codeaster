#!/bin/bash

VERSION=2020.0.1

export LANG=en_US.UTF-8 LC_MESSAGES=POSIX
apt-get update -y
apt-get install -y net-tools

bash /salome_meca.run -t /scif/apps/salome_meca -d -m -l English
rm -f /salome_meca.run

# use development version as 'stable'
sed -i 's#vers : stable:.*$#vers : stable:/scif/apps/aster/share/aster#g' \
    /scif/apps/salome_meca/V2020_univ/tools/Code_aster_frontend-20190/etc/codeaster/aster

# clean directories
apt-get clean
rm -rf /var/lib/apt/lists/* /var/tmp/*
