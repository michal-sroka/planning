
(define (problem backendrestarts-pfile1)
	(:domain backendrestarts)
	(:objects
	s1 - server
	s2 - server
	s3 - server
	s4 - server
	s5 - server
	b1 - backend
	b2 - backend
	)
	
	
	(:init
		(maintanance-mode)
		(in b1 s1)
		(in b1 s2)
		(in b1 s3)
		(in b2 s3)
		(in b2 s4)
		(in b2 s5)

		(enabled s1)
		(enabled s2)
		(enabled s3)
		(enabled s4)
		(enabled s5)

		(= (active-backends s1) 1)
		(= (active-backends s2) 1)
		(= (active-backends s3) 2)
		(= (active-backends s4) 1)
		(= (active-backends s5) 1)

		(= (inactive-backends s1) 0)
		(= (inactive-backends s2) 0)
		(= (inactive-backends s3) 0)
		(= (inactive-backends s4) 0)
		(= (inactive-backends s5) 0)

		(= (active b1) 3)
		(= (active b2) 3)
(= (maintanance-count) 0)

)
	(:goal (and
	(maintained s1)
	(maintained s2)
	(maintained s3)
	(maintained s4)
	(maintained s5)
	))
 (:metric minimize (maintanance-count))
)
