(define (problem DLOG-3-2-4)
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
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s1-2-p1 - location
	s1-2-p2 - location
	
	s0-1-p1 - location
	s0-1-p2 - location
	
	s0-2-p1 - location
	s0-2-p2 - location
	p0-1 - location
	p1-0 - location
	p1-2 - location
	p2-1 - location
	)
	(:init
	(at driver1 s1)
	(at driver2 s1)
	(at driver3 s0)
	(at truck_p_1 s1)
(at truck_e_1 s1)
	(empty truck_p_1)
(= (load truck_p_1) 0)
(= (fuel-per-minute truck_p_1) 10)
(empty truck_e_1)
(= (load truck_e_1) 0)
(= (electricity-per-minute truck_e_1) 10)
	(at truck_p_2 s0)
(at truck_e_2 s0)
	(empty truck_p_2)
(= (load truck_p_2) 0)
(= (fuel-per-minute truck_p_2) 10)
(empty truck_e_2)
(= (load truck_e_2) 0)
(= (electricity-per-minute truck_e_2) 10)
	(at package1 s2)
	(at package2 s2)
	(at package3 s0)
	(at package4 s1)
	(path s0 p0-1)
	(path p0-1 s0)
	(path s1 p0-1)
	(path p0-1 s1)
	(= (time-to-walk s0 p0-1) 8)
	(= (time-to-walk p0-1 s0) 8)
	(= (time-to-walk s1 p0-1) 99)
	(= (time-to-walk p0-1 s1) 99)
	(path s1 p1-2)
	(path p1-2 s1)
	(path s2 p1-2)
	(path p1-2 s2)
	(= (time-to-walk s1 p1-2) 94)
	(= (time-to-walk p1-2 s1) 94)
	(= (time-to-walk s2 p1-2) 97)
	(= (time-to-walk p1-2 s2) 97)
	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 56)
	(= (time-to-drive s2 s0) 56)
	(link s1 s0)
	(link s0 s1)
	(= (time-to-drive s1 s0) 43)
	(= (time-to-drive s0 s1) 43)
	(link s2 s1)
	(link s1 s2)
	(= (time-to-drive s2 s1) 37)
	(= (time-to-drive s1 s2) 37)
	
	;; 'short' road s0-s3-s2
	(link s0 s3)
	(link s3 s0)
	(= (time-to-drive s0 s3) 8)
	(= (time-to-drive s3 s0) 8)
	
	(link s2 s3)
	(link s3 s2)
	(= (time-to-drive s2 s3) 8)
	(= (time-to-drive s3 s2) 8)
	
	
	(link s2 s4)
	(link s4 s2)
	(= (time-to-drive s2 s4) 8)
	(= (time-to-drive s4 s2) 8)
	
	(link s1 s4)
	(link s4 s1)
	(= (time-to-drive s1 s4) 8)
	(= (time-to-drive s4 s1) 8)
			
	;; short 0-1
	(link s0 s0-1-p1)
	(link s0-1-p1 s0)
	(link s0-1-p1 s0-1-p2)
	(link s0-1-p2 s0-1-p1)
	(link s1 s0-1-p2)
	(link s0-1-p2 s1)
	
	(= (time-to-drive s0 s0-1-p1) 1)
	(= (time-to-drive s0-1-p1 s0) 1)
	(= (time-to-drive s0-1-p1 s0-1-p2) 1)
	(= (time-to-drive s0-1-p2 s0-1-p1) 1)
	(= (time-to-drive s1 s0-1-p2) 1)
	(= (time-to-drive s0-1-p2 s1) 1)
	
	;; short 1-2
		(link s0 s0-1-p1)
	(link s1-2-p1 s1)
	(link s1-2-p1 s1-2-p2)
	(link s1-2-p2 s1-2-p1)
	(link s2 s1-2-p2)
	(link s1-2-p2 s2)
	
	(= (time-to-drive s1 s1-2-p1) 1)
	(= (time-to-drive s1-2-p1 s1) 1)
	(= (time-to-drive s1-2-p1 s1-2-p2) 1)
	(= (time-to-drive s1-2-p2 s1-2-p1) 1)
	(= (time-to-drive s2 s1-2-p2) 1)
	(= (time-to-drive s1-2-p2 s2) 1)
	
	;; short 0-2
	(link s0 s0-2-p1)
	(link s0-2-p1 s0)
	(link s0-2-p1 s0-2-p2)
	(link s0-2-p2 s0-2-p1)
	(link s2 s0-2-p2)
	(link s0-2-p2 s2)
	
	(= (time-to-drive s0 s0-2-p1) 1)
	(= (time-to-drive s0-2-p1 s0) 1)
	(= (time-to-drive s0-2-p1 s0-2-p2) 1)
	(= (time-to-drive s0-2-p2 s0-2-p1) 1)
	(= (time-to-drive s2 s0-2-p2) 1)
	(= (time-to-drive s0-2-p2 s2) 1)
	;;;;;;;;;; end of new routs.
	
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)

    	(= (total-cost) 0)
)
	(:goal (and
	(at driver1 s1)
	(at driver2 s0)
	(at driver3 s1)

	(at package1 s1)
	(at package2 s2)
	(at package3 s2)
	(at package4 s0)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
