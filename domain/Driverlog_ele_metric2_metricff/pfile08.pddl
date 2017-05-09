(define (problem DLOG-3-3-7)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	truck_p_1 - petroltruck 
 truck_e_1 - electrictruck
	truck_p_2 - petroltruck 
 truck_e_2 - electrictruck
	truck_p_3 - petroltruck 
 truck_e_3 - electrictruck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	package7 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	s1-2-p1 - location
	s1-2-p2 - location
	
	s0-1-p1 - location
	s0-1-p2 - location
	
	s0-2-p1 - location
	s0-2-p2 - location
	p1-0 - location
	p2-0 - location
	p2-1 - location
	)
	(:init
	(at driver1 s2)
	(at driver2 s0)
	(at driver3 s1)
	(at truck_p_1 s2)
(at truck_e_1 s2)
	(empty truck_p_1)
(= (load truck_p_1) 0)
(= (fuel-per-minute truck_p_1) 10)
(empty truck_e_1)
(= (load truck_e_1) 0)
(= (electricity-per-minute truck_e_1) 10)
	(at truck_p_2 s2)
(at truck_e_2 s2)
	(empty truck_p_2)
(= (load truck_p_2) 0)
(= (fuel-per-minute truck_p_2) 10)
(empty truck_e_2)
(= (load truck_e_2) 0)
(= (electricity-per-minute truck_e_2) 10)
	(at truck_p_3 s2)
(at truck_e_3 s2)
	(empty truck_p_3)
(= (load truck_p_3) 0)
(= (fuel-per-minute truck_p_3) 10)
(empty truck_e_3)
(= (load truck_e_3) 0)
(= (electricity-per-minute truck_e_3) 10)
	(at package1 s0)
	(at package2 s1)
	(at package3 s0)
	(at package4 s0)
	(at package5 s1)
	(at package6 s2)
	(at package7 s2)
	(path s1 p1-0)
	(path p1-0 s1)
	(path s0 p1-0)
	(path p1-0 s0)
	(= (time-to-walk s1 p1-0) 75)
	(= (time-to-walk p1-0 s1) 75)
	(= (time-to-walk s0 p1-0) 24)
	(= (time-to-walk p1-0 s0) 24)
	(path s2 p2-0)
	(path p2-0 s2)
	(path s0 p2-0)
	(path p2-0 s0)
	(= (time-to-walk s2 p2-0) 77)
	(= (time-to-walk p2-0 s2) 77)
	(= (time-to-walk s0 p2-0) 91)
	(= (time-to-walk p2-0 s0) 91)
	(path s2 p2-1)
	(path p2-1 s2)
	(path s1 p2-1)
	(path p2-1 s1)
	(= (time-to-walk s2 p2-1) 15)
	(= (time-to-walk p2-1 s2) 15)
	(= (time-to-walk s1 p2-1) 17)
	(= (time-to-walk p2-1 s1) 17)
	(link s0 s1)
	(link s1 s0)
	(= (time-to-drive s0 s1) 83)
	(= (time-to-drive s1 s0) 83)
	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 87)
	(= (time-to-drive s2 s0) 87)
	(link s1 s2)
	(link s2 s1)
	(= (time-to-drive s1 s2) 25)
	(= (time-to-drive s2 s1) 25)
	
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
	
	;;;;;;;;;;;;; end of extras
	
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)
	(= (total-cost) 0)
)
	(:goal (and
	(at driver1 s2)
	(at driver2 s0)

	(at package1 s2)
	(at package2 s0)
	(at package3 s1)
	(at package4 s2)
	(at package5 s1)
	(at package6 s2)
	(at package7 s1)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
