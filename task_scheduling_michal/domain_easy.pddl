(define (domain scheduling)
	;; (:requirements :typing :fluents :negative-preconditions) 
	(:types  task - object )

	(:predicates 
	    (achieved ?t - task)
	)

	(:functions 
	    	(total-cost)
		(time)       					; what is the current time. starts at 0.
		(priority ?t - task)  			; priority of the task 
	)

	(:action ACHIEVE
		:parameters(?t - task)
		:precondition (and (not (achieved ?t)))
		:effect (and
		      (achieved ?t)
			  (increase (time) 1)
			  (increase (total-cost) (* (priority ?t) (time)))
			)
	)
)
