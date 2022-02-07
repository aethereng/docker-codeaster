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

## Testing

### Running a shell using the image:

``` bash
docker run --rm -it aethereng/codeaster-seq:latest
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
docker run -t aethereng/codeaster-seq:latest run_testcases unstable

# to copy the result files
docker cp -a <CONTAINER>:/home/aster/resutest <DESTINATION>
```

Use the following commands to download all the 3800+ testcases from the
[Bitbucket repository](https://bitbucket.org/code_aster/codeaster-src) and
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
