# Docker code_aster container

This repository provides some recipes to build containers for
[code_aster](https://www.code-aster.org/):

* for [docker](https://docs.docker.com/).

Read the official repo here [Containers for code_aster](https://github.com/codeaster/container).

> **It should be considered as a work in progress.**
>
> For example, additional work is needed to execute a containerized version of
  code_aster from an existing
  [salome_meca](https://www.code-aster.org/spip.php?article302)
  installation.


The repository contains recipes to build a sequential and a parallel
version for the development branch (`default`) which refers to the `latest`
tag on docker images.
The code_aster version is named `unstable`.

## Prerequisites
```
checking environment... loading /opt/public/scibian9_std.sh
executing: ./waf.engine distclean --out=build/std --jobs=4
'distclean' finished successfully (0.228s)
Singularity> ./waf_mpi configure --prefix=$HOME/aster --with-data=data
checking environment... loading /opt/public/scibian9_mpi.sh
executing: ./waf.engine configure --prefix=/home/andefined/aster --with-data=data --out=build/mpi --jobs=4
Setting top to                           : /home/andefined/.local/share/Trash/files/dev/codeaster/v15 
Setting out to                           : /home/andefined/.local/share/Trash/files/dev/codeaster/v15/build/mpi 
Setting prefix to                        : /home/andefined/aster 
Checking for 'gcc' (C compiler)          : mpicc 
Checking for 'g++' (C++ compiler)        : mpicxx 
Checking for 'gfortran' (Fortran compiler) : mpif90 
Checking mpicc package (collect configuration flags) : yes 
Checking mpif90 package (collect configuration flags) : yes 
Checking for header mpi.h                : yes 
Checking for C compiler version          : gcc 8.3.0 
Checking for Fortran compiler version    : gfortran 8.3.0 
fortran link verbose flag                : -v 
Checking for OpenMP flag -fopenmp        : yes 
Checking for program 'python'            : /opt/python/3.6.5/bin/python3 
Checking for python version >= 3.5.0     : 3.6.5 
python-config                            : /opt/python/3.6.5/bin/python3-config 
Asking python-config for pyembed '--cflags --libs --ldflags --embed' flags : not found 
Asking python-config for pyembed '--cflags --libs --ldflags' flags : yes 
Testing pyembed configuration            : yes 
Asking python-config for pyext '--cflags --libs --ldflags' flags : yes 
Testing pyext configuration              : yes 
Checking for python module 'numpy'       : 1.15.1 
Checking for numpy include               : ['/opt/numpy/1.15.1/lib/python3.6/site-packages/numpy-1.15.1-py3.6-linux-x86_64.egg/numpy/core/include'] 
Checking for python module 'asrun'       : 2021.0 
Checking for python module 'mpi4py'      : 3.0.3 
Getting platform                         : ASTER_PLATFORM_LINUX64 
Checking for library m                   : yes 
Checking for library z                   : yes 
Checking for number of cores             : 16 
Checking for program 'ldd'               : /usr/bin/ldd 
Checking library blas                    : yes (openblas) 
Checking for a program using blas/lapack : yes 
Checking library scalapack               : yes (scalapack) 
Checking library optional                : not found 
Checking for a program using blas/lapack : yes 
Checking for a program using blacs       : yes 
Checking for a program using omp thread  : yes (on 16 threads) 
Detected math libraries                  : ['openblas', 'scalapack'] 
Setting libm after files                 : nothing done 
Checking for library hdf5                : yes 
Checking for header hdf5.h               : yes 
Checking hdf5 version                    : 1.10.3 
Checking for API hdf5 v18                : default v18 
Checking size of hid_t integers          : 8 
Checking for library med                 : yes 
Checking for header med.h                : yes 
Checking size of med_int integers        : 8 
Checking size of med_idt integers        : 8 
Checking med version                     : 4.1.0 
Checking for python module 'med'         : ok 
Checking for python module 'medcoupling' : ok 
Checking for library metis               : yes 
Checking for header metis.h              : yes 
Checking metis version                   : 5.1.0 
Checking for library parmetis            : yes 
Checking parmetis version                : 4.0.3 
Checking for smumps_struc.h              : yes 
Checking for dmumps_struc.h              : yes 
Checking for cmumps_struc.h              : yes 
Checking for zmumps_struc.h              : yes 
Checking for mpif.h                      : yes 
Checking mumps version                   : 5.2.1consortium 
Checking size of Mumps integer           : 4 
Checking for library dmumps              : yes 
Checking for library zmumps              : yes 
Checking for library smumps              : yes 
Checking for library cmumps              : yes 
Checking for library mumps_common        : yes 
Checking for library pord                : yes 
Checking for header scotch.h             : yes 
Checking scotch version                  : 6.0.4 
Checking for library ['esmumps', 'scotch', 'scotcherr', 'ptscotch', 'ptscotcherr'] : yes 
Checking for library ml                  : yes 
Checking for library HYPRE               : yes 
Checking for library superlu             : yes 
Checking for library stdc++              : yes 
Checking for library petsc               : yes 
Checking for header petsc.h              : yes 
Checking for header petscconf.h          : yes 
Checking petsc version                   : 3.12.3p0 
Checking size of PETSc integer           : 4 
Checking value of ASTER_PETSC_64BIT_INDICES : no 
Checking value of ASTER_PETSC_HAVE_ML    : 1 
Checking value of ASTER_PETSC_HAVE_HYPRE : 1 
Checking value of ASTER_PETSC_HAVE_SUPERLU : 1 
Checking value of ASTER_PETSC_HAVE_MUMPS : 1 
Checking for python module 'petsc4py'    : 3.12.0 
Reading build preferences from ~/.hgrc   : not found 
Checking for 'gfortran' (Fortran compiler) : mpif90 
Compiling a simple fortran app           : yes 
Detecting whether we need a dummy main   : yes main 
Checking for fortran option              : yes (-fdefault-double-8 -fdefault-integer-8 -fdefault-real-8) 
Checking for fortran option              : yes (-Wimplicit-interface) 
Checking for fortran option              : yes (-Wintrinsic-shadow) 
Checking for fortran option              : yes (-fno-aggressive-loop-optimizations) 
Checking for fortran option              : yes (-ffree-line-length-none) 
Setting fortran compiler flags           : ['-fPIC', '-fdefault-double-8', '-fdefault-integer-8', '-fdefault-real-8', '-Wimplicit-interface', '-Wintrinsic-shadow', '-fno-aggressive-loop-optimizations', '-ffree-line-length-none'] 
Getting fortran mangling scheme          : ok ('_', '', 'lower-case') 
Checking size of integer4                : 4 
Checking the matching C type             : int 
Checking size of default integer         : 8 
Checking the matching C type             : long 
Checking size of logical                 : 1 
Checking size of simple precision real   : 4 
Checking the matching C type             : float 
Checking size of double precision real   : 8 
Checking the matching C type             : double 
Checking size of double complex          : 16 
Setting type for fortran string length   : unsigned int 
Setting size of blas/lapack integers     : 4 
Checking size of MPI_Fint integers       : 4 
Checking fpp stringify using #           : no 
Checking fpp stringify using ""          : yes 
Checking compilation with long lines     : yes 
Check for backtrace feature              : yes 
Check for tracebackqq feature            : no 
Getting code_aster version               : [(15, 5, 1), 'f1f519a87d563a84bcdb1634b51593354b29b971', 'v15', '10/02/2022', 'v15', 13] 
Checking for 'g++' (C++ compiler)        : mpicxx 
Checking for compiler flags -std=c++11   : yes 
Checking for library stdc++              : yes 
Checking size of C++ bool                : 1 
Checking for program 'dpkg-architecture' : /usr/bin/dpkg-architecture 
Checking boost includes                  : 1.58.0 
Checking boost libs                      : ok 
Checking for boost linkage               : ok 
Adding C++ flags (old boost version)     : ['-Wno-deprecated-declarations', '-Wno-return-type', '-Wplacement-new=0'] 
Checking for 'gcc' (C compiler)          : mpicc 
Getting C compiler flags                 : ['-fPIC'] 
Checking for TFELHOME variable           : ['/opt/public/20210601_sm2021/gcc8-openblas-ompi2/mfront-3.4.0'] 
Checking for program 'mfront-3.4.0'      : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/mfront-3.4.0/bin/mfront-3.4.0 
Checking for program 'tfel-config-3.4.0' : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/mfront-3.4.0/bin/tfel-config-3.4.0 
Checking for 'tfel-config-3.4.0'         : yes 
Checking for mfront version >= 3.2.1     : 3.4.0 
Checking for library AsterInterface-3.4.0 : yes 
Checking for library TFELSystem-3.4.0    : yes 
Checking for python module 'tfel_3_4_0.material' : ok 
Check for msgfmt programs                : ['/usr/bin/msgfmt'] 
Check for xgettext programs              : ['/usr/bin/xgettext'] 
Check for msgmerge programs              : ['/usr/bin/msgmerge'] 
Check for lrelease programs              : ['/opt/qt/5.15.2/bin/lrelease'] 
Check for pylupdate4 programs            : ['/usr/bin/pylupdate4'] 
Set parameters for 'config.json'         : done 
. use 'tmpdir'                           : /tmp 
. use 'addmem'                           : 2800 
. use 'python'                           : python3 
. use 'python_interactive'               : python3 
. use 'mpiexec'                          : mpiexec -n {mpi_nbcpu} --tag-output {program} 
. use 'mpi_get_rank'                     : echo ${OMPI_COMM_WORLD_RANK} 
Checking measure of VmSize during MPI_Init : ok (286872 kB) 
Checking for program 'gmsh'              : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/gmsh-2.12.0-Linux64/bin/gmsh 
Checking for program 'salome'            : /usr/local/bin/salome 
Checking for program 'run_miss3d'        : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/miss3d-6.7_aster6/bin/run_miss3d 
Checking for program 'homard'            : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/homard-11.12_aster2/bin/homard 
Checking for program 'ecrevisse'         : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/ecrevisse-3.2.2/bin/ecrevisse 
Checking for program 'mfront-3.4.0'      : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/mfront-3.4.0/bin/mfront-3.4.0 
Checking for program 'xmgrace'           : /usr/bin/xmgrace 
Checking for program 'gracebat'          : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/grace-0.0.1/bin/gracebat 
Checking for program 'mdump'             : /opt/public/20210601_sm2021/gcc8-openblas-ompi2/med-4.1.0/bin/mdump 
Checking for 'data' repository           : /home/andefined/.local/share/Trash/files/dev/codeaster/v15/data 
Store execution environment              : yes 
Build list of testcases                  : done 
Checking for program 'dot'               : /usr/bin/dot 
Checking for program 'convert'           : /usr/bin/convert 
Checking for program 'sphinx-build'      : /opt/python36-sphinx-rtd-theme-mat303/0.4.3/bin/sphinx-build 
Checking for sphinx version              : sphinx-build 1.7.6 
Checking for 'validation' repository     : /home/andefined/.local/share/Trash/files/dev/codeaster/validation not found 
Setting C debug flags                    : ['-g', '-O0'] 
Setting C optimization flags             : ['-O2'] 
Setting C++ debug flags                  : ['-g', '-O0'] 
Setting C++ optimization flags           : ['-O2'] 
Setting fortran debug flags              : ['-g', '-O0'] 
Checking loop optimization with LOC      : VOLATILE is required 
Checking implicit loop in write          : '-fno-frontend-optimize' is required 
Getting fortran optimization flags       : ['-O2', '-fno-frontend-optimize'] 
Write config file                        : debug/asterf_config.h 
Write config file                        : debug/asterc_config.h 
Write config file                        : debug/aster_config.py 
Write config file                        : release/asterf_config.h 
Write config file                        : release/asterc_config.h 
Write config file                        : release/aster_config.py
```


## List of code_aster images

Executable images:

- `aethereng/codeaster-seq`: Sequential version of code_aster.

- `aethereng/codeaster-mpi`: Parallel version of code_aster.

Intermediate layer with prerequisites:

- `aethereng/codeaster-common`: Prerequisites for the sequential and
  parallel versions.


## Tags

- `latest`: It refers to the last head of the `default` branch.

*No more for the moment...*


## Build images

See available targets:

``` bash
make help
```

Then choose your target between `seq` and `mpi`, or `build` to build all:

``` bash
make build
```

To build a specific version use the `VERSION_ASTER` environment variable:

```bash
make build VERSION_ASTER=15.5.9 
```

## Testing

### Running a shell using the image:

To test the latest images use (refer to `Makefile`):

``` bash
make test
```

### Running a testcase using testcase files embedded in the image:

``` bash
docker run --rm aethereng/codeaster-seq:latest as_run --nodebug_stderr --test zzzz100f
```

### Running a testcase using files out of the image:

In this example the data files are extracted from the *image*.
In the real life, these files are for example created from salome_meca.

``` bash
# create a temporary container to access the testcase files
docker run --name astercp aethereng/codeaster-seq:latest

# copy files
mkdir workdir
docker cp astercp:/scif/apps/aster/share/aster/tests/sslv155a.comm workdir/
docker cp astercp:/scif/apps/aster/share/aster/tests/sslv155a.mmed workdir/

# clean the temporary container
docker rm astercp

# create the export file
docker run --rm  aethereng/codeaster-seq:latest as_run --get_export sslv155a --nodebug_stderr | \
    sed -e 's#/scif/apps/aster/share/aster/tests#.#g' \
    > workdir/export
```

If the `export` file is manually created, the version can be addressed just
by name (`P version unstable`).

Now, run a code_aster container using local files:

``` bash
docker run --rm --volume $(pwd)/workdir:/aster aethereng/codeaster-seq:latest \
    as_run --nodebug_stderr /aster/export
```

### Validation

To limit the size of the binary images only few testcases are available in the
installation directory.
The 3800+ testcases can be extracted from the source tree from the
[Bitbucket repository](https://bitbucket.org/code_aster/codeaster-src)
(see below).
Checking all the 3800 testcases takes about 15-20h cpu.

*Some prerequisites are not yet available within the container
(miss3d, ecrevisse, etc.). So, all the tests that are using these tools
are currently in failure.*

To execute the existing testcases, use:

``` bash
# run run_testcases on mpi version doesn't work
docker run -t aethereng/codeaster-seq:latest run_testcases stable
# to copy the result files
docker cp -a <CONTAINER>:/home/aster/resutest <DESTINATION>
```

Use the following commands to download all the 3800+ testcases from the
[GitLab repository](https://gitlab.com/codeaster/src) and
execute them.

``` bash
# download the testcases out of the container
wget https://bitbucket.org/code_aster/codeaster-src/get/default.tar.gz
tar xzf default.tar.gz
mv code_aster-codeaster-src-*/astest . && rm -rf code_aster-codeaster-src-*

# mount 'astest' and run testcases in the container
docker run -t --volume $(pwd)/astest:/home/aster/tests aethereng/codeaster-seq:latest \
    run_testcases --tests=/home/aster/tests unstable
```
