(define (domain complex-production)
(:requirements :typing :fluents :equality :adl)

	(:types  
	    material machine - object
	    raw-material refine-material cut-material clean-material part recycle product co-product item - material
	    assembly-machine process-machine cutting-machine tool part-machine oven coater - machine
	)


		(:constants product1 product2 uncoated-product2    - product 
		    metal-part plastic-part coated-plastic - part
	 	    shaped-plastic shaped-metal   - cut-material
		    recycle-plastic recycle-metal - recycle
		    substitute			  - co-product
		    clean-metal clean-plastic	  - clean-material
	)

	(:predicates
		(refine-process ?m - machine ?r - refine-material)
		(transform-material ?r - raw-material ?rf - refine-material)
		(busy ?m - machine)
		(recycle-material ?rc - recycle ?rw - raw-material)
		(cut-item ?m - material)
		(available ?m - machine)
		(current-tool ?t - tool)
		(item-cut-make ?rf - refine-material ?ct - cut-material)
		(cutting-tool-produce ?t - tool ?ct - cut-material)
		(made-from ?p - part ?ct - cut-material)
		(combine-item ?cp - co-product ?ct - cut-material ?p - part)
		(changing-from ?t1 - tool ?t2 - tool)
  		(turn-to ?ct - cut-material ?cl - clean-material)
		(ready-chemical ?c - item) (prepare-chemical ?c - item)
		(produce-to ?cl - clean-material ?p - part)
		(warm ?o - oven) 
		(cool ?o - oven)
	)
	


	
	
	(:functions
		(instore ?m - material)
		(capacity-process ?f - refine-material)
		(has-instore ?m - material)
		(machine-cost)
		(quantity-need ?cy - recycle)
		(require-part ?ct - co-product ?p - part)
		(changing-tool-cost)
		(clean-part)
		(product-cost)
		(labour)
		(hazard) 
		(energy)
	)

	(:action setting-machine
		:parameters (?m - machine )
		:precondition (and 	
				    (busy ?m)
			      )
		:effect       (and 	
				   (available ?m)
				   (not (busy ?m))
				)			 
	)

	;; process raw-material

	(:action process-raw-material
		:parameters (?m - process-machine ?r - raw-material  ?f - refine-material)
		:precondition (and  (available ?m)
				    (refine-process ?m ?f )
				    (transform-material ?r ?f)
				    (>=(has-instore ?r)1)
				)
		:effect	      (and  (not (available ?m))
				    (busy ?m)
				    (increase (instore ?f) (capacity-process ?f))
				    (decrease (has-instore ?r) 1)
				    (increase (hazard) 1)
			      )
	)

	;; process-recycle material

 	(:action part-from-recycle
		:parameters (?m - process-machine ?cy - recycle ?r - raw-material ?f - refine-material)
		:precondition (and  (available ?m)
				    (recycle-material ?cy ?r)
				    (refine-process ?m ?f )
				    (transform-material ?r ?f)
				    (>=(instore ?cy)(quantity-need ?cy))
				)
		:effect	      (and  (not (available ?m))
				    (busy ?m)
				    (increase (instore ?f)1)
				    (decrease (instore ?cy)(quantity-need ?cy))
			      )
	)

	;; cutting process
				
	(:action cutting-process
		:parameters (?m - cutting-machine ?r - refine-material ?t - tool ?p - cut-material)
		:precondition (and (available ?m)
				   (current-tool ?t)
				   (item-cut-make ?r ?p)
				   (cutting-tool-produce ?t ?p)
				   (>= (instore ?r) 1)
			     )
		:effect     (and   (not (available ?m))
				   (busy ?m)
			           (increase (instore ?p)2)
			           (decrease (instore ?r)1)
			     )
	)

	(:action changing-tool
		:parameters ( ?prev-tool - tool  ?next-tool - tool)
		:precondition (and 
				   (current-tool ?prev-tool)
				   (changing-from ?prev-tool ?next-tool)
			      )
		:effect (and 	
			     	(current-tool  ?next-tool)
			    	(not (current-tool ?prev-tool))
			)
	)
	
	;; making metal-parts

	(:action process-shaped-metal
		:parameters (?m - part-machine ?cl - clean-material)
		:precondition  (and (available ?m)
				    (turn-to shaped-metal ?cl)
				    (>=(instore shaped-metal)1)
				)
		:effect       ( and (increase (instore ?cl)2)
				    (decrease (instore shaped-metal)1)
				    (busy ?m)
				    (not(available ?m))
				    (increase(instore recycle-metal)1)
			)
	)

	(:action soak-chemical
		:parameters (?cl - clean-material ?c - item)
		:precondition (and 
				   (ready-chemical ?c)
				   (produce-to ?cl metal-part)
				   (>=(instore ?cl)1) 
			      )
		:effect  (and 
				  (increase (instore metal-part)2)
			          (decrease (instore ?cl)1)
				  (not (ready-chemical ?c))
				  (prepare-chemical ?c)
				  (increase (hazard)1)
			 )
	)

	(:action mix-chemical
		:parameters (?c - item)
		:precondition (and
				(prepare-chemical ?c)
			      )
		:effect     (and
				(ready-chemical ?c)
			    )
        )	

	(:action painting-metal-part
		:parameters (?c - coater ?cl - clean-material)
		:precondition (and
				(available ?c)
				(produce-to ?cl metal-part)
				(>=(instore ?cl)1)
			      )
		:effect
			 (and
				(decrease(instore ?cl)1)
				(increase (instore metal-part)2)
				(busy ?c) (not (available ?c))
				(increase(labour)1)
			 )
	)		

	;; making plastic-part

	(:action process-shaped-plastic
		:parameters (?m - part-machine ?cl - clean-material)
		:precondition  (and 
				    (available ?m)
				    (turn-to shaped-plastic ?cl)
				    (>=(instore shaped-plastic)1)
				)
		:effect ( and 	
				(increase (instore ?cl)4)
				(decrease (instore shaped-plastic)1)
				(busy ?m) 
				(not (available ?m))
				(increase (instore recycle-plastic)1)
			)
	)

	(:action coating-plastic-part
		:parameters (?c - coater ?cl - clean-material)
		:precondition (and
				(available ?c)
				(produce-to ?cl plastic-part)
				(>=(instore ?cl)1)
			      )
		:effect
			 (and
				(decrease(instore ?cl)1)
				(increase (instore plastic-part)2)
				(increase (instore recycle-plastic)1)
				(busy ?c) (not (available ?c))
			 )
	)
			 
	;; assembly product

	
	(:action warming-oven
		:parameters (?o - oven )
		:precondition (and 
				 (cool ?o)
			      )
		:effect       (and
				(warm ?o)
			      )
	)				

	(:action assemble-product1-formula1
   		:parameters ( ?m - assembly-machine ?o - oven) 
   		:precondition (and (available ?m) 
				   (>= (instore plastic-part)2)
				   (>= (instore metal-part)2)
				   (warm ?o)
			       )
	
  		:effect       (and (increase (instore product1)2)
			     	   (decrease (instore plastic-part)2)
				   (decrease (instore metal-part)2)
				   (not(available ?m))
				   (busy ?m)
				   (not(warm ?o))
				   (cool ?o)
				   (increase (machine-cost)10)
			      )
	)
	

	(:action assemble-product1-formula2
		:parameters ()
		:precondition (and 
				   (>=(instore metal-part)1)
				   (>=(instore clean-plastic)1)
			      )
		:effect	    (and  (increase (instore product1)1)
				  (decrease (instore metal-part)1)
				  (decrease (instore clean-plastic)1)
				  (increase (labour)1)
			    )
	)	

	(:action assemble-product1-formula3
		:parameters (?it - item)
		:precondition (and 
				   (>=(instore recycle-metal)1)
				   (>=(instore clean-plastic)1)
				   (ready-chemical ?it)
			      )
		:effect	    (and  (increase (instore product1)1)
				  (decrease (instore metal-part)1)
				  (decrease (instore clean-plastic)1)
				  (increase (hazard)1)
			    )
	)	

	(:action assemble-product2-formula1
   		:parameters (?m - assembly-machine) 
   		:precondition (and (available ?m)
				   (>=(instore plastic-part)2)
				   (>=(instore clean-plastic)1)
				  
				)
   		:effect      (and (increase (instore product2)3)
				  (decrease (instore plastic-part)2)
				  (decrease (instore clean-plastic)1)
				  (not (available ?m))
				  (busy ?m)
				  (increase(machine-cost)10)
				
			     )
	)

	(:action assemble-product2-formula2
		:parameters ()
		:precondition (and 
				     (>=(instore plastic-part)4)
				     (>=(instore recycle-plastic)2)				
			      )
		:effect		(and (decrease (instore plastic-part)4)
				     (increase (instore uncoated-product2)2)
				     (decrease(instore recycle-plastic)2)
				     (increase (labour)1)
				)
	)

	(:action coating-product2
		:parameters (?c - coater)
		:precondition (and
				 (available ?c)
				 (>(instore uncoated-product2)2)
				)
		:effect	      (and
				  (decrease (instore uncoated-product2)2)
				  (increase (instore product2)2)
				  (busy ?c)
				  (not (available ?c))
			      )
	)
				
	
)
