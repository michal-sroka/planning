(define (problem blocksworld-prob1)
  (:domain blocksworld)
  (:objects a b - block)
  (:init (on-table a) (on-table b) (clear a) (clear b))
  (:goal (and (on b a))))
  
  
