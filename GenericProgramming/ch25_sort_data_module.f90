module sort_data_module

  use iso_fortran_env, only : sp => real32, dp => real64, qp => real128, &
                            & i8 => int8,  i16 => int16, i32 => int32, i64 => int64
  !!use integer_kind_module

  interface sort_data
    module procedure sort_real_sp
    module procedure sort_real_dp
    module procedure sort_real_qp
    module procedure sort_integer_8
    module procedure sort_integer_16
    module procedure sort_integer_32
    module procedure sort_integer_64
  end interface

contains

  subroutine sort_real_sp(raw_data, how_many)
    !!use precision_module
    implicit none
    integer, intent (in) :: how_many
    real (sp), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains

    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      real (sp) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine

  end subroutine

  subroutine sort_real_dp(raw_data, how_many)
    !!use precision_module
    implicit none
    integer, intent (in) :: how_many
    real (dp), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      real (dp) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine
  end subroutine

  subroutine sort_real_qp(raw_data, how_many)
    !!use precision_module
    implicit none
    integer, intent (in) :: how_many
    real (qp), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      real (qp) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine
  end subroutine

  subroutine sort_integer_8(raw_data, how_many)
    !!use integer_kind_module
    implicit none
    integer, intent (in) :: how_many
    integer (i8), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      integer (i8) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine
  end subroutine

  subroutine sort_integer_16(raw_data, how_many)
    !!use integer_kind_module
    implicit none
    integer, intent (in) :: how_many
    integer (i16), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      integer (i16) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine
  end subroutine

  subroutine sort_integer_32(raw_data, how_many)
    !!use integer_kind_module
    implicit none
    integer, intent (in) :: how_many
    integer (i32), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      integer (i32) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine
  end subroutine

  subroutine sort_integer_64(raw_data, how_many)
    !!use integer_kind_module
    implicit none
    integer, intent (in) :: how_many
    integer (i64), intent (inout), dimension (:) :: raw_data

    call quicksort(1, how_many)

  contains
    recursive subroutine quicksort(l, r)
      implicit none
      integer, intent (in) :: l, r
      integer :: i, j
      integer (i64) :: v, t

      include 'quicksort_include_code.f90'

    end subroutine

  end subroutine

end module
