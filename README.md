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
    * the dummy argument has the ```pointer``` attribute;
    * the part is all or part of a ```pointer``` subobject; or
    * the dummy argument has the ```target``` attribute, the dummy argument does not have intent ```in``` (Section 5.9), the dummy argument is scalar or an assumed-shape array (Section 5.7.1), and the actual argument is a target other than an array section with a vector subscript.
### arguments with the target contribute
if a dummy argument has neither the ```target``` nor ```pointer``` attribute, any pointers associated with the actual argument do not become associated with the corresponding dummy argument but remain associated with the actual argument.

However, copy-in copy-out is not allowed when
* a dummy argument has the ```target``` attribute and is either scalar or is an assumed-shaped array; and
* the actual argument is a target other than an array section with a vector subscript.

### The return statement
Just as the ```stop``` statement is an executable statement that provides an alternative means of stopping execution, so the ```return``` statement provides __an alternative means of returning control from a subprogram__. It has the form
```
return
```
and must not appear in a main program.

### Argument intent
If a function specifies a defined operator (Section 3.9), the dummy arguments must have intent ```in```. If a subroutine specifies defined assignment (Section 3.10), the first argument must have intent ```out``` or ```inout```, and the second argument must have intent ```in```.

If a dummy argument has no intent, the actual argument may be a variable or an expression, but the actual argument must be a variable if the dummy argument is redefined.

If a dummy argument has the ```pointer``` attribute, any intent refers to its ```pointer``` association (and __not__ to the value of the target); that is, it refers to the descriptor. An intent ```out``` pointer has undefined association status on entry to the procedure; an intent ```in``` pointer cannot be nullified or associated during execution of the procedure; and the actual argument for an intent ```inout``` pointer must be a pointer variable (that is, it cannot be a reference to a pointer-valued function).

Note that, although an intent in ```pointer``` cannot have its pointer association status changed inside the procedure, if it is associated with a target the value of its target may be changed. For example,
```
subroutine maybe_clear(p)
    real, pointer, intent(in) :: p(:)
    if (associated(p)) p = 0.0
end subroutine maybe_clear
```
Likewise, if a dummy argument is of a derived type with a ```pointer``` component, its intent attribute refers to the pointer association status of that component (and __not__ to the target of the component). For example, if the intent is ```in```, no pointer assignment, allocation, or deallocation is permitted.

### Functions
It is permissible to write functions that change the values of their arguments, modify values in modules, rely on local data saved (Section 8.10) from a previous invocation, or perform input/output operations. However, these are known as __side-effects__ and conflict with good programming practice. Where they are needed, a subroutine should be used. It is reassuring to know that when a function is called, nothing else goes on ‘behind the scenes’, and it may be very helpful to an optimizing compiler, particularly for internal and module subprograms.

A function result may be an ```array```, in which case it must be declared as such.
A function result may also be a ```pointer```.

The result is initially undefined. Within the function, it must become associated or defined as disassociated. We expect the function reference usually to be such that a pointer assignment takes place for the result, that is, the reference occurs as the right-hand side of a pointer assignment (Section 3.13), for example,
```
real :: x(100)
real, pointer :: y(:)
.
.
.
y => compact(x)
.
.
.
```
The value returned by a non-pointer function must always be defined.

### Explicit and implicit interfaces
However, a mechanism is provided for the interface to be specified. It may be done through an interface block of the form
```
interface
    interface-body
end interface
```
Normally, the ```interface-body``` is an exact copy of the subprogram’s header, the specifications of its arguments and function result, and its end statement. However,
* the names of the arguments may be changed;
* other specifications may be included (for example, for a local variable), but not internal procedures, ```data``` statements, or ```format``` statements;
* the information may be given by a different combination of statements;
* in the case of an array argument or function result, the expressions that specify a bound may differ as long as their values can never differ; and
* a recursive procedure (Sections 5.16 and 5.17) or a pure procedure (Section 7.8) need not be specified as such if it is not called as such.

An interface-body may be provided for a call to an external procedure defined by means other than Fortran (usually C or assembly language).

An explicit interface is required to invoke a procedure with a pointer or target dummy argument or a pointer function result, and is required for several useful features that we will meet later in this and the next chapter. It is needed so that the processor can make the appropriate linkage. Even when not strictly required, it gives the compiler an opportunity to examine data dependencies and thereby improve optimization. Explicit interfaces are also desirable because of the additional security that they provide. __It is straightforward to ensure that all interfaces are explicit, and we recommend the practice__.
#### The import statement
As we have seen, an interface body does not access its environment by host association, and therefore cannot use any named constants and derived types defined therein. This problem is solved by the ```import``` statement. This statement can be used only in an interface body, and gives access to named entities of the containing scoping unit.
```
module m
    integer, parameter :: wp = kind(0.0d0)
    type t
        .
        .
        .
    end type t
contains
    subroutine apply(fun,...)
        interface
            function fun(f)
                __import :: t, wp__
                type(t) :: fun
                real(wp) :: f
            end function fun
        end interface
    end subroutine apply
end module m
```
