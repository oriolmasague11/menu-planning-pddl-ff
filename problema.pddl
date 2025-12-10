(define (problem menu-bàsic)
  (:domain menu-setmanal)

  (:objects
    amanida sopa fideua llenties llobarro salmon pollastre fabada - plat
    tipus-ensalada tipus-sopa tipus-arros tipus-llegum tipus-peix tipus-carn - tipus
    dilluns dimarts dimecres dijous divendres - dia
  )

  (:init
    ;; Definición de primeros
    (es-primer amanida) (es-primer sopa) (es-primer fideua) (es-primer llenties)
    ;; Definición de segundos
    (es-segon llobarro) (es-segon salmon) (es-segon pollastre) (es-segon fabada)

    ;; Tipos de platos
    (te-tipus amanida tipus-ensalada)
    (te-tipus sopa tipus-sopa)
    (te-tipus fideua tipus-arros)
    (te-tipus llenties tipus-llegum)
    (te-tipus llobarro tipus-peix)
    (te-tipus salmon tipus-peix)
    (te-tipus pollastre tipus-carn)
    (te-tipus fabada tipus-llegum)

    ;; Incompatibilidad ejemplo
    (incompatible fideua fabada)
  )

  (:goal (and
    (assignat dilluns primer sopa)
    (assignat dilluns segon llobarro)
    (assignat dimarts primer amanida)
    (assignat dimarts segon salmon)
    (assignat dimecres primer fideua)
    (assignat dimecres segon pollastre)
    (assignat dijous primer llenties)
    (assignat dijous segon fabada)
    (assignat divendres primer sopa)
    (assignat divendres segon salmon)
  ))
)
