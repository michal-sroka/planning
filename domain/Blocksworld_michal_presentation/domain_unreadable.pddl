(define (domain unreadable)
  ;; (:requirements :strips)

  (:predicates (predicate1 ?x)
               (predicate2 ?x)
               (predicate3 ?x)
               (predicate4 ?x ?y))

  (:action action1
           :parameters (?object1)
           :precondition (and (predicate1 ?object1) (predicate2 ?object1))
           :effect (and (predicate3 ?object1) (not (predicate1 ?object1)) 
		   (not (predicate2 ?object1))))

  (:action action2
           :parameters (?object1)
           :precondition (and (predicate3 ?object1))
           :effect (and (predicate1 ?object1) (predicate2 ?object1) 
                        (not (predicate3 ?object1))))

  (:action action3
           :parameters (?object1 ?object2)
           :precondition (and  (predicate1 ?object2) (predicate3 ?object1))
           :effect (and (predicate1 ?object1) (predicate4 ?object1 ?object2)
                        (not (predicate1 ?object2)) (not (predicate3 ?object1))))

  (:action action4
           :parameters (?object1 ?object2)
           :precondition (and (predicate4 ?object1 ?object2) (predicate1 ?object1))
           :effect (and (predicate3 ?object1) (predicate1 ?object2)
                        (not (predicate4 ?object1 ?object2)) (not (predicate1 ?object1)))))