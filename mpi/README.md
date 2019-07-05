# mpi

## resources

https://www.mpi-forum.org/

http://www.mpich.org/

http://www.open-mpi.org/

## compile

* mpifort ch3201.f90 -o 3201 (details see bash.sh)

## run

* mpirun -np 4 ./3201

## examples or explanations

```MPI_Init```        Initialize MPI 
```MPI_Comm_size```   Find out how many process there are
```MPI_Comm_rank```   Find out which process I am
```MPI_Send```        Send a message
```MPI_Recv```        Receive a message
```MPI_Finalize```    Terminate MPI
