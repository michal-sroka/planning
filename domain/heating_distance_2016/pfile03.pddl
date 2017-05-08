(define (problem thermostat1)
	(:domain thermostat)
	
	(:objects
		state19 - thermostatstate
		state26 - thermostatstate
		tvroom - room
		coridor1 - room
		coridor2 - room
		coridor3 - room
		thermostatroom - room
	)

	(:init
	
	
	(CurrentLocation tvroom)
	(RoomWhereYouFeelComfortable tvroom)
	(RoomWhereYouManipulateThermostat thermostatroom)
	
	(connected tvroom coridor1)
	(connected coridor1 tvroom)
	
	(connected coridor2 coridor1)
	(connected coridor1 coridor2)

	(connected coridor2 coridor3)
	(connected coridor3 coridor2)
	
	(connected coridor3 thermostatroom)
	(connected thermostatroom coridor3)
	
	
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
