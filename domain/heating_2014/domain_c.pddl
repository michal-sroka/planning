(define (domain thermostat)
	(:requirements :typing :fluents) 
	(:types thermostatstate 
		
	)

	(:predicates 
	     	(CurrentThermostatState ?s - thermostatstate)
		(heatingon)
		(feelcomfortable)
	)
	

	(:functions 
	      (temperature ?t - thermostatstate)       ;what temperature this state represents.
		(currentTemperature) 			 ; current temperature.
		(powerUsed)
	)

	(:action SetThermostat
		:parameters(?t - thermostatstate ?o - thermostatstate)
		:precondition (and
			  (CurrentThermostatState ?o)
			      )
		:effect (and
			       (not (CurrentThermostatState ?o))
			       (CurrentThermostatState ?t)
			)
	)

	
	(:action SwitchHeatingOn
		:parameters(?t - thermostatstate)
		:precondition (and
			    (CurrentThermostatState ?t)
			    (not (heatingon))
			      )
		:effect (and
			       (heatingon)
			       (increase (powerUsed) (-  (temperature ?t) (currentTemperature)))
			)
	)
	
	
	(:action EnjoyTheFlat
		:parameters(?t - thermostatstate)
		:precondition (and
			  (CurrentThermostatState ?t)
			  (heatingon)
			      )
		:effect (and
			      (feelcomfortable)
			)
	)


	
	
	
)
