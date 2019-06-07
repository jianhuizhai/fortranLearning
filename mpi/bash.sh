#! /bin/bash

mpifort  -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3201.f90 -o 3201
mpifort  -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3202.f90 -o 3202
gfortran -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3203.f90 -o 3203
mpifort  -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3204.f90 -o 3204
mpifort  -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3205.f90 -o 3205
