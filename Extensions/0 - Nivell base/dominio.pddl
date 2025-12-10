(define (domain menu-setmanal)
  (:requirements :strips :typing :equality)

  (:types
    plat
    primer segon - plat
    dia
  )

  (:predicates
    (primer-assignat ?d - dia)
    (segon-assignat ?d - dia)
    (primer-es ?d - dia ?p - primer)
    (segon-es ?d - dia ?p - segon)
    (incompatible ?p1 - primer ?p2 - segon)
    (impres ?d)
  )

  (:action assignar-primer
    :parameters (?d - dia ?p - primer)
    :precondition (and
      (not (primer-assignat ?d))
    )
    :effect (and
      (primer-assignat ?d)
      (primer-es ?d ?p)
    )
  )

  (:action assignar-segon
    :parameters (?d - dia ?p - primer ?s - segon)  ;; la declarem als parametres
    :precondition (and
      (primer-assignat ?d)
      (not (segon-assignat ?d))
      (primer-es ?d ?p)    ;; aixo retorna un primer
      (not (incompatible ?p ?s))
    )
    :effect (and
      (segon-assignat ?d)
      (segon-es ?d ?s)
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