(define (domain thermostat)
	(:requirements :typing :fluents :negative-preconditions) 
	(:types thermostatstate 
	room - object
		
	)

	(:predicates 
	     	(CurrentThermostatState ?s - thermostatstate)
		(heatingon)
		(feelcomfortable)
		(thermostatOpened)
		(connected ?r1 - room ?r2 - room)	;if two rooms are connected.
		(CurrentLocation ?r - room)  		; where the person currently is.
		(RoomWhereYouFeelComfortable ?r - room); a room where you have to be to feel comfortable.
		(RoomWhereYouManipulateThermostat ?r - room); a room where you have to be to manipulate thermostat.
	)
	

	(:functions 
	      (temperature ?t - thermostatstate)       ;what temperature this state represents.
		(currentTemperature) 			 ; current temperature.
		(powerUsed)
	)

	(:action OpenThermostat
		:parameters()
		:precondition (and
		    (not (thermostatOpened))
			      )
		:effect (and
		      (thermostatOpened)
			)
	)
	
	(:action walk
		:parameters(?r1 - room ?r2 - room)
		:precondition (and
		    (CurrentLocation ?r1)
		    (connected ?r1 ?r2)
			      )
		:effect (and
		      (CurrentLocation ?r2)
		      (not (CurrentLocation ?r1))
			)
	)
	
	(:action SetThermostat
		:parameters(?r - room ?t - thermostatstate ?o - thermostatstate)
		:precondition (and
		    (thermostatOpened)
		      (CurrentLocation ?r)
			  (CurrentThermostatState ?o)
			  (RoomWhereYouManipulateThermostat ?r)
			      )
		:effect (and
			       (not (CurrentThermostatState ?o))
			       (CurrentThermostatState ?t)
			       (not  (thermostatOpened))
			)
	)

	
	(:action SwitchHeatingOn
		:parameters(?t - thermostatstate)
		:precondition (and
			    (CurrentThermostatState ?t)
			    (not (heatingon))
			    (> (temperature ?t) (currentTemperature))
			      )
		:effect (and
			       (heatingon)
			       (increase (powerUsed) (-  (temperature ?t) (currentTemperature)))
			)
	)
	
	
	(:action EnjoyTheFlat
		:parameters(?r - room ?t - thermostatstate)
		:precondition (and
			  (CurrentThermostatState ?t)
			  (heatingon)
			  (RoomWhereYouFeelComfortable ?r)
			  (CurrentLocation ?r)
			      )
		:effect (and
			      (feelcomfortable)
			      (not (heatingon))
			)
	)


	
	
	
)
