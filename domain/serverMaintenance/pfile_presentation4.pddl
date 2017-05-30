(define (problem backendrestarts-pfile1)
	(:domain backendrestarts)
	(:objects
	s1_1 - server
	s2_1 - server
	s3_1 - server
	s4_1 - server

        s1_2 - server
        s2_2 - server
        s3_2 - server
        s4_2 - server

        s1_3 - server
        s2_3 - server
        s3_3 - server
        s4_3 - server

        s1_4 - server
        s2_4 - server
        s3_4 - server

	b1 - backend
	b2 - backend
        b3 - backend
        b4 - backend
	)
	
	
	(:init
		(maintanance-mode)
                (in b1 s1_1)
                (in b1 s2_1)
                (in b1 s3_1)
                (in b1 s4_1)

                (in b2 s1_2)
                (in b2 s2_2)
                (in b2 s3_2)
                (in b2 s4_2)

                (in b3 s1_3)
                (in b3 s2_3)
                (in b3 s3_3)
                (in b3 s4_3)

                (in b4 s1_4)
                (in b4 s2_4)
                (in b4 s3_4)

                (enabled s1_1)
                (enabled s2_1)
                (enabled s3_1)
                (enabled s4_1)
                (enabled s1_2)
                (enabled s2_2)
                (enabled s3_2)
                (enabled s4_2)
                (enabled s1_3)
                (enabled s2_3)
                (enabled s3_3)
                (enabled s4_3)
                (enabled s1_4)
                (enabled s2_4)
                (enabled s3_4)

                (= (active-backends s1_1) 1)
                (= (active-backends s2_1) 1)
                (= (active-backends s3_1) 1)
                (= (active-backends s4_1) 1)
                (= (active-backends s1_2) 1)
                (= (active-backends s2_2) 1)
                (= (active-backends s3_2) 1)
                (= (active-backends s4_2) 1)
                (= (active-backends s1_3) 1)
                (= (active-backends s2_3) 1)
                (= (active-backends s3_3) 1)
                (= (active-backends s4_3) 1)
                (= (active-backends s1_4) 1)
                (= (active-backends s2_4) 1)
                (= (active-backends s3_4) 1)
                (= (inactive-backends s1_1) 0)
                (= (inactive-backends s2_1) 0)
                (= (inactive-backends s3_1) 0)
                (= (inactive-backends s4_1) 0)
                (= (inactive-backends s1_2) 0)
                (= (inactive-backends s2_2) 0)
                (= (inactive-backends s3_2) 0)
                (= (inactive-backends s4_2) 0)
                (= (inactive-backends s1_3) 0)
                (= (inactive-backends s2_3) 0)
                (= (inactive-backends s3_3) 0)
                (= (inactive-backends s4_3) 0)
                (= (inactive-backends s1_4) 0)
                (= (inactive-backends s2_4) 0)
                (= (inactive-backends s3_4) 0)

		(= (active b1) 4)
		(= (active b2) 4)
                (= (active b3) 4)
                (= (active b4) 3)

		(= (maintanance-count) 0)

)
	(:goal (and
                (maintained s1_1)
                (maintained s2_1)
                (maintained s3_1)
                (maintained s4_1)
                (maintained s1_2)
                (maintained s2_2)
                (maintained s3_2)
                (maintained s4_2)
                (maintained s1_3)
                (maintained s2_3)
                (maintained s3_3)
                (maintained s4_3)
                (maintained s1_4)
                (maintained s2_4)
                (maintained s3_4)
	))
 (:metric minimize (maintanance-count))
)
