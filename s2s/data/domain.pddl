;Automatically generated TreasureGame domain PPDDL file.
(define (domain TreasureGame)
	(:requirements :strips)

	(:predicates
		(notfailed)
		(symbol_0)
		(symbol_1)
		(symbol_2)
		(symbol_3)
		(symbol_4)
		(symbol_5)
		(symbol_6)
		(symbol_7)
		(symbol_8)
		(symbol_9)
		(symbol_10)
		(symbol_11)
		(symbol_12)
		(symbol_13)
		(symbol_14)
		(symbol_15)
		(symbol_16)
		(symbol_17)
		(symbol_18)
		(symbol_19)
		(symbol_20)
		(symbol_21)
		(symbol_22)
		(symbol_23)
		(symbol_24)
		(symbol_25)
		(symbol_26)
		(symbol_27)
		(symbol_28)
		(symbol_29)
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (and (symbol_7) (not (symbol_14)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_7) (not (symbol_14)))
	)

	(:action Option-0-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_6) (not (symbol_8)))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_6) (not (symbol_8)))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_6) (not (symbol_9)))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_6) (not (symbol_13)))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_6) (not (symbol_26)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_19))
		:effect (symbol_8)
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (symbol_8)
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25))
		:effect (symbol_8)
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_19))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action Option-0-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_4))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_26)))
	)

	(:action Option-0-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_26)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action Option-0-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_11) (not (symbol_8)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_11) (not (symbol_8)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_11) (not (symbol_9)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17))
		:effect (and (symbol_11) (not (symbol_13)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_11) (not (symbol_26)))
	)

	(:action Option-0-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_11) (not (symbol_26)))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_4))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_4))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_21))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_4))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_13) (not (symbol_11)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action Option-1-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_14) (not (symbol_6)))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_14) (not (symbol_6)))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action Option-1-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-5
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_0))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_0))
		:effect (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_0))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_0))
		:effect (and (symbol_15) (symbol_13) (not (symbol_0)))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (not (notfailed))
	)

	(:action Option-1-Partition-6
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect (not (notfailed))
	)

	(:action Option-2-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action Option-2-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action Option-2-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action Option-2-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_5) (not (symbol_17)))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_5) (not (symbol_18)))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_5) (not (symbol_27)))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (not (notfailed))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (and (symbol_5) (not (symbol_18)))
	)

	(:action Option-2-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_5) (not (symbol_27)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_17) (not (symbol_29)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (not (notfailed))
	)

	(:action Option-2-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (not (notfailed))
	)

	(:action Option-3-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action Option-3-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (not (notfailed))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_19) (not (symbol_17)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (not (notfailed))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action Option-3-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action Option-4-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)))
	)

	(:action Option-4-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-4-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_9)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_16)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_18)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_18)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (not (notfailed))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_26)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (not (notfailed))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_28)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)) (not (symbol_28)))
	)

	(:action Option-5-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect (not (notfailed))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_18)))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_27)))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_27)))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)) (not (symbol_28)))
	)

	(:action Option-5-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_27)) (not (symbol_28)))
	)

	(:action Option-5-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_19) (symbol_11) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_26)) (not (symbol_28)))
	)

	(:action Option-5-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_24) (symbol_9) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (not (symbol_29)))
	)

	(:action Option-5-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_17)))
	)

	(:action Option-5-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_29)))
	)

	(:action Option-5-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_17)))
	)

	(:action Option-5-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_29)))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_18)))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_27)))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_10)) (not (symbol_18)))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)))
	)

	(:action Option-6-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect (not (notfailed))
	)

	(:action Option-6-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_17) (symbol_11) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action Option-7-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_17)))
	)

	(:action Option-7-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_29)))
	)

	(:action Option-7-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_17)))
	)

	(:action Option-7-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_27) (symbol_28) (not (symbol_29)))
	)

	(:action Option-7-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_18) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action Option-8-Partition-0
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_27) (symbol_28) (not (symbol_5)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_29)))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (not (notfailed))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_11)) (not (symbol_19)))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_14)) (not (symbol_19)))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_26)))
	)

	(:action Option-8-Partition-1
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_28)))
	)

	(:action Option-8-Partition-2
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_25) (symbol_26) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_28)))
	)

	(:action Option-8-Partition-3
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_18) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action Option-8-Partition-4
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_29) (symbol_8) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)))
	)
)