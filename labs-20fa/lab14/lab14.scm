(define (split-at lst n)
  ;YOUR-CODE-HERE
  (cond ((null? lst) nil)
        ((= n 0) (cons '() lst))
        ((null? (cdr lst)) (list lst))
        (else (cons (cons (car lst) (car (split-at (cdr lst) (- n 1))))
                    (cdr (split-at (cdr lst) (- n 1)))))
  )
)


(define (compose-all funcs)
  ;YOUR-CODE-HERE
  (lambda (x)
    (cond ((null? funcs) x)
          (else ((compose-all (cdr funcs)) ((car funcs) x)))
    )
  )
)

