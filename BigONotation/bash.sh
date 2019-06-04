#! /bin/bash

gfortran -std=f2008 -fcheck=all -ffpe-trap=zero,overflow,underflow -Wall ch2301.f90 -o 2301
