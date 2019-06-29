# allocation of data

## The allocatable attribute

As we have seen in Section 2.10.2, sometimes an array is required only after some data have
been read or some calculations performed. For this purpose, an object may be given the
```allocatable``` attribute by a statement such as
```
real, dimension(:, :), allocatable :: a
```
