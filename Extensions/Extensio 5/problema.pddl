(define (problem menu-automatic)
  (:domain menu-setmanal)

  (:objects
    ;; Plats
    amanida sopa fideua llenties cigrons - primer 
    llobarro salmo pollastre fabada entrecot llom - segon

    ;; Dies
    dilluns dimarts dimecres dijous divendres - dia

    ;; Tipus
    peix carn brou vegetal llegum arros - tipus
  )

  (:init
    ;; Incompatibilitats
    (incompatible llenties fabada)
    (incompatible sopa salmo)

    ;; Tipus per plat
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
    (tipus-es llom carn)  ;; dem. que l'agafara perque es barat

    ;; Precedencies entre dies
    (precedent none dilluns)
    (precedent dilluns dimarts)
    (precedent dimarts dimecres)
    (precedent dimecres dijous)
    (precedent dijous divendres)

    ;; Definim els fluents 
      ;; Calories - primers
      (= (calories amanida) 2)    ;; Els valors estan forçats per mostrar que funciona
      (= (calories sopa) 4)
      (= (calories fideua) 5)
      (= (calories llenties) 3)
      (= (calories cigrons) 1)

      ;; Calories - segons
      (= (calories llobarro) 1497)
      (= (calories salmo) 1499)
      (= (calories pollastre) 1496)
      (= (calories fabada) 1495)
      (= (calories entrecot) 1498)
      (= (calories llom) 1450)    ;; Pot anar amb qualsevol primer

    (= (calories-min) 1000)
    (= (calories-max) 1500) 

    ;; Preus
    (= (preu amanida) 1.5)
    (= (preu sopa) 2.0)
    (= (preu fideua) 3.0)
    (= (preu llenties) 2.5)
    (= (preu cigrons) 2.0)

    (= (preu llobarro) 5.0)
    (= (preu salmo) 5.5)
    (= (preu pollastre) 4.0)
    (= (preu fabada) 3.5)
    (= (preu entrecot) 6.0)
    (= (preu llom) 0.0)           ;; Es molt barat. Si minimitza de veritat; llavors l'agafara (enlloc que el pollastre)

    ;; Inicialitzem l'acumulador 
    (= (cost-total) 0) 
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

  ;; Minimitzar el preu del menu generat
  (:metric minimize (cost-total))
)


;; NOTA: ara per executar hem de fer: 
;;      ./ff -O -o dominio.pddl -f problema.pddl