(define (problem thermostat1)
	(:domain thermostat)
	
	(:objects
		state12 - thermostatstate
		state19 - thermostatstate
		state26 - thermostatstate
		state40 - thermostatstate
		
		tvroom - room
		coridor1 - room
		coridor2 - room	
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
	
	(connected coridor2 thermostatroom)
	(connected thermostatroom coridor2)
	
	
		(= (currentTemperature) 10)
		
		(= (temperature state12) 12)
		(= (temperature state19) 19)
		(= (temperature state26) 26)
		(= (temperature state40) 40)
		
		(CurrentThermostatState state26)
		
		(= (powerUsed) 0)
	)
	(:goal (and
	    (feelcomfortable)
		)
	)
(:metric minimize (powerUsed))

)
