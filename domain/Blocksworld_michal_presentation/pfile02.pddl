(define (problem blocksworld-prob1)
  (:domain blocksworld)
  (:objects a b c - block)
  (:init (on-table a) (on-table b) (clear a) (clear b) (clear c) (on-table c))
  (:goal (and (on b a) (on c b))))
  
  
