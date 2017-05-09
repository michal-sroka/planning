(define (domain better-trader)
	(:requirements :typing :fluents) 
;;	(:types 
;;	location locatable goods - object
;;		village market - location
;;		carrier person - locatable
;;		donkey basket - carrier
;;	)
	(:types 
	location  carrier goods - object
		village market - location
		person donkey basket - carrier
	)

	(:predicates 
	     	(is-at ?p - carrier ?l - location)
	     	;; (is-at ?p - locatable ?l - location)
		(connected-by-trail ?l1 - location ?l2 - location)
		(connected-by-stream ?l1 ?l2 - location)
		(connected-by-rope-bridge ?l1 ?l2 - location)
		(connected-by-wooden-bridge ?l1 ?l2 - location)
		(hungry-donkey ?d - donkey ?l - location)
		(full-donkey ?d - donkey ?l - location)
		(trading ?g1 ?g2 - goods ?m - market)
		(buy ?g - goods ?m - market)
		
		
	)

	(:functions 
		(on-sale ?g - goods ?m - market)
	    	(sell-price ?g - goods ?m - market)
	    	(buy-price ?g - goods ?m - market)
	    	(available ?g - goods ?l - location)
;;		(quantity-in-carrier ?c - locatable ?g - goods)
;;		(space-in ?c - locatable)
		(quantity-in-carrier ?c - carrier ?g - goods)
		(space-in ?c - carrier)
	    	(cash)
		(liquidity)
		(expenditure)
		(resource)
		(labour)
		(transport-cost)
	)

	(:action load-donkey
 		:parameters (?d - donkey ?l - location ?g - goods)
		:precondition (and 
				(is-at ?d ?l)
				(>(space-in ?d)0)
				(>(available ?g ?l)0)
		     	      )
 		:effect      (and 
				(decrease (space-in ?d)1)	
				(decrease(available ?g ?l)1)
				(increase (quantity-in-carrier ?d ?g)1) 	
				(increase (resource)1)
			     )
	)
	
	(:action load-basket
 		:parameters (?b - basket ?p - person ?l - location ?g - goods)
		:precondition (and 
				(is-at ?b ?l)
				(>(space-in ?b)0)
				(>(available ?g ?l)0)
		     	      )
 		:effect      (and 
				(decrease(space-in ?b)1)	
				(decrease(available ?g ?l)1)
				(increase (quantity-in-carrier ?b ?g)1)	
				(increase (labour)1)
			     )
	)

	(:action moving
		:parameters (?p - person ?c - carrier ?l1 ?l2 - location)
		:precondition (and
				(is-at ?p ?l1)
				(is-at ?c ?l1)
			     )
		:effect     (and
				(not(is-at ?p ?l1))
				(not(is-at ?c ?l1))
				(is-at ?p ?l2)
				(is-at ?c ?l2)
			    )
	)

	(:action unload
		:parameters (?c - carrier ?l - location ?g - goods ?p - person)
		:precondition (and
				 (is-at ?c ?l) (is-at ?p ?l)
				 (>(quantity-in-carrier ?c ?g)0)
			      )
		:effect	    (and
				(decrease (quantity-in-carrier ?c ?g)1)
				(increase (space-in ?c)1)
				(increase (available ?g ?l)1)
			    )
	)
	 
	(:action buy-cash
		:parameters (?p - person ?g - goods ?m - market)
 		:precondition (and 
			   	(is-at ?p ?m) 
			   	(> (on-sale ?g ?m) 0)
				(>=(cash)(sell-price ?g ?m))
		      	      )
 	:effect       	    (and 
			   	(decrease (on-sale ?g ?m) 1)
	      		  	(increase (available ?g ?m)1)
			   	(decrease (cash)(sell-price ?g ?m))
				(increase (expenditure)(sell-price ?g ?m))
			    )
	)

	(:action exchange-goods
		:parameters (?p - person ?g1 ?g2 - goods ?m - market)
 		:precondition (and 
			   	(is-at ?p ?m) 
				(trading ?g1 ?g2 ?m)
				(>(available  ?g1 ?m )0)
			   	(> (on-sale ?g2 ?m) 0)
		      	      )
 	:effect       	    (and 
			   	(decrease (on-sale ?g2 ?m) 1)
	      		  	(decrease (available ?g1 ?m)1)
				(increase (available ?g2 ?m)1)
				(increase(liquidity)1)
			    )
	)

	(:action sell-goods-get-cash
 		:parameters (?p - person ?g - goods ?m - market)
 		:precondition (and 
			    		(is-at ?p ?m) 
			    		(buy ?g ?m)
			    		(>(available ?g ?m)0)
		     	      )
 		:effect      (and
			   		(increase (on-sale ?g ?m)1)
			   		(decrease (available ?g ?m)1)
			   		(increase (cash)(buy-price ?g ?m))
					
			     )
	)

)