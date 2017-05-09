(define (problem DLOG-2-2-2)
	(:domain driverlog)
	(:objects

	driver1 - driver
	
	truck_e_1 - electrictruck
	truck_p_1 - petroltruck 

	package1 - obj
	s0 - location
	s1 - location
	s2 - location
	)
	
	
	(:init

	(at driver1 s0)
	(at truck_p_1 s0)
	(empty truck_p_1)
	(= (load truck_p_1) 0)
	(= (fuel-per-minute truck_p_1) 10)

	(at truck_e_1 s0)
	(empty truck_e_1)
	(= (load truck_e_1) 0)
	(= (electricity-per-minute truck_e_1) 10)
	
	(at package1 s0)

	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 20)
	(= (time-to-drive s2 s0) 20)

	(link s0 s1)
	(link s1 s0)
	(= (time-to-drive s0 s1) 2)
	(= (time-to-drive s1 s0) 2)

	(link s1 s2)
	(link s2 s1)
	(= (time-to-drive s2 s1) 2)
	(= (time-to-drive s1 s2) 2)

	
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)
)
	(:goal (and
	(at package1 s2)
	))


(:metric minimize (+ (walked) (+ (* (electricity-used) 1) (* (fuel-used) 5))))

)
