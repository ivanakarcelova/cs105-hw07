;; step 5 
(check-type 3 int)
(check-type #t bool)
(check-type 'hello sym)

;; step 6
(check-type (if #t 2 3) int)
(check-type (if #t #f #t) bool)
(check-type (if #t #f #t) bool)

(check-type-error (if #f #t 3))
(check-type-error (if 2 2 3))

;; step 7

(check-type + (int int -> int))
(check-type null? (forall ['a] ((list 'a) -> bool)))
(check-type-error y)

;; step 9

(check-type (val x 2) int)
(check-type (val z #t) bool)

(check-type-error (val y (if 2 3 3)))


(check-type 2 int)
(check-type-error (if #f #t 3))

;; step 10 apply
(check-type (+ 1 2) int)    
(check-type-error (+ 1 #f))    

;; step 11
(check-type (let ([x 3]) (+ x 2)) int)
(check-type-error (let ([y 4] [x #f]) (+ x y)))

;; step 12
(check-type (lambda ([x : int]) (+ x 3)) (int -> int))
(check-type-error (lambda ([x : int]) (if? x y)))

;; step 13
(val x 3)
(check-type (set x 3) int)
(check-type-error (set x #f))

(check-type (while #t 2) unit)
(check-type-error (while 2 2))
(check-type-error (while #t (if 2 3 #f)))

(check-type (begin #f 1) int)
(check-type-error (begin #f (if 1 2 2)))

;; step 14
;; LETSTAR
(check-type (let* ([x 2] [y (+ x 3)]) (+ x 2)) int)
(check-type (let* () 2) int)
(check-type-error (let* ([y 4] [x #f]) (+ x y)))

;; step 15 
;; LETREC 


;; step 16
;; VALREC and DEFINE
;; VALREC
(val value 1)
(val-rec [valrec1 : (int -> int)] (lambda ([value : int]) (+ value 1)))

(check-type valrec1 (int -> int))

;; DEFINE
(define int addTwo ([x : int]) (+ x 2))
(check-type addTwo (int -> int)) ;; FIXME:

;; step 17 
;; TYAPPLY and TYLAMBDA
;; check TYAPPLY 
;; (check-type [@ + int] ((list int) -> int))
 





