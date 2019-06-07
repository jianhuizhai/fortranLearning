#! /bin/bash

gfortran -fopenmp -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3301.f90 -o 3301
gfortran -fopenmp -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3302.f90 -o 3302
gfortran -fopenmp -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3303.f90 -o 3303
gfortran -fopenmp -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3304.f90 -o 3304
gfortran -fopenmp -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch3305.f90 -o 3305
