#!/bin/bash

VERSION=2019.0-1
cd /work
rm -rf frontend
hg clone http://hg.code.sf.net/p/prereq/frontend frontend
cd frontend
mv /scif/apps/asrun/lib/external_configuration.py external_configuration.py
python3 setup.py install --prefix=/scif/apps/asrun
sed -i "s/mpi_get_procid_cmd : echo \$PMI_RANK/mpi_get_procid_cmd : echo \$OMPI_COMM_WORLD_RANK/" /scif/apps/asrun/etc/codeaster/asrun
printf "\nvers : unstable:/scif/apps/aster/share/aster\n" >> /scif/apps/asrun/etc/codeaster/aster
ln -s /scif/apps/asrun/bin/as_run /usr/local/bin/
