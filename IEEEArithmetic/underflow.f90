program test
    use, intrinsic :: ieee_arithmetic
    use, intrinsic :: iso_fortran_env, only: compiler_version, compiler_options
    implicit none
    logical :: underflow_support, gradual, underflow
    real :: fptest
    integer :: i
  
    print '(4a)',  'This file was compiled by ', &
         compiler_version(), ' using the options ', &
         compiler_options()
    fptest = 0.0
    underflow_support = ieee_support_underflow_control(fptest)
    if (underflow_support) then
       print *,'Underflow control supported for the default real kind'
    else
       stop 'no underflow control support'
    end if
    call ieee_set_underflow_mode(.false.)
    call ieee_get_underflow_mode(gradual)
    if (.not.gradual) then 
        print *,'Able to set abrupt underflow mode'
    else
        stop 'error setting underflow mode'
    end if

    fptest = 2e-36
    do i=1,50 ! 50 iterations max
        fptest = fptest * 0.5
        print '(e15.10)',fptest
        call ieee_get_flag(ieee_underflow,underflow)
        if (underflow) print *,'Underflow exception signaling'
        if (fptest == 0.0) exit
    end do

end program test