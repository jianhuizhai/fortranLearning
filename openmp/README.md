# openmp
export OMP_NUM_THREADS=( num of threads you want to use)

## resources

http://www.openmp.org

https://gcc.gnu.org/onlinedocs/libgomp/

### compare pi calculation with mpi and coarray

* ch3304.f90 calculates pi by using openmp

* ch3204.f90 calculates pi by using mpi 

* ch3403.f90 calculates pi by using coarray

  by using 4 threads or images, the running time roughly :
  
```
  paralle  time(compile) time(compile)
  
  openmp  3.969s(-O0)   0.359(-O3)
  
  mpi     3.977s(-O0)  0.367(-O3)
 
  coarray 13.133s(-O0) 0.367s(-O3)
```
### Comparing the Timing of Whole Array Syntax, Simple Do Loops, Do Concurrent and an OpenMP Solution

* ch3305.f90 (run ./3305 will you find result in detail)

  openmp > whole array > do concurrent > traditional do loop ('>' means faster)
