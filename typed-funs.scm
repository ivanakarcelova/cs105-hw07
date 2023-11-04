;; drop (n xs)
;; returns xs without the first n elements, or empty list
;; if n is greater than length of xs.
;; laws: 
(val drop (type-lambda ['a] 
          (letrec [([drop-mono : (int (list 'a) -> (list 'a))]
          (lambda ((n : int)(xs : (list 'a))) 
                (if ([@ = int] n 0) 
                  xs 
                  (if ([@ null? 'a] xs)
                      xs 
                      (drop-mono (- n 1) ([@ cdr 'a] xs))))))] 
                      drop-mono)))

;; unit tests:
          (check-type drop (forall ['a] (int (list 'a) -> (list 'a))))
          (check-expect ([@ drop int] 3 '(2 4 6 7 8 10 12)) '(7 8 10 12))

;; takewhile (p? xs)
;; returns the largest prefix of xs in which every element satisfies p?.
;; laws:
(val takewhile 
    (type-lambda ['a] 
          (letrec [([take-mono : (('a -> bool) (list 'a) -> (list 'a))]
          (lambda ([p? : ('a -> bool)] [xs : (list 'a)]) 
              (if ([@ null? 'a] xs)
                  xs
                  (if (p? ([@ car 'a] xs)) 
                      ([@ cons 'a] ([@ car 'a] xs) (take-mono p? ([@ cdr 'a] xs)))
                      [@ '() 'a]))))] take-mono )))
;; unit tests:
          (check-type takewhile (forall ['a] (('a -> bool) (list 'a) -> (list 'a))))

          (define bool even? ([x : int]) (if ([@ = int] (mod x 2) 0) #t #f))
          (check-expect ([@ takewhile int] even? '(2 4 6 7 8 10 12)) '(2 4 6))
