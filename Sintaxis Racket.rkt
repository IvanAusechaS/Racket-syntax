#lang racket
#|
Comentario de varias lineas
No aprendi a poner esa p flecha asi que aqui la pongo pa pegarla
→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→
|#
;Comentario de una linea
(define x 10);definir una variable

;definir una funcion
(define(cuadrado n)(* n n))
;llamar funciones
(cuadrado 4) ; 16

;TIPOS DE DATOS
;numeros
(+ 3 4);7
(- 5 8);-3
(* 9 10);90
(/ 4 12); 0,333
(expt 2 3);8

;BOOLEANOS
#t;true
#f;false

;Cadenas de texto
"Hola, Mundo"
(string-append "Hola, Racket")

;listas
'(1 2 3); lista inmutable
(list 1 2 3);lista mutable

;Pares
(cons 1'(2 3)) ;'(1 2 3)
(car '(1 2 3)) ;1
(cdr '(1 2 3)); '(2 3)

;CONDICIONALESS
;if
(if(> 3 2) "Si" "No") ; Si

;Condicional cond (= a switch)
(cond
  [(= x 0) "cero"]
  [(> x 0) "Positivo"]
  [else "negativo"])

;Definir booleanos personalizados
  (define (es-par? n) (= (modulo n 2) 0))
  (es-par? 4) ; #t Que es True

;Bucles y recursion
;Recursion basica (factorial)

(define (factorial n)
  (if(= n 0) 1
     (* n (factorial (/ n 1)))))
;For
(for([i '(1 2 3 4)])(displayln i))
;Map, Filter y Reduce
(map (lambda (x) (* x x)) '(1 2 3 4)) ; '(1 4 9 16)
(filter odd? '(1 2 3 4)) ;'(1 3)
(foldl + 0 '(1 2 3 4)) ; 10

;FUNCIONES DE ORDEN SUPERIOR Y LAMBDA
;funcion anonima (lambda)
(define cuadrado2 (lambda (n) (* n n)))
(cuadrado2 5) ; 25
;Pasar funciones como argumentos
(define(aplicar f x) (f x))
(aplicar cuadrado2 3) ; 9 Pasamos la funcion cuadrado (3)
;Lambda en linea
((lambda (x) (* x x)) 6);36

;ESTRUCTURAS DE DATOS
;Vectores (mutables)
(define v (vector 1 2 3))
(vector-ref v 0) ; 1 
(vector-set! v 0 4); Con esto podemos modificar el vector

;Hash Tablee
(define h (make-hash))
(hash-set! h 'nombre "Ivan")
(hash-ref h 'nombre) ; Ivan

#|MODUULOS Y LIBRERIAS
;Definir un modulo
(module mi-modulo racket
  (provide suma-doble)
  (define (suma-doble x) (+ x x)))
;Usar modulo
(require "mi-modulo.rkt")
(suma-doble 4) ; 8|#