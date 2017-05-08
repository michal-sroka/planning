(define (domain backendrestarts)
;; (:requirements :fluents :equality :typing) 
(:types backend server - object )
(:predicates 
		(in ?backend - backend ?server - server)
		(enabled ?server - server)
		(not-running ?backend - backend)  ;; when all servers are off.
		(maintained ?server - server) ;; whether a server was maintained.
		(maintanance-mode) ;; is maintanance mode on. or not.
)

  (:functions 	
	(active ?back - backend) ;; number of active servers in a backend.
	(active-backends ?serv - server) ;; number of active backends the server is added.
	(inactive-backends ?serv - server) ;; number of inactive backends the server is added. -- it actually means that he server was inactivated in a given backend. it should be all or nothing.
	(maintanance-count)
  )


(:action DISABLE-SERVER
  :parameters
   (?server - server
    ?backend - backend)

  :precondition
   (and (in ?backend ?server) (enabled ?server) ( > (active ?backend) 2) (not (maintanance-mode)) )
  :effect
   (and (not (enabled ?server))
		(decrease (active ?backend) 1)
		(increase (inactive-backends ?server) 1)
		(decrease (active-backends ?server) 1) 
(increase (maintanance-count) 1)
)
)

(:action ENABLE-SERVER
  :parameters
   (?server - server
    ?backend - backend)
  :precondition
   (and (in ?backend ?server) (NOT (enabled ?server)) (not (maintanance-mode)))
  :effect
   (and (enabled ?server)
		(increase (active ?backend) 1)
		(decrease (inactive-backends ?server) 1)
		(increase (active-backends ?server) 1)
(increase (maintanance-count) 1)
)
)

(:action START-MAINTANANCE
	:parameters ()
	:precondition (and (not (maintanance-mode)) )
	:effect (and (maintanance-mode) (increase (maintanance-count) 5))
)

(:action END-MAINTANANCE
	:parameters ()
	:precondition (and (maintanance-mode))
	:effect (and (not (maintanance-mode)) (increase (maintanance-count) 1))
)

(:action MAINTAIN-SERVER
	:parameters (?server - server)
	:precondition (and (maintanance-mode) (NOT (maintained ?server)) (not (enabled ?server)) (= (active-backends ?server) 0))
	:effect (and (maintained ?server) (increase (maintanance-count) 1))
)
)
