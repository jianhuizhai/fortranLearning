program ch3606

  use iso_fortran_env, only : sp => real32, dp => real64, qp => real128  
  use ieee_arithmetic
  implicit none

  real (sp) :: sp0 = 0.0
  real (dp) :: dp0 = 0.0_dp
  real (qp) :: qp0 = 0.0_qp

  real (sp) :: sp1 = 1.0
  real (dp) :: dp1 = 1.0_dp
  real (qp) :: qp1 = 1.0_qp

  real (sp) :: spnan = 1.0
  real (dp) :: dpnan = 1.0_dp
  real (qp) :: qpnan = 1.0_qp

  real (sp) :: spinfinite = 1.0
  real (dp) :: dpinfinite = 1.0_dp
  real (qp) :: qpinfinite = 1.0_qp

  spinfinite = sp1/sp0
  dpinfinite = dp1/dp0
  qpinfinite = qp1/qp0
  spnan = sp0/sp0
  dpnan = dp0/dp0
  qpnan = qp0/qp0

  if (ieee_support_datatype(sp1)) then
    print *, repeat('=', 80)
    print *, '  32 bit IEEE support'
    print *, '     inf ', ieee_support_inf(sp1)
    print *, '     nan ', ieee_support_nan(sp1)
    print *, ' 1/0 finite', ieee_is_finite(spinfinite)
    print *, ' 0/0 nan', ieee_is_nan(spnan)
  end if

  if (ieee_support_datatype(dp1)) then
    print *, repeat('=', 80)
    print *, '  64 bit IEEE support'
    print *, '     inf ', ieee_support_inf(dp1)
    print *, '     nan ', ieee_support_nan(dp1)
    print *, ' 1/0 finite', ieee_is_finite(dpinfinite)
    print *, ' 0/0 nan', ieee_is_nan(dpnan)
  end if

  if (ieee_support_datatype(qp1)) then
    print *, repeat('=', 80)
    print *, ' 128 bit IEEE support'
    print *, '     inf ', ieee_support_inf(qp1)
    print *, '     nan ', ieee_support_nan(qp1)
    print *, ' 1/0 finite', ieee_is_finite(qpinfinite)
    print *, ' 0/0 nan', ieee_is_nan(qpnan)
  end if

end program