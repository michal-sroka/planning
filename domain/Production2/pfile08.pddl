(define (problem prob1)
	(:domain complex-production)

	(:objects
		
		chemical iron 			- raw-material
		plastic metal 			- refine-material
		as-m1 as-m2 as-m3		- assembly-machine
		inject-machine forging-machine  - process-machine
		cut-m	   	 		- cutting-machine
		plastic-cutter  metal-cutter	- tool
		pr-m1 pr-m2 			- part-machine
		oven0				- oven
		coater0				- coater
		item0				- item
	)

	(:init
		(=(labour)0) (=(hazard)0) (=(machine-cost)0) (available coater0) (warm oven0) 
		(=(instore plastic)0) (=(instore metal)0)
		(=(instore metal-part)0) 
		(=(instore plastic-part)0)  (ready-chemical item0)
		(=(instore shaped-plastic)0) 
		(=(instore shaped-metal)0)
		(=(instore product1)0)	
		(=(instore product2)0)	
		(=(instore uncoated-product2)0)	
		(=(instore clean-plastic)0)
		(=(instore clean-metal)0)
		(=(instore recycle-plastic)2)
		(=(instore recycle-metal)3)
		(recycle-material recycle-plastic chemical) 
		(=(quantity-need recycle-plastic)2)
		(=(quantity-need recycle-metal)3)
		(=(capacity-process plastic)6)
		(=(capacity-process metal)4)
		(recycle-material recycle-metal iron)
		(available cut-m) (current-tool plastic-cutter)
		(changing-from plastic-cutter metal-cutter) (changing-from metal-cutter plastic-cutter)
		(available inject-machine ) (refine-process inject-machine plastic) (transform-material chemical plastic)
		(available forging-machine) (refine-process forging-machine metal) (transform-material iron metal)
		(=(has-instore chemical)10) (=(has-instore iron)10)
		(item-cut-make metal shaped-metal) (item-cut-make plastic shaped-plastic)
		(cutting-tool-produce plastic-cutter shaped-plastic) (cutting-tool-produce metal-cutter shaped-metal)
		(available pr-m1) (available pr-m2)
		(made-from metal-part shaped-metal) (made-from plastic-part shaped-plastic)
		(available as-m1) (available as-m2) (available as-m3)
		(available coater0)
		(turn-to shaped-plastic clean-plastic)
		(turn-to shaped-metal clean-metal)
		(produce-to clean-plastic plastic-part)
		(produce-to clean-metal metal-part)
	)


	(:goal (and
			(>=(instore shaped-plastic)10)
			(>=(instore metal-part)10)
			(>=(instore plastic-part)10)
			

			
		)
	)
(:metric minimize (machine-cost))
(:metric minimize (labour))
(:metric minimize (hazard))

)
	