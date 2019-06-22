# Operator Overloading

* define derived date type

* define operator : interface block and functions

The operator token may be any of the tokens used for the intrinsic operators or may be a sequence of up to 63 letters enclosed in decimal points other than .true. or .false.. An example is
```
.sum.
```
In this case, the header line of the interface block would be written as 
```
interface operator(.sum.)
```
and the expression as
```
y .sum. z
```
