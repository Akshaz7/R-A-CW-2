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
        (capacity ?c - courier)           ; max capacity
        (load ?c - courier)               ; current load
        (volume ?i - item)                ; item volume
    )

    (:action MOVE
        :parameters (?c - courier ?from - location ?to - location)
        :precondition (and (at ?c ?from) (road ?from ?to))
        :effect (and (not (at ?c ?from)) (at ?c ?to))
    )

    (:action PICK-UP
        :parameters (?c - courier ?i - item ?l - location)
        :precondition (and 
            (at ?c ?l)
            (item-at ?i ?l)
            (not (has ?c ?i))
            (<= (+ (load ?c) (volume ?i)) (capacity ?c))
        )
        :effect (and 
            (has ?c ?i) 
            (not (item-at ?i ?l))
            (increase (load ?c) (volume ?i))
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
            (decrease (load ?c) (volume ?i))
        )
    )
)
