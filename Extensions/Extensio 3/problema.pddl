(define (problem menu-automatic)
  (:domain menu-setmanal)

  (:objects
    ;; Plats
    amanida sopa fideua llenties cigrons - primer 
    llobarro salmo pollastre fabada entrecot - segon

    ;; Dies
    dilluns dimarts dimecres dijous divendres - dia

    ;; Tipus
    peix carn brou vegetal llegum arros - tipus
  )

  (:init
    ;; Incompatibilitats
    (incompatible llenties fabada)
    (incompatible sopa salmo)

    ;; Tipus
    (tipus-es amanida vegetal)    ;; canviar per llegum als jocs de prova
    (tipus-es sopa brou)          ;; canviar per arros als jocs de prova
    (tipus-es llenties llegum)  
    (tipus-es fideua arros)       
    (tipus-es llobarro peix)
    (tipus-es salmo peix)
    (tipus-es pollastre carn)
    (tipus-es fabada llegum)
    (tipus-es cigrons llegum)
    (tipus-es entrecot carn)

    ;; Precedencies entre dies
    (precedent none dilluns)
    (precedent dilluns dimarts)
    (precedent dimarts dimecres)
    (precedent dimecres dijous)
    (precedent dijous divendres)
  )

  (:goal (and
    (primer-assignat dilluns) (segon-assignat dilluns)
    (primer-assignat dimarts) (segon-assignat dimarts)
    (segon-es dimarts entrecot) ;; plat concret
    (primer-assignat dimecres) (segon-assignat dimecres)
    (primer-assignat dijous) (segon-assignat dijous)
    (primer-es dijous sopa)    ;; plat concret
    (primer-assignat divendres) (segon-assignat divendres)

    ;; Imprimim els menus per millor llegibilitat
    (impres dilluns)
    (impres dimarts)
    (impres dimecres)
    (impres dijous)
    (impres divendres)
  ))
)