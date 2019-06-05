# submodules

Compared with ch2206.f90, it adds set_day, set_month and set_year functions.

* duplicate the original module, creating an interface module and a implementation submodule

* Add interfaces for each function and subroutine to the interface module

* Add the new syntax to the interfaces in the module, i.e. add the MODULE keyword to each function and subroutine

* Remove all executable code from the interface module, in this example all code after the contains statement

* Remove all code before the contains statement in the implementation module

* Add the new submodule syntax

* Add the new syntax to each contained procedure, i.e. add the MODULE keyword to each function and subroutine
