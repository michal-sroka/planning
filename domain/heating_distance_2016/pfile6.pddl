(define (problem thermostat1)
	(:domain thermostat)
	
	(:objects
		state19 - thermostatstate
		state26 - thermostatstate
		tvroom - room
		coridor1 - room
		coridor2 - room
		coridor3 - room
		coridor4 - room
		coridor5 - room		
		coridor6 - room
		coridor7 - room
		coridor8 - room
		coridor9 - room
		coridor10 - room		
		coridor11 - room
		coridor12 - room
		coridor13 - room
		coridor14 - room
		coridor15 - room		
		coridor16 - room
		coridor17 - room
		coridor18 - room
		coridor19 - room
		coridor20 - room		
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
	
	(connected coridor4 coridor3)
	(connected coridor3 coridor4)

	(connected coridor4 coridor5)
	(connected coridor5 coridor4)
	
	(connected coridor5 coridor6)
	(connected coridor6 coridor5)

	(connected coridor6 coridor7)
	(connected coridor7 coridor6)

	(connected coridor7 coridor8)
	(connected coridor8 coridor7)

	(connected coridor8 coridor9)
	(connected coridor9 coridor8)

	(connected coridor9 coridor10)
	(connected coridor10 coridor9)

	(connected coridor10 coridor11)
	(connected coridor11 coridor10)

	(connected coridor11 coridor12)
	(connected coridor12 coridor11)

	(connected coridor12 coridor13)
	(connected coridor13 coridor12)

	(connected coridor13 coridor14)
	(connected coridor14 coridor13)

	(connected coridor14 coridor15)
	(connected coridor15 coridor14)

	(connected coridor15 coridor16)
	(connected coridor16 coridor15)

	(connected coridor16 coridor17)
	(connected coridor17 coridor16)

	(connected coridor17 coridor18)
	(connected coridor18 coridor17)

	(connected coridor18 coridor19)
	(connected coridor19 coridor18)

	(connected coridor19 coridor20)
	(connected coridor20 coridor19)

	(connected coridor20 thermostatroom)
	(connected thermostatroom coridor20)
	
	
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
