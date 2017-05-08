(define (problem thermostat1)
	(:domain thermostat)
	
	(:objects
		state1 - thermostatstate
		state2 - thermostatstate
	)

	(:init
	
		(= (currentTemperature) 10)
		
		(= (temperature state1) 19)
		(= (temperature state2) 26)
		
		(CurrentThermostatState state2)
		
		(= (powerUsed) 0)
	)
	(:goal (and
	    (feelcomfortable)
		)
	)
(:metric minimize (powerUsed))


)
