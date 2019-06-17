#! /bin/bash

gfortran -std=f2008 -fcheck=all -Wall ch3501.f90 -o ch3501

gcc -Wall -c ch3502.c -o 3502_func
gfortran -std=f2008 -fcheck=all -Wall ch3502.f90 3502_func -o ch3502


gcc -Wall -c ch3503.c -o 3503_main
gfortran -std=f2008 -fcheck=all -Wall ch3503.f90 3503_main -o ch3503

gfortran -std=f2008 -fcheck=all -Wall -c ch3504.f90 -o ch3504_f.o
g++ ch3504.cpp ch3504_f.o -o ch3504 -lgfortran

gcc -Wall -c ch3505.c -o 3505_func
gfortran -std=f2008 -fcheck=all -Wall ch3505.f90 3505_func -o ch3505


gcc -Wall -c ch3506.c -o 3506_main
gfortran -std=f2008 -fcheck=all -Wall ch3506.f90 3506_main -o ch3506


gfortran -std=f2008 -fcheck=all -Wall -c ch3507.f90 -o ch3507_f.o
g++ ch3507.cpp ch3507_f.o -o ch3507 -lgfortran

gcc -Wall -c ch3508.c -o 3508_func
gfortran -std=f2008 -fcheck=all -Wall ch3508.f90 3508_func -o ch3508

gcc -Wall -c ch3509.c -o 3509_main
gfortran -std=f2008 -fcheck=all -Wall ch3509.f90 3509_main -o ch3509

gfortran -std=f2008 -fcheck=all -Wall -c ch3510.f90 -o ch3510_f.o
g++ ch3510.cpp ch3510_f.o -o ch3510 -lgfortran

gfortran -std=f2008 -fcheck=all -Wall -c ch3511.f90 -o ch3511_f.o
g++ ch3511.cpp ch3511_f.o -o ch3511 -lgfortran

gfortran -std=f2008 -fcheck=all -Wall -c ch3512.f90 -o ch3512_f.o
gcc                                      ch3512.c ch3512_f.o -o ch3512 -lgfortran


gcc -Wall -c ch3513.c -o 3513_func
gfortran -std=f2008 -fcheck=all -Wall ch3513.f90 3513_func -o ch3513

gfortran -std=f2008 -fcheck=all -Wall -c ch3514.f90 -o ch3514_f.o
g++                                      ch3514.cpp ch3514_f.o -o ch3514 -lgfortran
