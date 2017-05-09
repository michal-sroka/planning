(define (problem DLOG-2-2-3)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck_p_1 - petroltruck 
 truck_e_1 - electrictruck
	truck_p_2 - petroltruck 
 truck_e_2 - electrictruck
	package1 - obj
	package2 - obj
	package3 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
		
	p0-1 - location
	p0-2 - location
	p1-0 - location
	p2-1 - location
	)
	(:init
	(at driver1 s0)
	(at driver2 s0)
	(at truck_p_1 s0)
(at truck_e_1 s0)
	(empty truck_p_1)
(= (load truck_p_1) 0)
(= (fuel-per-minute truck_p_1) 10)
(empty truck_e_1)
(= (load truck_e_1) 0)
(= (electricity-per-minute truck_e_1) 10)
	(at truck_p_2 s1)
(at truck_e_2 s1)
	(empty truck_p_2)
(= (load truck_p_2) 0)
(= (fuel-per-minute truck_p_2) 10)
(empty truck_e_2)
(= (load truck_e_2) 0)
(= (electricity-per-minute truck_e_2) 10)
	(at package1 s2)
	(at package2 s1)
	(at package3 s1)
	(path s0 p0-1)
	(path p0-1 s0)
	(path s1 p0-1)
	(path p0-1 s1)
	(= (time-to-walk s0 p0-1) 37)
	(= (time-to-walk p0-1 s0) 37)
	(= (time-to-walk s1 p0-1) 39)
	(= (time-to-walk p0-1 s1) 39)
	(path s0 p0-2)
	(path p0-2 s0)
	(path s2 p0-2)
	(path p0-2 s2)
	(= (time-to-walk s0 p0-2) 68)
	(= (time-to-walk p0-2 s0) 68)
	(= (time-to-walk s2 p0-2) 7)
	(= (time-to-walk p0-2 s2) 7)
	(path s2 p2-1)
	(path p2-1 s2)
	(path s1 p2-1)
	(path p2-1 s1)
	(= (time-to-walk s2 p2-1) 30)
	(= (time-to-walk p2-1 s2) 30)
	(= (time-to-walk s1 p2-1) 19)
	(= (time-to-walk p2-1 s1) 19)
	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 52)
	(= (time-to-drive s2 s0) 52)
	(link s1 s0)
	(link s0 s1)
	(= (time-to-drive s1 s0) 63)
	(= (time-to-drive s0 s1) 63)
	(link s1 s2)
	(link s2 s1)
	(= (time-to-drive s1 s2) 86)
	(= (time-to-drive s2 s1) 86)
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)
	
		;; 'short' road s1-s3-s4-s2
	(link s1 s3)
	(link s3 s1)
	(= (time-to-drive s1 s3) 10)
	(= (time-to-drive s3 s1) 10)
	(link s4 s3)
	(link s3 s4)
	(= (time-to-drive s4 s3) 2)
	(= (time-to-drive s3 s4) 2)
	(link s2 s4)
	(link s4 s2)
	(= (time-to-drive s2 s4) 10)
	(= (time-to-drive s4 s2) 10)
	
	
	

)
	(:goal (and
	(at driver1 s1)
	(at driver2 s1)

	(at package1 s0)
	(at package2 s2)
	(at package3 s0)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
