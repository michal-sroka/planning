(define (problem thermostat1)
	(:domain thermostat)
	
	(:objects
		state19 - thermostatstate
		state26 - thermostatstate
		tvroom - room
		coridor1 - room
		thermostatroom - room
	)

	(:init
	
	
	(CurrentLocation tvroom)
	(RoomWhereYouFeelComfortable tvroom)
	(RoomWhereYouManipulateThermostat thermostatroom)
	
	(connected tvroom coridor1)
	(connected coridor1 tvroom)
	
	(connected coridor1 thermostatroom)
	(connected thermostatroom coridor1)
	
	
		(= (currentTemperature) 10)
		
		(= (temperature state19) 19)
		(= (temperature state26) 26)
		
		(CurrentThermostatState state26)
		
		(= (powerUsed) 0)
	)
	(:goal (and
	    (feelcomfortable)
		)
	)
(:metric minimize (powerUsed))

)
