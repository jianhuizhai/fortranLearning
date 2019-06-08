#! /bin/bash

gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch3601.f90 -o 3601
gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch3602.f90 -o 3602
gfortran -std=f2008 -fcheck=all -Wall ch3603.f90 -o 3603
gfortran -std=f2008 -fcheck=all -Wall ch3604.f90 -o 3604
gfortran -std=f2008 -fcheck=all -Wall ch3605.f90 -o 3605
gfortran -std=f2008 -fcheck=all -Wall ch3606.f90 -o 3606
#gfortran -std=f2008 -fcheck=all -Wall -fno-unsafe-math-optimizations -frounding-math -fsignaling-nans underflow.f90 -o underflow
