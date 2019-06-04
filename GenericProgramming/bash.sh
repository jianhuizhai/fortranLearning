#! /bin/bash

gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch2501.f90 -o 2501
gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch2502.f90 -o 2502
