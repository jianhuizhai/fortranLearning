#! /bin/bash

gfortran -std=f2008 -fcheck=all -fall-intrinsics -ffpe-trap=zero,overflow,underflow -Wall ch4201.f90 -o 4201
