#! /bin/bash

gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch3001.f90 -o 3001
gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch3002.f90 -o 3002
