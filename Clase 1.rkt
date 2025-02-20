#lang racket
#|(define (x)
  (display "Escribe un número: ")
  (read))
 Claves dentro del curso, condicionales, let let* y las listas
(define entrada-numero (x))
(displayln (string-append "El número que escribiste es: " (number->string entrada-numero)))

(cond
  [(= entrada-numero 0) "0"]
  [(> entrada-numero 0) "positivo"]
  [else "Negativo"])
(define nombre "Ivan Ausecha")|#
;Funcion normal
(define(funcionSuma a b) (+ a b))
(funcionSuma 9 6)
;Definiremos las funciones con Lambda donde es una funcion anonima, donde la FuncionSumaL es una variable, no una funcion
;(define funcionSumaL (lambda (a b (+ a b))))
;el (lambda (a b (+ a b))) es solo un procedimiento, solo podemos acceder a el llamando a FuncionSumaL
;(lambda (x y) (if(and (> x 0) (> y 0))(* x y)(+ x y)) 9 12)
;odd? impar even? par

(define (mayorCinco? n) (> n 5))
(mayorCinco? 6)
(mayorCinco? 4)
(mayorCinco? 5.1)

(define (mayorCero? n)
  (if (<= n 0)
      "error"
      "ok"))
(mayorCero? -1)
(mayorCero? 1)

;Funcion let para variables que no van a mutar en el tiempo
(let
    (;creacion de variables
     (x 5)
     (f (lambda(y) (* y 2)))
     );Cuerpo del let
  (let*; Si ponemos un asterisco las variables se crean al vuelo
      (
       (x 6)
       (m x)
       );cuerpo del let
    (f (+ m x))
  )
  )
(define factorial
  (lambda (n)
    (if ( = n 0) 1
        (* n (factorial (- n 1))))
    )
  )