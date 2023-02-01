# Docker code_aster container

This repository contains recipes to build [docker](https://www.docker.com/) images of [code_aster](https://code-aster.org), a FE solver developed by [EDF](https://www.edf.fr/).

The recipes allow building a sequential and a parallel
version for the stable branch (`default`) which refers to the `latest`
tag on docker images.
The code_aster version is named `stable`.

Thanks to the awesome work by [@andefined](https://github.com/andefined) the size of the images have been kept below `2GB`
```
REPOSITORY                   TAG         SIZE
aethereng/codeaster-mpi      latest      1.97GB
aethereng/codeaster-seq      15.5.2      1.91GB
```


> **It should be considered as a work in progress.**
>
> For example, additional work is needed to execute a containerized version of
  code_aster from an existing
  [salome_meca](https://www.code-aster.org/spip.php?article295)
  installation.



## Background

As of version 15.2 and on, `code_aster` has become more pythonic than ever, with a massive refactoring of the source code and the migration of some functionality from FORTRAN to C++ code. Furthermore, the compilation and production process is based on [singularity](https://www.sylabs.io/docs/) container technology.

As a result, existing recipes to compile `code_aster` with `docker` like the excellent [code_aster_on_docker](https://github.com/tianyikillua/code_aster_on_docker) by [@tianyikillua](https://github.com/tianyikillua) are not applicable any more.

Thus, the objective of this work is to fill-in-the-gap and create `docker` recipes for the new versions (post 15.2) of `code_aster`.

The initial state of this repo was cloned from the existing uncompleted [container repo](https://github.com/codeaster/container) and significant modifications of the `docker` configuration files were made.

At the moment, it is possible to build both `sequential` and `parallel` versions, although the latter is not tested extensively and some optional modules may be missing.



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
make build VERSION_ASTER=15.5.2
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
docker cp astercp:/aster/aster/share/aster/tests/sslv155a.comm workdir/
docker cp astercp:/aster/aster/share/aster/tests/sslv155a.mmed workdir/

# clean the temporary container
docker rm astercp

# create the export file
docker run --rm  aethereng/codeaster-seq:latest as_run --get_export sslv155a --nodebug_stderr | \
    sed -e 's#/aster/aster/share/aster/tests#.#g' \
    > workdir/export
```

If the `export` file is manually created, the version can be addressed just
by name (`P version stable`).

Now, run a code_aster container using local files:

``` bash
docker run --rm --volume $(pwd)/workdir:/home/aster aethereng/codeaster-seq:latest \
    as_run --nodebug_stderr /home/aster/export
```

### Validation

To limit the size of the binary images only few testcases are available in the
installation directory.
The 3800+ testcases can be extracted from the source tree from the
[GitLab repository](https://gitlab.com/codeaster/src)
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
    run_testcases --tests=/home/aster/tests stable
```


## Prerequisites

See [presrequisites.md](./prerequisites.md) for a list of installed components during image building
