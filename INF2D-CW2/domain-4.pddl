(define (domain courier-world-domain)
    (:requirements :strips :typing :adl :fluents)
    (:types courier location item customer)

    (:predicates
        (at ?c - courier ?l - location) ; courier is at location
        (road ?from - location ?to - location) ; road exists between locations
        (item-at ?i - item ?l - location) ; item is at location
        (has ?c - courier ?i - item) ; courier has item
        (delivered ?l - location ?i - item) ; delivered item at location
        (needs ?i - item ?l - location ) ; location needs item
    )

    (:functions
        (fuel ?c - courier)              ; current fuel level of the courier
        (max-fuel ?c - courier)          ; maximum fuel capacity
        (length ?from - location ?to - location) ; fuel cost of the road
    )

    (:action MOVE
        :parameters (?c - courier ?from - location ?to - location)
        :precondition (and 
          (at ?c ?from)
          (road ?from ?to)
          (>= (fuel ?c) (length ?from ?to))
        )
        :effect (and 
          (not (at ?c ?from))
          (at ?c ?to)
          (decrease (fuel ?c) (length ?from ?to))
        )
    )

    (:action PICK-UP
        :parameters (?c - courier ?i - item ?l - location)
        :precondition (and (at ?c ?l) (item-at ?i ?l) (not (has ?c ?i)))
        :effect (and 
            (has ?c ?i) 
            (not (item-at ?i ?l))
        )
    )

    (:action DELIVER
        :parameters (?c - courier ?i - item ?l - location)
        :precondition (and (at ?c ?l) (has ?c ?i) (needs ?i ?l))
        :effect (and 
            (not (has ?c ?i)) 
            (item-at ?i ?l) 
            (delivered ?l ?i) 
            (not (needs ?i ?l))
        )
    )

    (:action REFUEL
        :parameters (?c - courier ?l - location)
        :precondition (and 
          (at ?c ?l)
          (= ?l N4) ; petrol station is at N4
        )
        :effect (assign (fuel ?c) (max-fuel ?c))
    )
)