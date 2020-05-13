(define es_conmutativa? 
  (lambda (x a b)
    (if(equal? (x (x a b)) (x(x b a))) #t #f)
  )
)

(define son_conmutativas?
  (lambda (lista a b)
    (if(equal? (null? lista) #t)
      (list)
      (cons 
        (es_conmutativa? (car lista) a b) 
        (son_conmutativas? (cdr lista) a b)
      )
    )
  )
)

(define (make-list n v)
  (if (= n 0)
    (list)
    (cons v (make-list (-n 1)v))
  )
)

(define contar_conmutativas
  (lambda (lista a b)
    (if(equal? (null? lista) #t)
       0
      (+
        (if(equal? (es_conmutativa? (car lista) a b) #t)(+ 1)(+ 0)) 
        (contar_conmutativas (cdr lista) a b)
      )
    )
  )
)