(deffacts pracRobot
(robot 0 0 0 0)
(palets 3 3 3 3); naranja manzana caqui uva
(pedido 2 3 0 1)
)

(defrule recoger_naranja
(declare (salience 25))
    (robot ?n ?m ?c ?u)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (test (<> ?qn ?n))
    (test (> ?pn 0))
    =>
    (assert(robot (+ ?n 1) ?m ?c ?u))
    (assert(palets (- ?pn 1) ?pm ?pc ?pu))
    (printout t "Recojo naranja" crlf)
)
(defrule recoger_manzana

(declare (salience 25))
    (robot ?n ?m ?c ?u)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (test (<> ?qm ?m))
    (test (> ?pm 0))
    =>
    (assert(robot ?n (+ ?m 1) ?c ?u))
    (assert(palets ?pn (- ?pm 1) ?pc ?pu))
    (printout t "Recojo manzana" crlf)

)



 