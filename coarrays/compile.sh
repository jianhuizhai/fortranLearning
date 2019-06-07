#! /bin/bash

gfortran -fcoarray=lib -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3401.f90 -o 3401 -lcaf_mpi
caf ch3401.f90 -o 3401_caf
gfortran -fcoarray=lib -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3402.f90 -o 3402 -lcaf_mpi
gfortran -fcoarray=lib -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3403.f90 -o 3403 -lcaf_mpi
gfortran -fcoarray=lib -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3404.f90 -o 3404 -lcaf_mpi
