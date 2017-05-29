(define (problem SCHDULING-1)
(:domain scheduling)
(:objects
	task1-1 - task
	task1-2 - task
	task1-3 - task
	task1-4 - task
	task2-1 - task
	task2-2 - task
	task2-3 - task
	task2-4 - task
	)

(:init
	(= (total-cost) 0)
	(= (time) 5)
	(= (priority task1-1) 1)
	(= (priority task1-2) 1)
	(= (priority task1-3) 1)
	(= (priority task1-4) 1)
	(= (priority task2-1) 2)
	(= (priority task2-2) 2)
	(= (priority task2-3) 2)
	(= (priority task2-4) 2)
	(= (task-last-executed task1-1) 0)
	(= (task-last-executed task1-2) 0)
	(= (task-last-executed task1-3) 0)
	(= (task-last-executed task1-4) 0)
	(= (task-last-executed task2-1) 0)
	(= (task-last-executed task2-2) 5)
	(= (task-last-executed task2-3) 0)
	(= (task-last-executed task2-4) 0)
	
)
(:goal 
	(and
		(achieved task1-1)
		(achieved task1-2)
		(achieved task1-3)
		(achieved task1-4)
		(achieved task2-1)
		(achieved task2-2)
		(achieved task2-3)
		(achieved task2-4)
	)
)

(:metric minimize (total-cost))
	;;(:metric minimize (+ (walked) (+ (* (electricity-used) 9) (* (fuel-used) 2))))
)
