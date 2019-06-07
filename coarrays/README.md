# coarrays

you need to install libcoarrays-dev in linux.

## compile

* caf *.f90 -o 3401  (or)

* gfortran -fcoarrays=lib *.f90 -o 3401 -lcaf_mpi

## run

* cafrun -np 4 ./3401 (in parallel)

* ./3401 (not in paralel)
