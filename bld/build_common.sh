
#!/bin/bash

export LANG=en_US.UTF-8 LC_MESSAGES=POSIX
apt-get update -y
apt-get upgrade -y --no-install-recommends --with-new-pkgs -o Dpkg::Options::="--force-confold"
apt-get install -y \
    cmake \
    g++ \
    gcc \
    gfortran \
    locales \
    make \
    mercurial \
    wget \
    zlib1g-dev \
    python3-dev \
    bison \
    flex \
    zlib1g-dev \
    libopenblas-dev \
    python3-dev \
    python3-numpy \
    libboost-numpy-dev \
    libboost-python-dev \
    libopenmpi-dev \
    libblacs-mpi-dev \
    libscalapack-openmpi-dev \
    gdb \
    tk \
    xterm \
    gmsh \
    grace

locale-gen en_GB.UTF-8 en_US.UTF-8 fr_FR.UTF-8
update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX
mkdir -p /work
