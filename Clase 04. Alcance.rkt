#lang racket
(define juntarListas
  (lambda (l1 l2)
    (if (null? l1) l2
        (cons (car l1)
                   (juntarListas (cdr l1)l2)))
    ))
(define listaSimbolos
  (lambda (arb)
    (if (number? arb) empty
        (juntarListas
         (juntarListas
               (list (car arb))
               (listaSimbolos(cadr arb)))
               (listaSimbolos(caddr arb)))
        )))
;Prueba para un arbol
#|
(listaSimbolos
   '(k(h 5 3) (t(s 10 11) 12)) )
'((k (h)) (t (s)))
|#
;En el taller no se puede usar el append, ni el map
#|
Alcance y ligadura de una variable
Una vez cree una variable no puede cambiar de valor
Una variable puede ser decalrada o referenciada
Declaracion
(lambda (x) .....)
(let ((x ....))...)
Referencia
(f x y) Vaya busque a x
Una variable esta ligada al luegar donde se declara

El alcance de la variable
((lambda (x) x) y) Fue creada la x antes de utilizarla, mientras que la y ocurre libre ya que no esta en algun parametro
Esto nos da error ya que la y no esta definida
(lambda (y) y) Ocurre ligada
(lambda (x) y) x esta declarada, y es libre
(lambda (y)
  (lambda (x) y)
)
|#
(define sumar
  (lambda (x)
    (lambda (y)
      (+ x y))))
#|
Para revisar si una variable ocurre libre usamos
<lambda-exp> ::= <identificador>
             ::= (lambda (<identificador>) <lambda-exp>)
             ::= (<lambda-exp> <lambda-exp>)
|#
(define occurs-free?
 (lambda (var exp)
   (cond
     ((symbol? exp) (eqv? var exp))
     ((eqv? (car exp) 'lambda)
      (and (not (eqv? (caadr exp) var))
           (occurs-free? var (caddr exp))))
 (else (or (occurs-free? var (car exp))
           (occurs-free? var (cadr exp)))))))
#|
Pruebas
(occurs-free? 'y '(lambda (y) x))
#f
> (occurs-free? 'x '(lambda (y) x))
#t
> (occurs-free? 'x '(lambda (y)
                      (lambda (x)
                        (lambda (y) f))))
#f
> (occurs-free? 'y '(lambda (y)
                      (lambda (x)
                        (lambda (y) f))))
#f
> (occurs-free? 'f '(lambda (y)
                      (lambda (x)
                        (lambda (y) f))))
#t
> (occurs-free? 'f '(f x))
#t
> (occurs-free? 'x '(f x))
#t
> (occurs-free? 'f '(lambda (y)
                      (lambda (x)
                        (lambda (y) (f x)))))
#t
> (occurs-free? 'f '(lambda (y)
                      (lambda (x)
                        (lambda (f) (f x)))))
#f
> 
|#