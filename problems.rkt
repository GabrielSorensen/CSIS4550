#lang racket

(define colors '("black" "brown" "blue" "red" "yellow" "orange" "purple" "green" "gray" "pink"))
(define articles '("a" "an" "the" "some"))
(define frenchEng (list (list "one" "un") (list "two" "deux") (list "three" "trois") (list "four" "quatre") (list "five" "cinq") (list "six" "six") (list "seven" "sept") (list "eight" "huit") (list "nine" "neuf") (list "zero" "zero")))



(define (hypot base height)
    (sqrt(+(* base base)(* height height)))
);so many parenthesis............

;(hypot 3 4)

(define (sphereVol radius)
  (*(*(/ 4 3)pi)(*(* radius radius)radius))
);please, why?

;(sphereVol 3)

(define (stateOfWater temp)
  ( cond 
   [ (< temp 32) ( display "water is currently Frozen\n") ]
   [(and ( >= temp 32) ( < temp 113) ) ( display "water is currently Liquid\n")]
   [( >= temp 113 ) ( display "water is currently a Gas\n")]
   )
)

;"testing"
;(stateOfWater 10)
;(stateOfWater 50)
;(stateOfWater 500)

(define (dotProduct listA listB)
  (
     apply +(map * listA listB)
   )
)

;(dotProduct '(1 5 7) '(2 7 10))


(define (doubleSeq listA)
  (
   map (lambda (x) (* x 2)) listA
  )
)

;(doubleSeq '(1 5 7))

(define (duplicateSeq listA)
  (
   append listA listA
  )
)

;(duplicateSeq '(1 5 7))

(define (removeDups listA)
  (
   remove-duplicates listA
  )
)

;(removeDups '(1 2 2 3 3 3 4 4 4 4 5 5 5 5 5))

(define (translate listA)
  (
     for(
           [i frenchEng]
           #:break (void? i)
        )
        (cond
        [(member (car i) listA) (display (cdr i))])
        (display "\n")
  )
)

(define (translate2 listA)
  (
     for(
           [i listA]
           #:break (void? i)
        )
        (display (cdr(assoc i frenchEng)))
        (display "\n")
  )
)

;(translate2 '("one" "six" "three" "nine" "eight"))

(define (sumProduct listA procedure)
  (
   map procedure listA
  )
)

(define (sumProduct2 listA proc)
  (
   apply proc listA
  )
)

;(sumProduct2 '(1 5 7) +)
;(sumProduct2 '(1 5 7) *)
;(sumProduct '(1 5 7) (lambda (x) (+ x 5)))
;(sumProduct '(1 5 7) (lambda (x) (- x 5)))
;(sumProduct '(1 5 7) (lambda (x) (* x 5)))
;(sumProduct '(1 5 7) (lambda (x) (/ x 5)))

(define (countArticles listA)
  (
   length (append(append(filter (lambda (x) (string=? "the" x)) listA) (filter (lambda (x) (string=? "a" x)) listA))(filter (lambda (x) (string=? "an" x)) listA))
  )
)

(define (countArticlesPretty listA)
  (
   length (filter (lambda (x) (member x articles)) listA)
  )
)

;(countArticles '("the" "dog" "jumped" "over" "the" "moon" "an" "a"))
;(countArticlesPretty '("the" "dog" "jumped" "over" "the" "moon" "an" "a"))

(define (listColors listA)
  (
   filter (lambda (x) (member x colors)) listA
  )
)

;(listColors '("this" "is" "red"))

(define (listPositives listA)
  (
   filter positive? listA
  )
)

;(listPositives '(-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6))

(define (getMax listA)
  (
   apply max listA
  )
)

;(getMax '(-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6))


(define (nestLevel listA item)
  (
   if (not (pair? listA)) ;if what we give is not a list then return 0
       0                  ; AKA: base case
       (max (add1 (nestLevel (car listA))) ;otherwise call recursively with the first elememt in the list that has the greatest number of elements
            (nestLevel (cdr listA))) ;;max compares from list.car to list.cdr (first elemet to last)
   ) ;max finds the deepest nest level, rather than the first of elemet of the list of the list of the list...
)

;(nestLevel frenchEng 0)

(define (Nsquares n)
  (
   for/list ((i (in-list (range 1 (add1 n)))))
    display (sqr i)
  )
)

;(Nsquares 10)

(define person%
  (class object%
    (super-new)
    (init-field [name ""] [age 0])
    (define/public
     (getName)
      (send this name))
    (define/public
     (getAge)
      (send this age))
  )
)

(define people  (list (make-object person% "gabe" 21)))
(append  (list (make-object person% "shawn" 22)) people)
(append (list (make-object person% "braden" 20)) people)
  
(define (youngest listPeople)
  (
   display listPeople
   display (car listpeople)
   ;display (get-field name (cdr listPeople))
  )
)

(youngest people)
  


































;http://stackoverflow.com/questions/23484728/how-to-find-the-maximum-nesting-depth-of-a-s-expression-in-scheme