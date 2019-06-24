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
