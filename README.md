# fortranLearning

## This folder includes the code those I learn from book : 

* Introduction to programming with fortran

## Useful knowledges

* wp => dp is called a rename-list in fortran terminology

* continuation mark is the ampersand (&) character
```
 x =  1       &
      + 2
      
 x =          &
      & 1+2
```
* array
```
a(ipoint)  !ipoint is rank-one intger array

(/ 1,2,3,5,10 /) or [1,2,3,4, 5] ==> [(i, i=1,5)]

(/ 2,4,6,8,10 /) ==> (/ (i,i=2,8,2) /)
an array constant of rank greater than one may be constructed by using the function reshape 
to reshape a rank-one array constant.
```
## expressions and assignments
```
2**(-3) is zero
given a variable a of kind long, the result of a/1.7 will be less precise than that of a/1.7_long.
```
* an object of a derived data type is defined only when each of its non-pointer components is defined.

## Relative precedence of operators (in decreasing order).
```
——             monadic (unary) defined operator
Numeric                   **
Numeric                 * or /
Numeric              monadic + or -
Numeric               dyadic + or -
Character                 //
Relational          == /= < <= > >=
Logical                 .not.
Logical                 .and.
Logical                 .or.
Logical             .eqv. or .neqv.
——              dyadic (bonary) defined operator
```
## Control constructs

### The if construct
```
[name:] if (scalar-logical-expr) then
             block
        [else if (scalar-logical-expr) then ] [name]
             block ]
        [else [name]
             block
        end if [name]
        
if (scalar-logical-expr) action-stmt (for only one if case)
```
### The case construct
```
[name:] select case (expr)
        [ case selector [name]
            block ]
        end selection [name]
```
### The do construct
```
[name : ] do variable = expr1, expr2 [, expr3]
               block
          end do [name]
 ```
 expr3 must be non zero when present
 
 A very simple form of the do statement is the unbonded 
 ```
 [ name : ] do
```
which specifies an endless loop. In practice, a means to exit from an endless loop is required, and this is provided in the form of the exit statement:
```
exit [name]
```
```cycle``` statement
```
cycle [name]
```
which transfers control to the ```end do``` statement of the corresponding construct.

Finally, it should be note that many short ```do```loops can be expressed alternatively in the form of array expressions and assignments. __However__, this is not always possible, and __a particuler danger to watch for is where one iteration of the loop dependes upon a previous one__. For example
```
do i = 2, n
    a(i) = a(i-1) + b(i)
end do
```
__cannot__ be replaced by the statement
```
a(2:n) = a(1:n-1) + b(2:n)
```

＃＃　Program units and procedures

### 5.1 Introduction

function and subroutine are known collectively as __procedures__. a __module subprogram__ and it defines a __module procedure__. A subprogram may be placed inside a module subprogram and it defines a __module procedure__. A subprogram may be placed inside a module subprogram, an external subprogram, or a main program, in which case we call it an __internal subprogram__ and it defines an __internal procedure__. If a program unit or subprogram contains a subprogram, it is called the __host__ of that subprogram.

### 5.2 Main program

```
[ program  program-name]
    [ specification-stmts ]
     [ executable-stmts ]
[ contains 
    [ internal-subprogram ] ... ]
end [ program [ program-name] ]
```
### 5.3 The stop statement

Another way to stop program execution is to execute a ```stop``` statement.
```
stop 
stop 12345
stop -2**20
stop ’Incomplete data. Program terminated.’
stop ’load_data_type_1’//’: value out of range’
```
There is also an ```error stop``` statement (Section 17.14) that can be used for program termination. The main difference between the ```stop``` and ```error stop``` statements is that the latter causes __error termination__ instead of normal termination.

Other differences between normal and error termination are:

* normal termination properly closes all files, waiting for any input/output operation in progress to complete, but error termination has no such requirement (this could cause data loss if files are still being written);

* in a coarray program with multiple images (Chapter 17), the entire computation is terminated, not just a single image (Section 17.14).

### 5.4 External subprograms

External subprograms are called from a main program or elsewhere, usually to perform a well-defined task within the framework of a complete program.
```
    subroutine-stmt  
        [ specification-stmts ]
        [ executable-stmts ]
    [ contains
        [ internal-subprogram ] . . . ]
    end [ subroutine [ subroutine-name ] ]
or 
    function-stmt
        [ specification-stmts ]
        [ executable-stmts ]
    [ contains
        [ internal-subprogram ] . . . ]
    end [ function [ function-name ] ]
```
### 5.5 Modules

The third type of program unit, the module, provides a means of packaging global data, derived types and their associated operations, subprograms, interface blocks (Section 5.11), and namelist groups (Section 8.20).

The module has the form
```
module modumodule-name
    [ specification-stmts ]
[ contains
    [ module-subprogram ] . . . ]
end [ module [ module-name ] ]
```
### Arguments of procedures
#### assumed shape arrays
However, it is possible to require that the shape of the dummy array be taken automatically to be that of the corresponding actual array argument. Such an array is said to be an __assumed-shape array__. When the shape is declared by the dimension clause, each dimension has the form
```
[lower-bound] : 
```
where ```lower-bound``` is an integer expression that may depend on module data or the other arguments (see Section 8.18 for the exact rules). If ```lower-bound``` is omitted, the default value is one.

### pointer arguments
A dummy argument is permitted to have the attribute ```pointer```. In this case, the actual argument must also have the attribute ```pointer```.

### restrictions on actual arguments
an actual argument is associated with a dummy argument the following statements hold:
* Action that affects the allocation status or pointer association status of the argument or any part of it (any pointer assignment, allocation, deallocation, or nullification) must be taken through the dummy argument. If this is done, then throughout the execution of the procedure, the argument may be referenced only through the dummy argument.
* Action that affects the value of the argument or any part of it must be taken through the dummy argument unless
 * the dummy argument has the pointer attribute;
