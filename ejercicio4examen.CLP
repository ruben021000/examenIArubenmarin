(deffacts pracRobot
(robot 0 0 0 0 0)
(palet 3 3 3 3); naranja manzana caqui uva
(pedido 2 3 0 1)
(linea 0 0 0 0)
)

(defrule recoger_naranja
(declare (salience 25))
    (robot ?n ?m ?c ?u ?r)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (linea ?ln ?lm ?lc ?lu)
    
    (test (> ?pn 0))
    (test (< ?r 3))
    (test (> ?qn 0))
    (test (<= ?ln ?qn))

    =>
    (assert(robot (+ ?n 1) ?m ?c ?u (+ ?r 1)))
    (assert(palet (- ?pn 1) ?pm ?pc ?pu))
    (printout t "Recojo naranja" crlf)
)


(defrule recoger_manzana
(declare (salience 25))
    (robot ?n ?m ?c ?u ?r)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (linea ?ln ?lm ?lc ?lu)

    (test (> ?pm 0))
    (test (< ?r 3))
    (test (> ?qm 0))
    (test (<= ?lm ?qm))

    =>
    (assert(robot ?n (+ ?m 1) ?c ?u (+ ?r 1)))
    (assert(palet ?pn (- ?pm 1) ?pc ?pu))
    (printout t "Recojo manzana" crlf)
)

(defrule recoger_caqui
(declare (salience 25))
    (robot ?n ?m ?c ?u ?r)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (linea ?ln ?lm ?lc ?lu)

    (test (> ?pc 0))
    (test (< ?r 3))
    (test (> ?qc 0))
    (test (<= ?lc ?qc))

    =>
    (assert(robot ?n ?m (+ ?c 1) ?u (+ ?r 1)))
    (assert(palet ?pn ?m (- ?pc 1) ?pu))
    (printout t "Recojo caqui" crlf)
)

(defrule recoger_uva
(declare (salience 25))
    (robot ?n ?m ?c ?u ?r)
    (palet ?pn ?pm ?pc ?pu)
    (pedido ?qn ?qm ?qc ?qu)
    (linea ?ln ?lm ?lc ?lu)

    (test (> ?pu 0))
    (test (< ?r 3))
    (test (> ?qu 0))
    (test (<= ?lu ?qu))

    =>
    (assert(robot ?n ?m ?c (+ ?u 1) (+ ?r 1)))
    (assert(palet ?pn ?m ?pc (- ?pu 1)))
    (printout t "Recojo uva" crlf)
)

(defrule dejar
(declare (salience 50))
    (robot ?n ?m ?c ?u ?r)
    (linea ?ln ?lm ?lc ?lu)
    (pedido ?qn ?qm ?qc ?qu)
    (test (= ?r 3))    
    (test (<= ?ln ?qn))
    (test (<= ?lm ?qm))
    (test (<= ?lc ?qc))
    (test (<= ?lu ?qu))

    =>
    (assert(linea (+ ?n ?ln) (+ ?m ?lm) (+ ?c ?lc) (+ ?u ?lu)))
    (assert(robot 0 0 0 0 0))
    (printout t "Carga dejada" crlf)
)

(defrule terminado
(declare (salience 100))
    (linea ?ln ?lm ?lc ?lu)
    (pedido ?qn ?qm ?qc ?qu)
    (test (= ?qn ?ln))
    (test (= ?qm ?lm))
    (test (= ?qc ?lc))
    (test (= ?qu ?lu))

    =>
    (printout t "Pedido terminado " ?ln ?lm ?lc ?lu crlf)
    (halt)
)







 