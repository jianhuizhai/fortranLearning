#! /bin/bash

gfortran -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch2701.f90 -o 2701
#gfortran -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch2702.f90 -o 2702
#gfortran -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch2703.f90 -o 2703
