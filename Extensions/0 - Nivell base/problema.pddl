(define (problem menu-automatic)
  (:domain menu-setmanal)

  (:objects
    ;; Plats
    amanida sopa fideua llenties cigrons - primer 
    llobarro salmo pollastre fabada entrecot - segon

    ;; Dies
    dilluns dimarts dimecres dijous divendres - dia
  )

  (:init
    ;; Incompatibilitats
    (incompatible llenties fabada)
  )

  (:goal (and
    (primer-assignat dilluns) (segon-assignat dilluns)
    (primer-assignat dimarts) (segon-assignat dimarts)
    (primer-assignat dimecres) (segon-assignat dimecres)
    (primer-assignat dijous) (segon-assignat dijous)
    (primer-assignat divendres) (segon-assignat divendres)
    
    ;; Imprimim els menus per millor llegibilitat
    (impres dilluns)
    (impres dimarts)
    (impres dimecres)
    (impres dijous)
    (impres divendres)
  ))
)