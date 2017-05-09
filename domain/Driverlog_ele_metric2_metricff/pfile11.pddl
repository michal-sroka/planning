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
	s6 - location
	s7 - location
	s1-2-p1 - location
	s1-2-p2 - location
	
	s0-1-p1 - location
	s0-1-p2 - location
	
	s0-2-p1 - location
	s0-2-p2 - location
	p0-3 - location
	p1-0 - location
	p1-5 - location
	p2-3 - location
	p2-6 - location
	p3-4 - location
	p4-0 - location
	p4-1 - location
	p4-2 - location
	p5-0 - location
	p6-3 - location
	)
	(:init
	(at driver1 s6)
	(at driver2 s0)
	(at truck_p_1 s0)
(at truck_e_1 s0)
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
	(at package1 s6)
	(at package2 s2)
	(at package3 s3)
	(at package4 s0)
	(at package5 s5)
	(at package6 s5)
	(path s0 p0-3)
	(path p0-3 s0)
	(path s3 p0-3)
	(path p0-3 s3)
	(= (time-to-walk s0 p0-3) 80)
	(= (time-to-walk p0-3 s0) 80)
	(= (time-to-walk s3 p0-3) 9)
	(= (time-to-walk p0-3 s3) 9)
	(path s1 p1-0)
	(path p1-0 s1)
	(path s0 p1-0)
	(path p1-0 s0)
	(= (time-to-walk s1 p1-0) 69)
	(= (time-to-walk p1-0 s1) 69)
	(= (time-to-walk s0 p1-0) 58)
	(= (time-to-walk p1-0 s0) 58)
	(path s1 p1-5)
	(path p1-5 s1)
	(path s5 p1-5)
	(path p1-5 s5)
	(= (time-to-walk s1 p1-5) 16)
	(= (time-to-walk p1-5 s1) 16)
	(= (time-to-walk s5 p1-5) 40)
	(= (time-to-walk p1-5 s5) 40)
	(path s2 p2-3)
	(path p2-3 s2)
	(path s3 p2-3)
	(path p2-3 s3)
	(= (time-to-walk s2 p2-3) 84)
	(= (time-to-walk p2-3 s2) 84)
	(= (time-to-walk s3 p2-3) 56)
	(= (time-to-walk p2-3 s3) 56)
	(path s2 p2-6)
	(path p2-6 s2)
	(path s6 p2-6)
	(path p2-6 s6)
	(= (time-to-walk s2 p2-6) 9)
	(= (time-to-walk p2-6 s2) 9)
	(= (time-to-walk s6 p2-6) 37)
	(= (time-to-walk p2-6 s6) 37)
	(path s3 p3-4)
	(path p3-4 s3)
	(path s4 p3-4)
	(path p3-4 s4)
	(= (time-to-walk s3 p3-4) 95)
	(= (time-to-walk p3-4 s3) 95)
	(= (time-to-walk s4 p3-4) 85)
	(= (time-to-walk p3-4 s4) 85)
	(path s4 p4-0)
	(path p4-0 s4)
	(path s0 p4-0)
	(path p4-0 s0)
	(= (time-to-walk s4 p4-0) 65)
	(= (time-to-walk p4-0 s4) 65)
	(= (time-to-walk s0 p4-0) 88)
	(= (time-to-walk p4-0 s0) 88)
	(path s4 p4-1)
	(path p4-1 s4)
	(path s1 p4-1)
	(path p4-1 s1)
	(= (time-to-walk s4 p4-1) 85)
	(= (time-to-walk p4-1 s4) 85)
	(= (time-to-walk s1 p4-1) 23)
	(= (time-to-walk p4-1 s1) 23)
	(path s4 p4-2)
	(path p4-2 s4)
	(path s2 p4-2)
	(path p4-2 s2)
	(= (time-to-walk s4 p4-2) 26)
	(= (time-to-walk p4-2 s4) 26)
	(= (time-to-walk s2 p4-2) 37)
	(= (time-to-walk p4-2 s2) 37)
	(path s5 p5-0)
	(path p5-0 s5)
	(path s0 p5-0)
	(path p5-0 s0)
	(= (time-to-walk s5 p5-0) 41)
	(= (time-to-walk p5-0 s5) 41)
	(= (time-to-walk s0 p5-0) 71)
	(= (time-to-walk p5-0 s0) 71)
	(path s6 p6-3)
	(path p6-3 s6)
	(path s3 p6-3)
	(path p6-3 s3)
	(= (time-to-walk s6 p6-3) 8)
	(= (time-to-walk p6-3 s6) 8)
	(= (time-to-walk s3 p6-3) 19)
	(= (time-to-walk p6-3 s3) 19)
	(link s0 s2)
	(link s2 s0)
	(= (time-to-drive s0 s2) 80)
	(= (time-to-drive s2 s0) 80)
	(link s0 s5)
	(link s5 s0)
	(= (time-to-drive s0 s5) 3)
	(= (time-to-drive s5 s0) 3)
	(link s1 s0)
	(link s0 s1)
	(= (time-to-drive s1 s0) 83)
	(= (time-to-drive s0 s1) 83)
	(link s1 s3)
	(link s3 s1)
	(= (time-to-drive s1 s3) 62)
	(= (time-to-drive s3 s1) 62)
	(link s1 s4)
	(link s4 s1)
	(= (time-to-drive s1 s4) 20)
	(= (time-to-drive s4 s1) 20)
	(link s1 s6)
	(link s6 s1)
	(= (time-to-drive s1 s6) 82)
	(= (time-to-drive s6 s1) 82)
	(link s2 s1)
	(link s1 s2)
	(= (time-to-drive s2 s1) 37)
	(= (time-to-drive s1 s2) 37)
	(link s2 s4)
	(link s4 s2)
	(= (time-to-drive s2 s4) 27)
	(= (time-to-drive s4 s2) 27)
	(link s3 s6)
	(link s6 s3)
	(= (time-to-drive s3 s6) 87)
	(= (time-to-drive s6 s3) 87)
	(link s4 s0)
	(link s0 s4)
	(= (time-to-drive s4 s0) 17)
	(= (time-to-drive s0 s4) 17)
	(link s5 s1)
	(link s1 s5)
	(= (time-to-drive s5 s1) 35)
	(= (time-to-drive s1 s5) 35)
	(link s5 s2)
	(link s2 s5)
	(= (time-to-drive s5 s2) 56)
	(= (time-to-drive s2 s5) 56)
	(link s6 s0)
	(link s0 s6)
	(= (time-to-drive s6 s0) 74)
	(= (time-to-drive s0 s6) 74)
	(link s6 s2)
	(link s2 s6)
	(= (time-to-drive s6 s2) 51)
	(= (time-to-drive s2 s6) 51)
	(link s6 s4)
	(link s4 s6)
	(= (time-to-drive s6 s4) 96)
	(= (time-to-drive s4 s6) 96)
	(link s6 s5)
	(link s5 s6)
	(= (time-to-drive s6 s5) 58)
	(= (time-to-drive s5 s6) 58)
	
	
	(link s7 s5)
	(link s5 s7)
	(= (time-to-drive s7 s5) 8)
	(= (time-to-drive s5 s7) 8)
	
	(link s7 s1)
	(link s1 s7)
	(= (time-to-drive s7 s1) 8)
	(= (time-to-drive s1 s7) 8)
	
			
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
	(at driver2 s4)
	(at package1 s6)
	(at package2 s3)
	(at package3 s4)
	(at package4 s6)
	(at package5 s1)
	;; added:
	(at package6 s2)
	))

(:metric minimize (electricity-used))
(:metric minimize (fuel-used))
(:metric minimize (walked))


)
