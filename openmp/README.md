# openmp
export OMP_NUM_THREADS=( num of threads you want to use)

## resources

http://www.openmp.org

https://gcc.gnu.org/onlinedocs/libgomp/

### compare pi calculation with mpi and coarray

* ch3304.f90 calculates pi by using openmp

* ch3403.f90 calculates pi by using coarray

by using 4 threads or images, the running time roughly:

 openmp 3.969s
 
coarray 15.133s
