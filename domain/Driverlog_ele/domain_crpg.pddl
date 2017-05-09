(define (domain driverlog)
  (:requirements :typing :fluents :durative-actions) 
  (:types           location locatable - object
  ;;postman
		truck driver  obj - locatable 
		petroltruck electrictruck - truck)

  (:predicates 
		(atat ?obj - locatable ?loc - location)
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
		;;(load-carried ?t - postman)
  )


(:action LOAD-TRUCK
  :parameters
   (?obj - obj
    ?truck - petroltruck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (atat ?obj ?loc))
  :effect
   (and (not (atat ?obj ?loc)) (in ?obj ?truck) (increase (load ?truck) 1)
		(increase (fuel-per-minute ?truck) (+ (load ?truck) 1))))

(:action UNLOAD-TRUCK
  :parameters
   (?obj - obj
    ?truck - petroltruck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (atat ?obj ?loc) (decrease (load ?truck) 1)
		(decrease (fuel-per-minute ?truck) (load ?truck))))

(:action LOAD-ELECTRICTRUCK
  :parameters
   (?obj - obj
    ?truck - electrictruck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (atat ?obj ?loc))
  :effect
   (and (not (atat ?obj ?loc)) (in ?obj ?truck) (increase (load ?truck) 1)
		(increase (electricity-per-minute ?truck) (+ (load ?truck) 1))))

(:action UNLOAD-ELECTRICTRUCK
  :parameters
   (?obj - obj
    ?truck - electrictruck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (atat ?obj ?loc) (decrease (load ?truck) 1)
		(decrease (electricity-per-minute ?truck) (load ?truck))))



(:action BOARD-TRUCK
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (atat ?driver ?loc) (empty ?truck))
  :effect
   (and (not (atat ?driver ?loc)) (driving ?driver ?truck) (not (empty ?truck))))

(:action DISEMBARK-TRUCK
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (atat ?truck ?loc) (driving ?driver ?truck))
  :effect
   (and (not (driving ?driver ?truck)) (atat ?driver ?loc) (empty ?truck)))

(:durative-action DRIVE-PETROLTRUCK
  :parameters
   (?truck - petroltruck
    ?loc-from - location
    ?loc-to - location
    ?driver - driver)
  :duration (= ?duration  1)
  ;; (* (fuel-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)) )
  :condition
   (and (at start (atat ?truck ?loc-from))
    (at start (driving ?driver ?truck))
    (at start (link ?loc-from ?loc-to))
    )
  :effect
   (and 
   (at end (not (atat ?truck ?loc-from)))
   (at end (atat ?truck ?loc-to))		
  ;; (increase (fuel-used) (* (fuel-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)))
   )
   
 )
  
		
		
(:durative-action DRIVE-ELECTRICTRUCK
  :parameters
   (?truck - electrictruck
    ?loc-from - location
    ?loc-to - location
    ?driver - driver)
  :duration (= ?duration (* (* (electricity-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)) 10) )
  :condition
   (and 
   (at start (atat ?truck ?loc-from))
   (at start (driving ?driver ?truck) )
   (at start (link ?loc-from ?loc-to))
   )
  :effect
   (and 
   (at end (not (atat ?truck ?loc-from)))
   (at end (atat ?truck ?loc-to) )
   ;; (increase (electricity-used) (* (electricity-per-minute ?truck) (time-to-drive ?loc-from ?loc-to)))
   )
   
   )

(:durative-action WALK
  :parameters
   (?driver - driver
    ?loc-from - location
    ?loc-to - location)
  :duration (= ?duration (time-to-walk ?loc-from ?loc-to))
  :condition
   (and 
   (at start (atat ?driver ?loc-from))
   (at start (path ?loc-from ?loc-to))
   )
  :effect
   (and 
   (at end (not (atat ?driver ?loc-from)))
   (at end (atat ?driver ?loc-to) )
  ;; (increase (walked) (time-to-walk ?loc-from ?loc-to))
  )
  
   )
)
