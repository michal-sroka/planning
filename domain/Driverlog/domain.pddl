(define (domain driverlog)
  (:requirements :typing :fluents :equality :adl) 
  (:types           
	truck location locatable - object
	driver obj - locatable
	petroltruck electrictruck - truck
  )

  (:predicates 
		(at ?obj - object ?loc - location)
		(in ?obj1 - obj ?obj - truck)
		;;(carries ?obj1 - obj ?obj - postman)
		;;(loaded ?pos - postman)
		(driving ?d - driver ?v - truck)
		(link ?x ?y - location) (path ?x ?y - location)
		(empty ?v - truck)
)
  (:functions 	(time-to-walk ?l1 ?l2 - location)
		(time-to-drive ?l1 ?l2 - location)
		(fuel-used)
		(fuel-per-minute ?t - petroltruck)
		(electricity-used)
		(electricity-per-minute ?t - electrictruck)
		(driven)
		(load ?t - truck)
		(walked)
  )


(:action LOAD-TRUCK
  :parameters
   (?obj - obj
    ?truck - petroltruck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (at ?obj ?loc))
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?truck) (increase (load ?truck) 1)
		(increase (fuel-per-minute ?truck) (+ (load ?truck) 1))))

(:action UNLOAD-TRUCK
  :parameters
   (?obj - obj
    ?truck - petroltruck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (at ?obj ?loc) (decrease (load ?truck) 1)
		(decrease (fuel-per-minute ?truck) (load ?truck))))

(:action LOAD-ELECTRICTRUCK
  :parameters
   (?obj - obj
    ?truck - electrictruck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (at ?obj ?loc))
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?truck) (increase (load ?truck) 1)
		(increase (electricity-per-minute ?truck) (load ?truck))))

(:action UNLOAD-ELECTRICTRUCK
  :parameters
   (?obj - obj
    ?truck - electrictruck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (at ?obj ?loc) (decrease (load ?truck) 1)
		(decrease (electricity-per-minute ?truck) (load ?truck))))



(:action BOARD-TRUCK
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (at ?driver ?loc) (empty ?truck))
  :effect
   (and (not (at ?driver ?loc)) (driving ?driver ?truck) (not (empty ?truck))))

(:action DISEMBARK-TRUCK
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (driving ?driver ?truck))
  :effect
   (and (not (driving ?driver ?truck)) (at ?driver ?loc) (empty ?truck)))

(:action DRIVE-PETROLTRUCK
  :parameters
   (?truck - petroltruck
    ?loc-from - location
    ?loc-to - location
    ?driver - driver)
  :precondition
   (and (at ?truck ?loc-from)
   (driving ?driver ?truck) (link ?loc-from ?loc-to))
  :effect
   (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to)
		(increase (fuel-used) (* (fuel-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)))))


(:action DRIVE-ELECTRICTRUCK
  :parameters
   (?truck - electrictruck
    ?loc-from - location
    ?loc-to - location
    ?driver - driver)
  :precondition
   (and (at ?truck ?loc-from)
   (driving ?driver ?truck) (link ?loc-from ?loc-to))
  :effect
   (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to)
		(increase (electricity-used) (* (electricity-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)))
		)
		
		)

(:action WALK
  :parameters
   (?driver - driver
    ?loc-from - location
    ?loc-to - location)
  :precondition
   (and (at ?driver ?loc-from) (path ?loc-from ?loc-to))
  :effect
   (and (not (at ?driver ?loc-from)) (at ?driver ?loc-to) (increase (walked) (time-to-walk ?loc-from ?loc-to)))
   )
)
