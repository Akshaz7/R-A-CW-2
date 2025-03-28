(define (problem courier-problem)
    (:domain courier-world-domain)
    (:objects 
        c - courier
        N1 N2 N3 N4 N5 N6 N7 N8 N9 N10 N11 N12 N13 - location
        pizza sushi burrito curry beer soda taco burger chips kebab coffee - item ; added 4 new items
    )

    (:init
        (road N1 N2)
        (road N1 N6)
        (road N1 N9)
        (road N1 N12)
        ;removed N2 to N1 road
        ;removed N3 to N2 road
        (road N2 N3) 
        (road N3 N4)
        (road N4 N5)
        (road N5 N2)
        (road N5 N6)
        (road N6 N1)
        (road N6 N7)
        (road N7 N6)
        (road N7 N8)
        (road N8 N7) 
        (road N9 N1)
        (road N9 N10)
        (road N10 N9)
        (road N11 N9)
        (road N12 N11)
        (road N12 N13)
        (at c N9) ; courier now starts at node 9 which has only one road
        (item-at pizza N12)
        (item-at sushi N2)
        (item-at curry N2)
        (item-at beer N3)
        (item-at soda N3)
        (item-at taco N6)
        (item-at burrito N6) 
        (item-at burger N12) ;added new items or new restaurants
        (item-at coffee N3)
        (item-at kebab N12)
        (item-at chips N6)
        (needs curry N11)
        (needs taco N8)
        (needs burrito N13)
        (needs soda N13)
        (needs sushi N5)
        (needs chips N5)
        (needs pizza N10)
        (needs beer N10)
        (needs burger N4) ; added more needs for locations
        (needs chips N10)
        (needs kebab N8)
        (needs coffee N13)
    )

    (:goal (and
        (delivered N11 curry)
        (delivered N8 taco)
        (delivered N13 burrito)
        (delivered N13 soda)
        (delivered N5 sushi)
        (delivered N10 pizza)
        (delivered N10 beer)
        (delivered N4 burger) ;more goals to fulfil
        (delivered N8 kebab)
        (delivered N10 chips)
        (delivered N13 coffee)
    ))
)

