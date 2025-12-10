(define (domain menu-setmanal)
  (:requirements :strips :typing :equality)

  (:types
    plat
    primer segon - plat
    dia
    tipus
  )

  (:constants
    none - dia  ;; constant auxiliar
  )

  (:predicates
    (primer-assignat ?d - dia)
    (segon-assignat ?d - dia)
    (primer-es ?d - dia ?p - primer)
    (segon-es ?d - dia ?p - segon)
    (incompatible ?p1 - primer ?p2 - segon)
    (utilitzat ?p - plat)
    (tipus-es ?p - plat ?t - tipus)
    (precedent ?d1 ?d2)
    (impres ?d)
  )

  (:action assignar-primer
    :parameters (?d ?d0 - dia ?p ?p0 - primer ?t0 ?t - tipus)
    :precondition (and
      (not (primer-assignat ?d))
      (not (utilitzat ?p))
      (precedent ?d0 ?d)    ;; retorna el dia anterior
      (imply (not (= ?d0 none)) (primer-es ?d0 ?p0))  ;; NOTA: sino tmb podria fer un nou predicat. No se si el imply l'he utilitzat correctament
      (tipus-es ?p0 ?t0)    ;; tipus del dia anterior
      (tipus-es ?p ?t)      ;; tipus actual
      (not (= ?t0 ?t))
    )
    :effect (and
      (primer-assignat ?d)
      (primer-es ?d ?p)
      (utilitzat ?p)
    )
  )

  (:action assignar-segon
    :parameters (?d ?d0 - dia ?s0 - segon ?t ?t0 - tipus ?p - primer ?s - segon)  ;; estan colocats aixi per llegibilitat del output
    :precondition (and
      (primer-assignat ?d)
      (not (segon-assignat ?d))
      (primer-es ?d ?p)    ;; retorna un primer
      (not (incompatible ?p ?s))
      (not (utilitzat ?s))
      ;; Comprobem que no hi hagi tipus consecutius
      (precedent ?d0 ?d) 
      (imply (not (= ?d0 none)) (segon-es ?d0 ?s0)) 
      (tipus-es ?s0 ?t0)  
      (tipus-es ?s ?t) 
      (not (= ?t0 ?t))
    )
    :effect (and
      (segon-assignat ?d)
      (segon-es ?d ?s)
      (utilitzat ?s)
    )
  ) 

  (:action menu-resultat
    :parameters (?d - dia ?p - primer ?s - segon)
    :precondition (and 
      (primer-assignat ?d)
      (segon-assignat ?d)
      (primer-es ?d ?p)
      (segon-es ?d ?s)
      (not (impres ?d))
    )
    :effect (and 
      (impres ?d)
    )
  )
)



;; NOTA: us alternatiu al imply:
;;  (or (= ?d0 none) (primer-es ?d0 ?p0))