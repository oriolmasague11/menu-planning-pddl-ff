(define (domain menu-setmanal)
  (:requirements :typing)

  (:types
    plat tipus dia ordre
  )

  (:constants
    dilluns dimarts dimecres dijous divendres - dia
    primer segon - ordre
  )

  (:predicates
    (es-primer ?p - plat)
    (es-segon ?p - plat)
    (te-tipus ?p - plat ?t - tipus)
    (incompatible ?p1 - plat ?p2 - plat)
    (assignat ?d - dia ?pos - ordre ?p - plat)
    (tipus-assignat-dia ?d - dia ?pos - ordre ?t - tipus)
  )

  (:action assignar-plat
    :parameters (?d - dia ?pos - ordre ?p - plat ?t - tipus)
    :precondition (and
      (not (assignat ?d ?pos ?p))
      (not (tipus-assignat-dia ?d ?pos ?t))
    )
    :effect (and
      (assignat ?d ?pos ?p)
      (tipus-assignat-dia ?d ?pos ?t)
    )
  )
)
