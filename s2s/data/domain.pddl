;Automatically generated TreasureGame domain PPDDL file.
(define (domain TreasureGame)
	(:requirements :strips :probabilistic-effects :rewards)

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

	(:action go_left_option-partition-0-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-3
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-6
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-7
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-8
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-9
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-10
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-11
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-12
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_12))
		:effect ((probabilistic 
					0.31000000000000005 (not (notfailed))
					0.69 (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-13
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_23))
		:effect ((probabilistic 
					0.538 (not (notfailed))
					0.462 (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-14
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_12))
		:effect ((probabilistic 
					0.727 (not (notfailed))
					0.273 (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-15
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_23))
		:effect ((probabilistic 
					0.764 (not (notfailed))
					0.236 (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-16
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_2))
		:effect ((probabilistic 
					0.125 (not (notfailed))
					0.875 (and (symbol_7) (not (symbol_6)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-17
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-18
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-19
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-20
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-21
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-22
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-23
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.513 (not (notfailed))
					0.487 (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-24
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-25
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-26
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-27
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-28
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-29
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-30
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-31
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-32
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-33
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-34
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-35
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_2))
		:effect ((probabilistic 
					0.235 (not (notfailed))
					0.765 (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-36
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-37
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-38
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_2))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-39
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_12))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-40
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_23))
		:effect (and (symbol_7) (not (symbol_10)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-41
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_2))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-42
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-43
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
	)

	(:action go_left_option-partition-0-44
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_2))
		:effect ((probabilistic 
					0.07399999999999995 (not (notfailed))
					0.926 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-45
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_12))
		:effect ((probabilistic 
					0.08199999999999996 (not (notfailed))
					0.918 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-46
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_23))
		:effect ((probabilistic 
					0.08799999999999997 (not (notfailed))
					0.912 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-47
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_2))
		:effect ((probabilistic 
					0.385 (not (notfailed))
					0.615 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-48
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_12))
		:effect ((probabilistic 
					0.716 (not (notfailed))
					0.284 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-49
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_23))
		:effect ((probabilistic 
					0.8109999999999999 (not (notfailed))
					0.189 (and (symbol_7) (not (symbol_14)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-50
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_2))
		:effect ((probabilistic 
					0.5389999999999999 (not (notfailed))
					0.461 (and (symbol_7) (not (symbol_28)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-51
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_12))
		:effect ((probabilistic 
					0.504 (not (notfailed))
					0.496 (and (symbol_7) (not (symbol_28)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-0-52
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_23))
		:effect ((probabilistic 
					0.46599999999999997 (not (notfailed))
					0.534 (and (symbol_7) (not (symbol_28)) (decrease (reward) 42.03))
				)
		)
	)

	(:action go_left_option-partition-1-53
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-54
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-55
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_9)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-56
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.14500000000000002 (not (notfailed))
					0.855 (and (symbol_6) (not (symbol_9)) (decrease (reward) 96.30))
				)
		)
	)

	(:action go_left_option-partition-1-57
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.237 (not (notfailed))
					0.763 (and (symbol_6) (not (symbol_11)) (decrease (reward) 96.30))
				)
		)
	)

	(:action go_left_option-partition-1-58
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.719 (not (notfailed))
					0.281 (and (symbol_6) (not (symbol_11)) (decrease (reward) 96.30))
				)
		)
	)

	(:action go_left_option-partition-1-59
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-60
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-61
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-62
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 96.30))
	)

	(:action go_left_option-partition-1-63
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.877 (not (notfailed))
					0.123 (and (symbol_6) (not (symbol_28)) (decrease (reward) 96.30))
				)
		)
	)

	(:action go_left_option-partition-2-64
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_19))
		:effect (and (symbol_8) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-65
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (and (symbol_8) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-66
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25))
		:effect ((probabilistic 
					0.20799999999999996 (not (notfailed))
					0.792 (and (symbol_8) (decrease (reward) 35.38))
				)
		)
	)

	(:action go_left_option-partition-2-67
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect ((probabilistic 
					0.8180000000000001 (not (notfailed))
					0.182 (and (symbol_8) (not (symbol_9)) (decrease (reward) 35.38))
				)
		)
	)

	(:action go_left_option-partition-2-68
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-69
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-70
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-71
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_19))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-72
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-73
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-74
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-75
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_8) (not (symbol_26)) (decrease (reward) 35.38))
	)

	(:action go_left_option-partition-2-76
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect ((probabilistic 
					0.08699999999999997 (not (notfailed))
					0.913 (and (symbol_8) (not (symbol_26)) (decrease (reward) 35.38))
				)
		)
	)

	(:action go_left_option-partition-3-77
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_4))
		:effect ((probabilistic 
					0.19399999999999995 (not (notfailed))
					0.806 (and (symbol_9) (not (symbol_8)) (decrease (reward) 33.60))
				)
		)
	)

	(:action go_left_option-partition-3-78
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 33.60))
	)

	(:action go_left_option-partition-3-79
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 33.60))
	)

	(:action go_left_option-partition-3-80
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_4))
		:effect ((probabilistic 
					0.65 (not (notfailed))
					0.35 (and (symbol_9) (not (symbol_26)) (decrease (reward) 33.60))
				)
		)
	)

	(:action go_left_option-partition-3-81
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.18300000000000005 (not (notfailed))
					0.817 (and (symbol_9) (not (symbol_26)) (decrease (reward) 33.60))
				)
		)
	)

	(:action go_left_option-partition-3-82
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.19599999999999995 (not (notfailed))
					0.804 (and (symbol_9) (not (symbol_26)) (decrease (reward) 33.60))
				)
		)
	)

	(:action go_left_option-partition-4-83
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 33.19))
	)

	(:action go_left_option-partition-4-84
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-85
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-86
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-87
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-88
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect ((probabilistic 
					0.651 (not (notfailed))
					0.349 (and (symbol_10) (decrease (reward) 33.20))
				)
		)
	)

	(:action go_left_option-partition-4-89
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.5 (not (notfailed))
					0.5 (and (symbol_10) (decrease (reward) 33.20))
				)
		)
	)

	(:action go_left_option-partition-4-90
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-91
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-92
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-93
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-94
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-95
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-96
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-97
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-98
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect ((probabilistic 
					0.897 (not (notfailed))
					0.103 (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
				)
		)
	)

	(:action go_left_option-partition-4-99
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-100
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_10) (not (symbol_28)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-101
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_10) (not (symbol_28)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-102
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_10) (not (symbol_28)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-103
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_10) (not (symbol_28)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-4-104
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_10) (not (symbol_28)) (decrease (reward) 33.20))
	)

	(:action go_left_option-partition-5-105
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_11) (not (symbol_8)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-5-106
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_11) (not (symbol_8)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-5-107
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_11) (not (symbol_9)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-5-108
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect ((probabilistic 
					0.677 (not (notfailed))
					0.323 (and (symbol_11) (not (symbol_9)) (decrease (reward) 50.48))
				)
		)
	)

	(:action go_left_option-partition-5-109
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17))
		:effect (and (symbol_11) (not (symbol_13)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-5-110
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27))
		:effect ((probabilistic 
					0.643 (not (notfailed))
					0.357 (and (symbol_11) (not (symbol_13)) (decrease (reward) 50.48))
				)
		)
	)

	(:action go_left_option-partition-5-111
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_11) (not (symbol_26)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-5-112
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_11) (not (symbol_26)) (decrease (reward) 50.48))
	)

	(:action go_left_option-partition-6-113
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.07299999999999995 (not (notfailed))
					0.927 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 45.67))
				)
		)
	)

	(:action go_left_option-partition-6-114
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_2))
		:effect ((probabilistic 
					0.536 (not (notfailed))
					0.464 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 45.67))
				)
		)
	)

	(:action go_left_option-partition-6-115
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.639 (not (notfailed))
					0.361 (and (symbol_12) (symbol_7) (not (symbol_2)) (decrease (reward) 45.67))
				)
		)
	)

	(:action go_left_option-partition-6-116
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_2))
		:effect (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_10)) (decrease (reward) 45.67))
	)

	(:action go_left_option-partition-6-117
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_2))
		:effect ((probabilistic 
					0.41700000000000004 (not (notfailed))
					0.583 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_10)) (decrease (reward) 45.67))
				)
		)
	)

	(:action go_left_option-partition-6-118
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.40900000000000003 (not (notfailed))
					0.591 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_14)) (decrease (reward) 45.67))
				)
		)
	)

	(:action go_right_option-partition-0-119
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 48.24))
	)

	(:action go_right_option-partition-0-120
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 48.24))
	)

	(:action go_right_option-partition-0-121
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 48.24))
	)

	(:action go_right_option-partition-0-122
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect ((probabilistic 
					0.5389999999999999 (not (notfailed))
					0.461 (and (symbol_6) (not (symbol_7)) (decrease (reward) 48.24))
				)
		)
	)

	(:action go_right_option-partition-0-123
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect ((probabilistic 
					0.8160000000000001 (not (notfailed))
					0.184 (and (symbol_6) (not (symbol_10)) (decrease (reward) 48.24))
				)
		)
	)

	(:action go_right_option-partition-1-124
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-125
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-126
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-127
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-128
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.655 (not (notfailed))
					0.345 (and (symbol_8) (not (symbol_6)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-129
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-130
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-131
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-132
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.19099999999999995 (not (notfailed))
					0.809 (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-133
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-134
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.894 (not (notfailed))
					0.106 (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-135
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.18899999999999995 (not (notfailed))
					0.811 (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-136
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-137
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-138
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.6990000000000001 (not (notfailed))
					0.301 (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-139
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-140
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.08899999999999997 (not (notfailed))
					0.911 (and (symbol_8) (not (symbol_10)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-141
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-142
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-143
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-144
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.813 (not (notfailed))
					0.187 (and (symbol_8) (not (symbol_10)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-145
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-146
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-147
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.125 (not (notfailed))
					0.875 (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-148
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-149
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-150
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-151
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.885 (not (notfailed))
					0.115 (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-152
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-153
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.899 (not (notfailed))
					0.101 (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-154
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.404 (not (notfailed))
					0.596 (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-155
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-156
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-157
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-158
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-159
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.751 (not (notfailed))
					0.249 (and (symbol_8) (not (symbol_14)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-160
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.28400000000000003 (not (notfailed))
					0.716 (and (symbol_8) (not (symbol_26)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-161
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.32599999999999996 (not (notfailed))
					0.674 (and (symbol_8) (not (symbol_26)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-162
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.487 (not (notfailed))
					0.513 (and (symbol_8) (not (symbol_26)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-163
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.8009999999999999 (not (notfailed))
					0.199 (and (symbol_8) (not (symbol_26)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-164
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.136 (not (notfailed))
					0.864 (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-165
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-166
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-167
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-168
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.477 (not (notfailed))
					0.523 (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
				)
		)
	)

	(:action go_right_option-partition-1-169
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-1-170
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 64.03))
	)

	(:action go_right_option-partition-2-171
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-172
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-173
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-174
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-175
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-176
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-177
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-178
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-179
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-180
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-181
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-182
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.11599999999999999 (not (notfailed))
					0.884 (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-183
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-184
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_11)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-185
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_11)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-186
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.10199999999999998 (not (notfailed))
					0.898 (and (symbol_13) (not (symbol_11)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-187
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_15))
		:effect ((probabilistic 
					0.484 (not (notfailed))
					0.516 (and (symbol_13) (not (symbol_11)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-188
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-189
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-190
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_0))
		:effect ((probabilistic 
					0.07199999999999995 (not (notfailed))
					0.928 (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-191
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_15))
		:effect ((probabilistic 
					0.05300000000000005 (not (notfailed))
					0.947 (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-192
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-193
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-194
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.6970000000000001 (not (notfailed))
					0.303 (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-195
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 45.40))
	)

	(:action go_right_option-partition-2-196
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.46799999999999997 (not (notfailed))
					0.532 (and (symbol_13) (not (symbol_28)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-197
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_15))
		:effect ((probabilistic 
					0.865 (not (notfailed))
					0.135 (and (symbol_13) (not (symbol_28)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-2-198
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.45299999999999996 (not (notfailed))
					0.547 (and (symbol_13) (not (symbol_28)) (decrease (reward) 45.40))
				)
		)
	)

	(:action go_right_option-partition-3-199
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17))
		:effect (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
	)

	(:action go_right_option-partition-3-200
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19))
		:effect (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
	)

	(:action go_right_option-partition-3-201
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
	)

	(:action go_right_option-partition-3-202
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
	)

	(:action go_right_option-partition-3-203
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect ((probabilistic 
					0.49 (not (notfailed))
					0.51 (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
				)
		)
	)

	(:action go_right_option-partition-3-204
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_10) (not (symbol_7)) (decrease (reward) 31.38))
	)

	(:action go_right_option-partition-3-205
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect ((probabilistic 
					0.869 (not (notfailed))
					0.131 (and (symbol_10) (decrease (reward) 31.38))
				)
		)
	)

	(:action go_right_option-partition-3-206
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.849 (not (notfailed))
					0.151 (and (symbol_10) (decrease (reward) 31.38))
				)
		)
	)

	(:action go_right_option-partition-4-207
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect ((probabilistic 
					0.05500000000000005 (not (notfailed))
					0.945 (and (symbol_14) (not (symbol_6)) (decrease (reward) 26.85))
				)
		)
	)

	(:action go_right_option-partition-4-208
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect ((probabilistic 
					0.647 (not (notfailed))
					0.353 (and (symbol_14) (not (symbol_6)) (decrease (reward) 26.85))
				)
		)
	)

	(:action go_right_option-partition-4-209
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.275 (not (notfailed))
					0.725 (and (symbol_14) (not (symbol_6)) (decrease (reward) 26.85))
				)
		)
	)

	(:action go_right_option-partition-4-210
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_14) (not (symbol_10)) (decrease (reward) 26.85))
	)

	(:action go_right_option-partition-4-211
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect ((probabilistic 
					0.725 (not (notfailed))
					0.275 (and (symbol_14) (not (symbol_10)) (decrease (reward) 26.85))
				)
		)
	)

	(:action go_right_option-partition-4-212
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect ((probabilistic 
					0.09499999999999997 (not (notfailed))
					0.905 (and (symbol_14) (not (symbol_10)) (decrease (reward) 26.85))
				)
		)
	)

	(:action go_right_option-partition-4-213
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_14) (not (symbol_10)) (decrease (reward) 26.85))
	)

	(:action go_right_option-partition-5-214
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-215
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-216
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-217
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.22699999999999998 (not (notfailed))
					0.773 (and (symbol_11) (not (symbol_6)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-218
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-219
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-220
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect ((probabilistic 
					0.06699999999999995 (not (notfailed))
					0.933 (and (symbol_11) (not (symbol_10)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-221
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.512 (not (notfailed))
					0.488 (and (symbol_11) (not (symbol_10)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-222
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-223
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 64.22))
	)

	(:action go_right_option-partition-5-224
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect ((probabilistic 
					0.09199999999999997 (not (notfailed))
					0.908 (and (symbol_11) (not (symbol_14)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-225
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect ((probabilistic 
					0.5900000000000001 (not (notfailed))
					0.41 (and (symbol_11) (not (symbol_14)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-226
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect ((probabilistic 
					0.524 (not (notfailed))
					0.476 (and (symbol_11) (not (symbol_28)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-5-227
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect ((probabilistic 
					0.665 (not (notfailed))
					0.335 (and (symbol_11) (not (symbol_28)) (decrease (reward) 64.22))
				)
		)
	)

	(:action go_right_option-partition-6-228
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.54 (not (notfailed))
					0.46 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-229
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_0))
		:effect ((probabilistic 
					0.6739999999999999 (not (notfailed))
					0.326 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-230
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.08099999999999996 (not (notfailed))
					0.919 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-231
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_0))
		:effect ((probabilistic 
					0.346 (not (notfailed))
					0.654 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-232
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.17200000000000004 (not (notfailed))
					0.828 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-233
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.795 (not (notfailed))
					0.205 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 32.90))
				)
		)
	)

	(:action go_right_option-partition-6-234
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.725 (not (notfailed))
					0.275 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 32.90))
				)
		)
	)

	(:action up_ladder_option-partition-0-235
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.70))
	)

	(:action up_ladder_option-partition-0-236
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.70))
	)

	(:action up_ladder_option-partition-0-237
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.70))
	)

	(:action up_ladder_option-partition-0-238
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect ((probabilistic 
					0.32999999999999996 (not (notfailed))
					0.67 (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.70))
				)
		)
	)

	(:action up_ladder_option-partition-1-239
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect ((probabilistic 
					0.372 (not (notfailed))
					0.628 (and (symbol_16) (not (symbol_17)) (decrease (reward) 48.91))
				)
		)
	)

	(:action up_ladder_option-partition-1-240
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 48.91))
	)

	(:action up_ladder_option-partition-1-241
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_16) (not (symbol_27)) (decrease (reward) 48.91))
	)

	(:action up_ladder_option-partition-1-242
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect ((probabilistic 
					0.834 (not (notfailed))
					0.166 (and (symbol_16) (not (symbol_17)) (decrease (reward) 48.91))
				)
		)
	)

	(:action up_ladder_option-partition-1-243
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect ((probabilistic 
					0.128 (not (notfailed))
					0.872 (and (symbol_16) (not (symbol_18)) (decrease (reward) 48.91))
				)
		)
	)

	(:action up_ladder_option-partition-1-244
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect ((probabilistic 
					0.21399999999999997 (not (notfailed))
					0.786 (and (symbol_16) (not (symbol_27)) (decrease (reward) 48.91))
				)
		)
	)

	(:action up_ladder_option-partition-2-245
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-246
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-247
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-248
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.249 (not (notfailed))
					0.751 (and (symbol_17) (not (symbol_29)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-249
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-250
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-251
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect ((probabilistic 
					0.07699999999999996 (not (notfailed))
					0.923 (and (symbol_17) (not (symbol_25)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-252
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.5409999999999999 (not (notfailed))
					0.459 (and (symbol_17) (not (symbol_29)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-253
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-254
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 78.23))
	)

	(:action up_ladder_option-partition-2-255
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect ((probabilistic 
					0.10499999999999998 (not (notfailed))
					0.895 (and (symbol_17) (not (symbol_25)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-256
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect ((probabilistic 
					0.614 (not (notfailed))
					0.386 (and (symbol_17) (not (symbol_29)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-257
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect ((probabilistic 
					0.5569999999999999 (not (notfailed))
					0.443 (and (symbol_17) (not (symbol_19)) (decrease (reward) 78.23))
				)
		)
	)

	(:action up_ladder_option-partition-2-258
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect ((probabilistic 
					0.685 (not (notfailed))
					0.315 (and (symbol_17) (not (symbol_24)) (decrease (reward) 78.23))
				)
		)
	)

	(:action down_ladder_option-partition-0-259
		:parameters ()
		:precondition (and (notfailed) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)) (decrease (reward) 17.57))
	)

	(:action down_ladder_option-partition-1-260
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-261
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-262
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-263
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect ((probabilistic 
					0.10199999999999998 (not (notfailed))
					0.898 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.79))
				)
		)
	)

	(:action down_ladder_option-partition-1-264
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect ((probabilistic 
					0.15900000000000003 (not (notfailed))
					0.841 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
				)
		)
	)

	(:action down_ladder_option-partition-1-265
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect ((probabilistic 
					0.579 (not (notfailed))
					0.421 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.79))
				)
		)
	)

	(:action down_ladder_option-partition-1-266
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-267
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-268
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-269
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.79))
	)

	(:action down_ladder_option-partition-1-270
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect ((probabilistic 
					0.787 (not (notfailed))
					0.213 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.79))
				)
		)
	)

	(:action down_ladder_option-partition-2-271
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect ((probabilistic 
					0.889 (not (notfailed))
					0.111 (and (symbol_19) (not (symbol_17)) (decrease (reward) 39.36))
				)
		)
	)

	(:action down_ladder_option-partition-2-272
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-273
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-274
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-275
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-276
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-277
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-278
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_19) (not (symbol_17)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-279
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-280
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-281
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-282
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-283
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-284
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.44399999999999995 (not (notfailed))
					0.556 (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
				)
		)
	)

	(:action down_ladder_option-partition-2-285
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-286
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-287
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-288
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-289
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 39.36))
	)

	(:action down_ladder_option-partition-2-290
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 39.36))
	)

	(:action interact_option-partition-0-291
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.31799999999999995 (not (notfailed))
					0.5425386533665836 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.13946134663341647 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-292
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.7955112219451371 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.20448877805486285 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-293
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.7955112219451371 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.20448877805486285 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-294
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.536 (not (notfailed))
					0.36911720698254363 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.09488279301745636 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-295
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.393 (not (notfailed))
					0.47935346756152125 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.12764653243847876 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-296
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.11699999999999999 (not (notfailed))
					0.6973131991051454 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1856868008948546 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-297
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.7897091722595079 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.21029082774049218 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-298
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.7897091722595079 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.21029082774049218 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-299
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24) (symbol_21))
		:effect ((probabilistic 
					0.821 (not (notfailed))
					0.1413579418344519 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.0376420581655481 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-300
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_21))
		:effect ((probabilistic 
					0.501 (not (notfailed))
					0.3940648769574944 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1049351230425056 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-301
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.7897091722595079 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.21029082774049218 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-302
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.20099999999999996 (not (notfailed))
					0.6309776286353468 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.16802237136465326 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-303
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.7876106194690266 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.21238938053097345 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-304
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.7876106194690266 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.21238938053097345 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-305
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.605 (not (notfailed))
					0.3111061946902655 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.08389380530973452 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-306
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.06599999999999995 (not (notfailed))
					0.7356283185840709 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1983716814159292 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-307
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.21699999999999997 (not (notfailed))
					0.6166991150442478 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1663008849557522 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-308
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.8239316239316239 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.17606837606837608 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-309
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.8239316239316239 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.17606837606837608 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-310
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.845 (not (notfailed))
					0.1277094017094017 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.02729059829059829 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-4-311
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19) (symbol_12))
		:effect (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
	)

	(:action interact_option-partition-4-312
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24) (symbol_12))
		:effect ((probabilistic 
					0.15400000000000003 (not (notfailed))
					0.846 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-4-313
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25) (symbol_12))
		:effect ((probabilistic 
					0.687 (not (notfailed))
					0.313 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
				)
		)
	)

	(:action down_left_option-partition-0-314
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect ((probabilistic 
					0.32599999999999996 (not (notfailed))
					0.674 (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_9)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-315
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_16)) (decrease (reward) 37.10))
	)

	(:action down_left_option-partition-0-316
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_18)) (decrease (reward) 37.10))
	)

	(:action down_left_option-partition-0-317
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect ((probabilistic 
					0.804 (not (notfailed))
					0.196 (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_27)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-318
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect ((probabilistic 
					0.09799999999999998 (not (notfailed))
					0.902 (and (symbol_17) (symbol_11) (not (symbol_5)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-319
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)) (decrease (reward) 37.10))
	)

	(:action down_left_option-partition-0-320
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_18)) (decrease (reward) 37.10))
	)

	(:action down_left_option-partition-0-321
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect ((probabilistic 
					0.522 (not (notfailed))
					0.478 (and (symbol_17) (symbol_11) (not (symbol_14)) (not (symbol_16)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-322
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect ((probabilistic 
					0.45299999999999996 (not (notfailed))
					0.547 (and (symbol_17) (symbol_11) (not (symbol_16)) (not (symbol_26)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-323
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect ((probabilistic 
					0.534 (not (notfailed))
					0.466 (and (symbol_17) (symbol_11) (not (symbol_18)) (not (symbol_26)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-324
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect ((probabilistic 
					0.263 (not (notfailed))
					0.737 (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_28)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-0-325
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)) (not (symbol_28)) (decrease (reward) 37.10))
	)

	(:action down_left_option-partition-0-326
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect ((probabilistic 
					0.505 (not (notfailed))
					0.495 (and (symbol_17) (symbol_11) (not (symbol_18)) (not (symbol_28)) (decrease (reward) 37.10))
				)
		)
	)

	(:action down_left_option-partition-1-327
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 25.03))
	)

	(:action down_left_option-partition-2-328
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_19) (symbol_11) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_26)) (not (symbol_28)) (decrease (reward) 26.56))
	)

	(:action down_left_option-partition-3-329
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_24) (symbol_9) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (not (symbol_29)) (decrease (reward) 22.80))
	)

	(:action down_left_option-partition-4-330
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_17)) (decrease (reward) 22.48))
	)

	(:action down_left_option-partition-4-331
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_29)) (decrease (reward) 22.48))
	)

	(:action down_left_option-partition-4-332
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect ((probabilistic 
					0.08899999999999997 (not (notfailed))
					0.911 (and (symbol_25) (symbol_26) (not (symbol_17)) (decrease (reward) 22.48))
				)
		)
	)

	(:action down_left_option-partition-4-333
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect ((probabilistic 
					0.20499999999999996 (not (notfailed))
					0.795 (and (symbol_25) (symbol_26) (not (symbol_29)) (decrease (reward) 22.48))
				)
		)
	)

	(:action down_right_option-partition-0-334
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_18)) (decrease (reward) 35.07))
	)

	(:action down_right_option-partition-0-335
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect ((probabilistic 
					0.472 (not (notfailed))
					0.528 (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_27)) (decrease (reward) 35.07))
				)
		)
	)

	(:action down_right_option-partition-0-336
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect ((probabilistic 
					0.07099999999999995 (not (notfailed))
					0.929 (and (symbol_17) (symbol_14) (not (symbol_10)) (not (symbol_18)) (decrease (reward) 35.07))
				)
		)
	)

	(:action down_right_option-partition-0-337
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect ((probabilistic 
					0.598 (not (notfailed))
					0.402 (and (symbol_17) (symbol_14) (not (symbol_10)) (not (symbol_27)) (decrease (reward) 35.07))
				)
		)
	)

	(:action down_right_option-partition-0-338
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect ((probabilistic 
					0.21699999999999997 (not (notfailed))
					0.783 (and (symbol_17) (symbol_14) (not (symbol_18)) (decrease (reward) 35.07))
				)
		)
	)

	(:action down_right_option-partition-0-339
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect ((probabilistic 
					0.893 (not (notfailed))
					0.107 (and (symbol_17) (symbol_14) (not (symbol_27)) (decrease (reward) 35.07))
				)
		)
	)

	(:action down_right_option-partition-1-340
		:parameters ()
		:precondition (and (notfailed) (symbol_28))
		:effect ((probabilistic 
					0.05400000000000005 (not (notfailed))
					0.946 (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_16)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_27)) (not (symbol_28)) (not (symbol_29)) (decrease (reward) 25.07))
				)
		)
	)

	(:action jump_left_option-partition-0-341
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_17)) (decrease (reward) 37.00))
	)

	(:action jump_left_option-partition-0-342
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.122 (not (notfailed))
					0.878 (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_29)) (decrease (reward) 37.00))
				)
		)
	)

	(:action jump_left_option-partition-0-343
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_17)) (decrease (reward) 37.00))
	)

	(:action jump_left_option-partition-0-344
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect ((probabilistic 
					0.131 (not (notfailed))
					0.869 (and (symbol_27) (symbol_28) (not (symbol_29)) (decrease (reward) 37.00))
				)
		)
	)

	(:action jump_left_option-partition-1-345
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect ((probabilistic 
					0.5277310924369748 (and (symbol_18) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 36.30))
					0.4722689075630252 (and (symbol_17) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 60.57))
				)
		)
	)

	(:action jump_right_option-partition-0-346
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_27) (symbol_28) (not (symbol_5)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_29)) (decrease (reward) 36.57))
	)

	(:action jump_right_option-partition-1-347
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect ((probabilistic 
					0.8029999999999999 (not (notfailed))
					0.197 (and (symbol_24) (symbol_9) (not (symbol_6)) (not (symbol_19)) (decrease (reward) 36.54))
				)
		)
	)

	(:action jump_right_option-partition-1-348
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (decrease (reward) 36.54))
	)

	(:action jump_right_option-partition-1-349
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_11)) (not (symbol_19)) (decrease (reward) 36.54))
	)

	(:action jump_right_option-partition-1-350
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect ((probabilistic 
					0.06299999999999994 (not (notfailed))
					0.937 (and (symbol_24) (symbol_9) (not (symbol_14)) (not (symbol_19)) (decrease (reward) 36.54))
				)
		)
	)

	(:action jump_right_option-partition-1-351
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect ((probabilistic 
					0.46699999999999997 (not (notfailed))
					0.533 (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_26)) (decrease (reward) 36.54))
				)
		)
	)

	(:action jump_right_option-partition-1-352
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_28)) (decrease (reward) 36.54))
	)

	(:action jump_right_option-partition-2-353
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_25) (symbol_26) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_28)) (decrease (reward) 37.00))
	)

	(:action jump_right_option-partition-3-354
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect ((probabilistic 
					0.07999999999999996 (not (notfailed))
					0.5777132486388384 (and (symbol_18) (symbol_9) (not (symbol_11)) (decrease (reward) 38.54))
					0.34228675136116155 (and (symbol_17) (symbol_9) (not (symbol_11)) (not (symbol_18)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-3-355
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect ((probabilistic 
					0.33799999999999997 (not (notfailed))
					0.41570235934664246 (and (symbol_18) (symbol_9) (not (symbol_11)) (not (symbol_27)) (decrease (reward) 38.54))
					0.24629764065335755 (and (symbol_17) (symbol_9) (not (symbol_11)) (not (symbol_27)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-3-356
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect ((probabilistic 
					0.08099999999999996 (not (notfailed))
					0.5770852994555353 (and (symbol_18) (symbol_9) (not (symbol_14)) (decrease (reward) 38.54))
					0.3419147005444646 (and (symbol_17) (symbol_9) (not (symbol_14)) (not (symbol_18)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-3-357
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect ((probabilistic 
					0.32899999999999996 (not (notfailed))
					0.42135390199637024 (and (symbol_18) (symbol_9) (not (symbol_14)) (not (symbol_27)) (decrease (reward) 38.54))
					0.24964609800362977 (and (symbol_17) (symbol_9) (not (symbol_14)) (not (symbol_27)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-3-358
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect ((probabilistic 
					0.6279491833030852 (and (symbol_18) (symbol_9) (not (symbol_28)) (decrease (reward) 38.54))
					0.3720508166969147 (and (symbol_17) (symbol_9) (not (symbol_18)) (not (symbol_28)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-3-359
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27))
		:effect ((probabilistic 
					0.6279491833030852 (and (symbol_18) (symbol_9) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 38.54))
					0.3720508166969147 (and (symbol_17) (symbol_9) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 62.14))
				)
		)
	)

	(:action jump_right_option-partition-4-360
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_23))
		:effect ((probabilistic 
					0.248 (not (notfailed))
					0.752 (and (symbol_29) (symbol_8) (not (symbol_24)) (decrease (reward) 28.34))
				)
		)
	)

	(:action jump_right_option-partition-4-361
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_23))
		:effect ((probabilistic 
					0.277 (not (notfailed))
					0.723 (and (symbol_29) (symbol_8) (not (symbol_25)) (decrease (reward) 28.34))
				)
		)
	)

	(:action jump_right_option-partition-4-362
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_25) (symbol_23))
		:effect ((probabilistic 
					0.33299999999999996 (not (notfailed))
					0.667 (and (symbol_29) (symbol_8) (not (symbol_9)) (not (symbol_25)) (decrease (reward) 28.34))
				)
		)
	)

	(:action jump_right_option-partition-4-363
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_23))
		:effect ((probabilistic 
					0.5 (not (notfailed))
					0.5 (and (symbol_29) (symbol_8) (not (symbol_9)) (decrease (reward) 28.34))
				)
		)
	)

	(:action jump_right_option-partition-4-364
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_23))
		:effect ((probabilistic 
					0.281 (not (notfailed))
					0.719 (and (symbol_29) (symbol_8) (not (symbol_24)) (not (symbol_26)) (decrease (reward) 28.34))
				)
		)
	)

	(:action jump_right_option-partition-4-365
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_25) (symbol_23))
		:effect (and (symbol_29) (symbol_8) (not (symbol_25)) (not (symbol_26)) (decrease (reward) 28.34))
	)

	(:action jump_right_option-partition-4-366
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_23))
		:effect ((probabilistic 
					0.519 (not (notfailed))
					0.481 (and (symbol_29) (symbol_8) (not (symbol_26)) (decrease (reward) 28.34))
				)
		)
	)
)