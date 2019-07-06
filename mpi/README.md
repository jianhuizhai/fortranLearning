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
## The following shows the mapping between MPI data types and Fortran data types.
### basic datatype
```
    mpi datatype            fortran datatype
    
     mpi_integer                integer
     mpi_real                   real
mpi_double_precision            double precision
     mpi_complex                complex
     mpi_logical                logical
     mpi_character              character
```
### derived datatype
MPI provides a number of ways to create datatypes without explicitly constructing the typemap.

__Contiguous__: This is the simplest constructor. It produces a new datatype by making count copies of an existing one, with the displacements incremented by the extent of the oldtype.

__Vector__: This is a slight generalization of the contiguous type that allows for regular gaps in the displacements. Elements are separated by multiples of the extent of the input datatype. See Section 4.8.

__Hvector__: This is like vector, but elements are separated by a specified number of bytes.

__Indexed__: In this datatype, an array of displacements of the input datatype is provided; the displacements are measured in terms of the extent of the input datatype. See Section 5.2.3.

__Hindexed__: This is like indexed, but the displacements are measured in bytes. See Section 5.2.4.
