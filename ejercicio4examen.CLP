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
    (test (<> ?qn ?n))
    (test (> ?pn 0))
    (test (<= ?r 3))
    (test (> ?qn 0))

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
    (test (<> ?qm ?m))
    (test (> ?pm 0))
    (test (<= ?r 3))
    (test (> ?qm 0))

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
    (test (<> ?qc ?c))
    (test (> ?pc 0))
    (test (<= ?r 3))
    (test (> ?qc 0))

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
    (test (<> ?qu ?u))
    (test (> ?pu 0))
    (test (<= ?r 3))
    (test (> ?qu 0))

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
    (test (< ?ln ?qm))
    (test (= ?lm ?qm))
    (test (= ?lc ?qc))
    (test (= ?lu ?qu))
    (test (= ?r 3))
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
    (printout t "Pedido terminado" crlf)
    (halt)
)







 