
(define (problem backendrestarts-pfile1)
	(:domain backendrestarts)
	(:objects
	s1 - server
	s2 - server
	b1 - backend
	)
	
	
	(:init
		(maintanance-mode)
		(in b1 s1)
		(in b1 s2)

		(enabled s1)
		(enabled s2)

		(= (active-backends s1) 1)
		(= (active-backends s2) 1)

		(= (inactive-backends s1) 0)
		(= (inactive-backends s2) 0)

		(= (active b1) 2)
(= (maintanance-count) 0)

)
	(:goal (and
	(maintained s1)
	(maintained s2)
	))
 (:metric minimize (maintanance-count))
)
