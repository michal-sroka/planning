(define (problem DLOG-2-2-2)
	(:domain driverlog)
	(:objects
	driver1 - driver
	;;driver2 - driver
	truck_e_1 - electrictruck
	truck_p_1 - petroltruck 
	package1 - obj
	s0 - location
	s1 - location
	p1-0 - location
	)
	
	
	(:init
	(at driver1 s0)
	;;(at driver2 s0)
	(at truck_p_1 s0)
	(at truck_e_1 s0)
	(empty truck_p_1)
	(= (load truck_p_1) 0)
	(= (fuel-per-minute truck_p_1) 10)
	(empty truck_e_1)
	(= (load truck_e_1) 0)
	(= (electricity-per-minute truck_e_1) 10)
	
	(at package1 s0)

	(path s1 p1-0)
	(path p1-0 s1)
	(path s0 p1-0)
	(path p1-0 s0)
	(= (time-to-walk s1 p1-0) 43)
	(= (time-to-walk p1-0 s1) 43)
	(= (time-to-walk s0 p1-0) 80)
	(= (time-to-walk p1-0 s0) 80)
	
	(link s0 s1)
	(link s1 s0)
	(= (time-to-drive s0 s1) 70)
	(= (time-to-drive s1 s0) 70)

	
	(= (driven) 0)
	(= (walked) 0)
	(= (electricity-used) 0)
	(= (fuel-used) 0)
)
	(:goal (and
	(at package1 s1)
	))

;(:metric minimize (electricity-used))
;(:metric minimize (fuel-used))
;(:metric minimize (walked))
(:metric minimize (+ (walked) (+ (* (electricity-used) 2) (* (fuel-used) 10))))

)
