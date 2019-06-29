# Chapter 6 allocation of data

## 6.1 Introduction
## 6.2 The allocatable attribute

As we have seen in Section 2.10.2, sometimes an array is required only after some data have
been read or some calculations performed. For this purpose, an object may be given the
```allocatable``` attribute by a statement such as
```
real, dimension(:, :), allocatable :: a
```
and it becomes allocated following successful execution of an ```allocate``` statement
```
allocate( a(n,2n) )
```
When an allocatable object a is no longer needed, it may be deallocated by execution of the statement
```
deallocate (a)
```
On return from a subprogram, an allocated allocatable object without the save attribute (Section 8.10) is automatically deallocated if it is local to the subprogram.

## 6.3 Deferred type parameters
A len type parameter value is permitted to be a colon in a type declaration statement such as
```
character(len=:), pointer :: varchar
```
for a pointer or an allocatable entity. It indicates a __deferred type parameter__; such a type parameter has no defined value until it is given one by allocation or pointer assignment. For
example, in
```
character(:), pointer :: varchar
character(100), target :: name
character(200), target :: address
.
.
.
varchar => name
.
.
.
varchar => address
```
the character length of ```varchar``` after each pointer assignment is the same as that of its target;that is, 100 after the first pointer assignment and 200 after the second.

Deferred type parameters can be given values by the allocate statement, see Section 6.5.
For allocatable variables, they can also be given values by assignment, see Section 6.7.

## Allocatable scalars
The ```allocatable``` attribute (and hence the ```allocated``` function) may also be applied to scalar variables and components. This is particularly useful when combined with deferred type
parameters, for example, in
```
character(:), allocatable :: chdata
integer                   :: unit, reclen
.
.
.
read *, reclen
allocate (character(reclen) :: chdata)
read *, chdata
```
where ```reclen``` allows the length of ```character``` to be specified at run time.

## The allocate statement
The general form of the allocate statement is
```
allocate ( [ type-spec :: ] allocation-list [, alloc-spec ] . . . )
```
where ```allocation-list``` is a list of allocations of the form
```
allocate-object [ ( array-bounds-list ) ]
```
each ```array-bound``` has the form
```
[ lower-bound : ] upper-bound
```
and ```alloc-spec``` is one of
```
errmsg=erm
mold=expr
source=expr
stat=stat
```
where no specifier may appear more than once, ```stat``` is a scalar integer variable, and ```erm```
is a scalar default character variable. Neither ```stat``` nor ```erm``` may be part of an object being

## 6.6 The deallocate statement
When an allocatable object or pointer target is no longer needed, its storage may be recovered by using the deallocate statement. Its general form is
```
deallocate ( allocate-object-list [,stat=stat] [, errmsg=erm ] )
```
where each ```allocate-object``` is an allocatable object that is allocated or a pointer that is
associated with the whole of a target that was allocated through a pointer in an ```allocate```
statement. A pointer becomes disassociated (Section 3.3) following successful execution of the statement.Here, ```stat``` is a scalar integer variable that must not be deallocated by
the statement nor depend on an object that is deallocated by the statement. If ```stat=``` is
present, stat is given either the value zero after a successful execution or a positive value
after an unsuccessful execution (for example, if a pointer is disassociated). If an error during
deallocation occurs, an explanatory message is assigned to the optional ```errmsg=``` variable.
After an unsuccessful execution, each object that was not successfully deallocated retains its
previous allocation or pointer association status. If ```stat=``` is absent and the deallocation is unsuccessful, execution stops.

If there is more than one object in the list, there must be no dependencies among them, to allow the processor to deallocate the objects one by one in any order.

## 6.7 Automatic reallocation
This automatic reallocation also occurs if the allocatable variable has a deferred type parameter which does not already have the same value as the corresponding parameter of
the expression. This applies to allocatable scalars as well as to allocatable arrays, as in
```
character(:), allocatable :: quotation
.
.
.
quotation = ’Now is the winter of our discontent.’
.
.
.
quotation = "This ain’t the summer of love."
```
In each of the assignments to ```quotation```, it is reallocated to be the right length (unless it is already of that length) to hold the desired quotation. If instead the normal truncation or
padding is required in an assignment to an allocatable-length character, substring notation
can be used to suppress the automatic reallocation. For example,
```quotation(:) = ’’```
leaves ```quotation``` at its current length, setting all of it to blanks.

Automatic reallocation only occurs for normal intrinsic assignment, and not for defined
assignment or for where constructs (Section 7.6).