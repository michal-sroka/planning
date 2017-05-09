(define (problem DLOG-3-2-5)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	truck_p_1 - petroltruck 
 truck_e_1 - electrictruck
	truck_p_2 - petroltruck 
 truck_e_2 - electrictruck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	
	p0-1 - location
	p0-2 - location
	p1-2 - location
	)
	(:init
	(at driver1 s1)
	(at driver2 s0)
	(at driver3 s0)
	(at truck_p_1 s1)
(at truck_e_1 s1)
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
	(at package1 s0)
	(at package2 s0)
	(at package3 s2)
	(at package4 s2)
	(at package5 s1)
	(path s0 p0-1)
	(path p0-1 s0)
	(path s1 p0-1)
	(path p0-1 s1)
	(= (time-to-walk s0 p0-1) 64)
	(= (time-to-walk p0-1 s0) 64)
	(= (time-to-walk s1 p0-1) 23)
	(= (time-to-walk p0-1 s1) 23)
	(path s0 p0-2)
	(path p0-2 s0)
	(path s2 p0-2)
	(path p0-2 s2)
	(= (time-to-walk s0 p0-2) 34)
	(= (time-to-walk p0-2 s0) 34)
	(= (time-to-walk s2 p0-2) 78)
	(= (time-to-walk p0-2 s2) 78)
	(path s1 p1-2)
	(path p1-2 s1)
	(path s2 p1-2)
	(path p1-2 s2)
	(= (time-to-walk s1 p1-2) 46)
	(= (time-to-walk p1-2 s1) 46)
	(= (time-to-walk s2 p1-2) 18)
	(= (time-to-walk p1-2 s2) 18)
	(link s0 s1)
	(link s1 s0)
	(= (time-to-drive s0 s1) 20)
	(= (time-to-drive s1 s0) 20)
	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 50)
	(= (time-to-drive s2 s0) 50)
	(link s1 s2)
	(link s2 s1)
	(= (time-to-drive s1 s2) 14)
	(= (time-to-drive s2 s1) 14)
	
	;; 'short' road s0-s3-s2  and s2-s4-s1  s0-s5-s1
	(link s0 s3)
	(link s3 s0)
	(= (time-to-drive s0 s3) 8)
	(= (time-to-drive s3 s0) 8)
	
	(link s2 s3)
	(link s3 s2)
	(= (time-to-drive s2 s3) 1)
	(= (time-to-drive s3 s2) 1)
	
	
	(link s2 s4)
	(link s4 s2)
	(= (time-to-drive s2 s4) 8)
	(= (time-to-drive s4 s2) 8)
	
	(link s1 s4)
	(link s4 s1)
	(= (time-to-drive s1 s4) 8)
	(= (time-to-drive s4 s1) 8)
	
	(link s0 s5)
	(link s5 s0)
	(= (time-to-drive s0 s5) 5)
	(= (time-to-drive s5 s0) 5)
	
	(link s1 s5)
	(link s5 s1)
	(= (time-to-drive s1 s5) 5)
	(= (time-to-drive s5 s1) 5)
	;;;;;;;;;;;;; end of extras
	
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)

)
	(:goal (and
	(at driver2 s2)

	(at package1 s1)
	(at package2 s1)
	(at package3 s1)
	(at package4 s0)
	(at package5 s1)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
