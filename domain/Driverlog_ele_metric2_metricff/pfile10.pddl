(define (problem DLOG-2-3-6)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
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
	p1-4 - location
	p1-5 - location
	p2-1 - location
	p2-3 - location
	p3-0 - location
	p3-1 - location
	p3-5 - location
	p4-5 - location
	)
	(:init
	(at driver1 s4)
	(at driver2 s0)
	(at truck_p_1 s0)
(at truck_e_1 s0)
	(empty truck_p_1)
(= (load truck_p_1) 0)
(= (fuel-per-minute truck_p_1) 10)
(empty truck_e_1)
(= (load truck_e_1) 0)
(= (electricity-per-minute truck_e_1) 10)
	(at truck_p_2 s4)
(at truck_e_2 s4)
	(empty truck_p_2)
(= (load truck_p_2) 0)
(= (fuel-per-minute truck_p_2) 10)
(empty truck_e_2)
(= (load truck_e_2) 0)
(= (electricity-per-minute truck_e_2) 10)
	(at truck_p_3 s5)
(at truck_e_3 s5)
	(empty truck_p_3)
(= (load truck_p_3) 0)
(= (fuel-per-minute truck_p_3) 10)
(empty truck_e_3)
(= (load truck_e_3) 0)
(= (electricity-per-minute truck_e_3) 10)
	(at package1 s1)
	(at package2 s0)
	(at package3 s4)
	(at package4 s4)
	(at package5 s4)
	(at package6 s2)
	(path s1 p1-0)
	(path p1-0 s1)
	(path s0 p1-0)
	(path p1-0 s0)
	(= (time-to-walk s1 p1-0) 78)
	(= (time-to-walk p1-0 s1) 78)
	(= (time-to-walk s0 p1-0) 57)
	(= (time-to-walk p1-0 s0) 57)
	(path s1 p1-4)
	(path p1-4 s1)
	(path s4 p1-4)
	(path p1-4 s4)
	(= (time-to-walk s1 p1-4) 100)
	(= (time-to-walk p1-4 s1) 100)
	(= (time-to-walk s4 p1-4) 77)
	(= (time-to-walk p1-4 s4) 77)
	(path s1 p1-5)
	(path p1-5 s1)
	(path s5 p1-5)
	(path p1-5 s5)
	(= (time-to-walk s1 p1-5) 65)
	(= (time-to-walk p1-5 s1) 65)
	(= (time-to-walk s5 p1-5) 32)
	(= (time-to-walk p1-5 s5) 32)
	(path s2 p2-1)
	(path p2-1 s2)
	(path s1 p2-1)
	(path p2-1 s1)
	(= (time-to-walk s2 p2-1) 88)
	(= (time-to-walk p2-1 s2) 88)
	(= (time-to-walk s1 p2-1) 41)
	(= (time-to-walk p2-1 s1) 41)
	(path s2 p2-3)
	(path p2-3 s2)
	(path s3 p2-3)
	(path p2-3 s3)
	(= (time-to-walk s2 p2-3) 34)
	(= (time-to-walk p2-3 s2) 34)
	(= (time-to-walk s3 p2-3) 16)
	(= (time-to-walk p2-3 s3) 16)
	(path s3 p3-0)
	(path p3-0 s3)
	(path s0 p3-0)
	(path p3-0 s0)
	(= (time-to-walk s3 p3-0) 31)
	(= (time-to-walk p3-0 s3) 31)
	(= (time-to-walk s0 p3-0) 27)
	(= (time-to-walk p3-0 s0) 27)
	(path s3 p3-1)
	(path p3-1 s3)
	(path s1 p3-1)
	(path p3-1 s1)
	(= (time-to-walk s3 p3-1) 25)
	(= (time-to-walk p3-1 s3) 25)
	(= (time-to-walk s1 p3-1) 51)
	(= (time-to-walk p3-1 s1) 51)
	(path s3 p3-5)
	(path p3-5 s3)
	(path s5 p3-5)
	(path p3-5 s5)
	(= (time-to-walk s3 p3-5) 12)
	(= (time-to-walk p3-5 s3) 12)
	(= (time-to-walk s5 p3-5) 13)
	(= (time-to-walk p3-5 s5) 13)
	(path s4 p4-5)
	(path p4-5 s4)
	(path s5 p4-5)
	(path p4-5 s5)
	(= (time-to-walk s4 p4-5) 59)
	(= (time-to-walk p4-5 s4) 59)
	(= (time-to-walk s5 p4-5) 36)
	(= (time-to-walk p4-5 s5) 36)
	(link s0 s5)
	(link s5 s0)
	(= (time-to-drive s0 s5) 31)
	(= (time-to-drive s5 s0) 31)
	(link s1 s0)
	(link s0 s1)
	(= (time-to-drive s1 s0) 31)
	(= (time-to-drive s0 s1) 31)
	(link s1 s2)
	(link s2 s1)
	(= (time-to-drive s1 s2) 22)
	(= (time-to-drive s2 s1) 22)
	(link s1 s4)
	(link s4 s1)
	(= (time-to-drive s1 s4) 27)
	(= (time-to-drive s4 s1) 27)
	(link s1 s5)
	(link s5 s1)
	(= (time-to-drive s1 s5) 100)
	(= (time-to-drive s5 s1) 100)
	(link s2 s0)
	(link s0 s2)
	(= (time-to-drive s2 s0) 47)
	(= (time-to-drive s0 s2) 47)
	(link s3 s0)
	(link s0 s3)
	(= (time-to-drive s3 s0) 54)
	(= (time-to-drive s0 s3) 54)
	(link s3 s1)
	(link s1 s3)
	(= (time-to-drive s3 s1) 72)
	(= (time-to-drive s1 s3) 72)
	(link s3 s2)
	(link s2 s3)
	(= (time-to-drive s3 s2) 6)
	(= (time-to-drive s2 s3) 6)
	(link s3 s4)
	(link s4 s3)
	(= (time-to-drive s3 s4) 18)
	(= (time-to-drive s4 s3) 18)
	(link s4 s0)
	(link s0 s4)
	(= (time-to-drive s4 s0) 8)
	(= (time-to-drive s0 s4) 8)
	(link s5 s3)
	(link s3 s5)
	(= (time-to-drive s5 s3) 47)
	(= (time-to-drive s3 s5) 47)
	(link s5 s4)
	(link s4 s5)
	(= (time-to-drive s5 s4) 10)
	(= (time-to-drive s4 s5) 10)
	
	
			
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
	(at package1 s5)
	(at package2 s1)
	(at package3 s5)
	(at package4 s1)
	(at package5 s3)
	(at package6 s2)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
