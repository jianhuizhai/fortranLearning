#! /bin/bash

gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch2401.f90 -o 2401
