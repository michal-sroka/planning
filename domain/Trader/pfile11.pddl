(define (problem pfile01)
(:domain batter-trader)
	(:objects
		market0 market1 market2 market3 market4 - market
		village0 - village
		donkey0 donkey1 - donkey
		basket0 - basket
		goods0 goods1 goods2 goods3 goods4 goods5 - goods
		person0 - person
	
	)
	(:init
		(=(available goods0 village0)8) 
		(=(available goods1 village0)0) 
		(=(available goods2 village0)0)
		(=(available goods3 village0)0)
		(=(available goods4 village0)0)
		(=(available goods5 village0)0)

		(=(cash)30) (=(expenditure)0) (=(labour)0) (=(resource)0) (=(liquidity)0)

		(is-at person0 village0) (is-at donkey0 village0) (is-at donkey1 market1) (is-at basket0 village0)
		
		(=(space-in donkey0)4) (=(space-in donkey1)4)
		(=(space-in basket0)2) 
		
		(=(quantity-in-carrier donkey0 goods0)0)
		(=(quantity-in-carrier donkey0 goods1)0)
		(=(quantity-in-carrier donkey0 goods2)0)
		(=(quantity-in-carrier donkey0 goods3)0)
		(=(quantity-in-carrier donkey0 goods4)0)
		(=(quantity-in-carrier donkey0 goods5)0)

		(=(quantity-in-carrier donkey1 goods0)0)
		(=(quantity-in-carrier donkey1 goods1)0)
		(=(quantity-in-carrier donkey1 goods2)0)
		(=(quantity-in-carrier donkey1 goods3)0)
		(=(quantity-in-carrier donkey1 goods4)0)
		(=(quantity-in-carrier donkey1 goods5)0)

		(=(quantity-in-carrier basket0 goods0)0)
		(=(quantity-in-carrier basket0 goods1)0)
		(=(quantity-in-carrier basket0 goods2)0)
		(=(quantity-in-carrier basket0 goods3)0)
		(=(quantity-in-carrier basket0 goods4)0)
		(=(quantity-in-carrier basket0 goods5)0)

		(=(sell-price goods0 market0)2) (=(on-sale goods0 market0)3) 
		(=(sell-price goods1 market0)1) (=(on-sale goods1 market0)4)
		(=(sell-price goods2 market0)3) (=(on-sale goods2 market0)0) 
		(=(sell-price goods3 market0)3) (=(on-sale goods3 market0)2)
		(=(sell-price goods5 market0)3) (=(on-sale goods5 market0)2)

		(buy goods2 market0) (=(buy-price goods2 market0)4)
		(trading goods0 goods1 market0)
		(trading goods2 goods3 market0)
		(trading goods0 goods5 market0)
		
		
		(=(sell-price goods1 market1)3) (=(on-sale goods1 market1)4)
		(=(sell-price goods0 market1)5) (=(on-sale goods0 market1)3)
		(=(sell-price goods2 market1)1) (=(on-sale goods2 market1)4) 
 		(=(sell-price goods4 market1)3) (=(on-sale goods4 market1)3) 
		
		(buy goods0 market1) (=(buy-price goods0 market1)5)
		(trading goods0 goods1 market1)
		(trading goods0 goods2 market1)
	
		(=(sell-price goods2 market2)4)	(=(on-sale goods2 market2)5)
		(=(sell-price goods1 market2)2) (=(on-sale goods1 market2)2)
		(=(sell-price goods0 market2)5) (=(on-sale goods0 market2)2) 
		(=(sell-price goods3 market2)3) (=(on-sale goods3 market2)2)
		(=(sell-price goods5 market2)2) (=(on-sale goods5 market2)4)
		(buy goods0 market2) (=(buy-price goods0 market2)3)
		(trading goods1 goods2 market2)
		(trading goods0 goods3 market2)
		(trading goods0 goods5 market2)
		
		(=(sell-price goods2 market3)2)	(=(on-sale goods2 market3)5)
		(=(sell-price goods1 market3)1) (=(on-sale goods1 market3)2)
		(=(sell-price goods0 market3)5) (=(on-sale goods0 market3)0)
		(=(sell-price goods3 market3)2) (=(on-sale goods3 market3)2)
		(=(sell-price goods4 market3)2) (=(on-sale goods4 market3)3)
		(trading goods1 goods4 market3)
		(trading goods0 goods3 market3)
		(trading goods0 goods1 market3)

		(=(sell-price goods2 market4)2)	(=(on-sale goods2 market4)5)
		(=(sell-price goods1 market4)1) (=(on-sale goods1 market4)2)
		(=(sell-price goods0 market4)3) (=(on-sale goods0 market4)0)
		(=(sell-price goods3 market4)2) (=(on-sale goods3 market4)2)
		(=(sell-price goods4 market4)2) (=(on-sale goods4 market4)3)
		(trading goods0 goods2 market4)
		(trading goods0 goods3 market4)
		(trading goods0 goods4 market4)
		
)
	(:goal (and
		(>=(available goods1 village0)4) 
		(>=(available goods2 village0)2)
		(>=(available goods3 village0)4)
		
		
		)
	)

;;(:metric minimize (+ (*20 (liquidity)) (+( *2(resource))(*2(expenditure)))))
(:metric minimize (liquidity))
(:metric minimize (resource))
(:metric minimize (expenditure))


)
