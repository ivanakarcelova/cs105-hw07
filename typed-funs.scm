;; Part B, drop and takewhile 
;; drop function
;; given a natural number n and a list of values xs, returns xs 
;; without the first n elements (or the empty list if n is greater than the length of xs).
(define drop [n : int] [xs : (List 'a)] : (List 'a)
  (if (<= n 0)
      xs
      (if (null? xs)
          null
          (drop (- n 1) (cdr xs)))))

;; translated from ....  (hw4?)
(define drop (predicate? list)
  (if (null? list) 
      '()
      (if (= (predicate? (car list)) #t)
          (drop predicate? (cdr list)) 
          list))) 


;; takewhile function (this is from hw4?)
;; Function takewhile, which, given a predicate p? and a list xs, returns the largest prefix of xs in which every element satisfies p?.
(define takewhile (predicate? list)
  (if (null? list)
      '() 
      (if (= (predicate? (car list)) #t) 
          (cons (car list) (takewhile predicate? (cdr list))) 
          '())))

;; translated to 
(define takewhile [p? : ('a -> bool)] [xs : (List 'a)] : (List 'a)
  (if (null? xs)
      null
      (if (p? (car xs))
          (cons (car xs) (takewhile p? (cdr xs)))
          null)))