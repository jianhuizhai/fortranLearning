OBJS = ch3701 ch3702 ch3703 ch3704

FC = gfortran

FLAGS = -std=f2008 -Wall 

all: $(OBJS)
#run: $(OBJS)
#	./ch3701


# section 1.3.1
ch3701: ch3701.f90 ch3701_person_module.o
	$(FC) $(FLAGS) -o $@ $^

ch3701_person_module.o: ch3701_person_module.f90
	$(FC) $(FLAGS) -c $^

ch3702: ch3702.f90 ch3702_person_module.o
	$(FC) $(FLAGS) -o $@ $^
ch3702_person_module.o: ch3702_person_module.f90
	$(FC) $(FLAGS) -c $^

ch3703: ch3703.f90 ch3701_person_module.o timing_module.o
	$(FC) $(FLAGS) -o $@ $^
#ch3701_person_module.o: ch3701_person_module.f90
#	$(FC) $(FLAGS) -c $^
timing_module.o: timing_module.f90
	$(FC) $(FLAGS) -c $^

ch3704: ch3704.f90 ch3702_person_module.o timing_module.o
	$(FC) $(FLAGS) -o $@ $^
#ch3702_person_module.o: ch3702_person_module.f90
#	$(FC) $(FLAGS) -c $^
#timing_module.o: timing_module.f90
#	$(FC) $(FLAGS) -c $^

clean: 
	rm -rf $(OBJS) *.o *.mod