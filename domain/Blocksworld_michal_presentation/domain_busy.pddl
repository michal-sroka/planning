(define (domain blocksworld)
  ;; (:requirements :strips)
  (:types block)
  (:predicates (clear ?x - block)
               (on-table ?x - block)
               (holding ?x - block)
               (on ?x - block ?y - block)
		(gripperBusy))

  (:action pickup
           :parameters (?ob - block)
           :precondition (and (clear ?ob) (on-table ?ob) (not (gripperBusy)))
           :effect (and (holding ?ob) (not (clear ?ob)) (not (on-table ?ob)) (gripperBusy)))

  (:action putdown
           :parameters (?ob - block)
           :precondition (and (holding ?ob))
           :effect (and (clear ?ob) (on-table ?ob) 
                        (not (holding ?ob)) (not (gripperBusy))))

  (:action stack
           :parameters (?ob ?underob - block)
           :precondition (and  (clear ?underob) (holding ?ob) (gripperBusy))
           :effect (and (clear ?ob) (on ?ob ?underob) (not (gripperBusy))
                        (not (clear ?underob)) (not (holding ?ob))))

  (:action unstack
           :parameters (?ob ?underob - block)
           :precondition (and (on ?ob ?underob) (clear ?ob) (not (gripperBusy)))
           :effect (and (holding ?ob) (clear ?underob) (gripperBusy)
                        (not (on ?ob ?underob)) (not (clear ?ob)))))
