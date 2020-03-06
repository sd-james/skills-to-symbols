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
		:precondition (and (notfailed) (symbol_6) (symbol_16))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-3
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect ((probabilistic 
					0.42100000000000004 (not (notfailed))
					0.579 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-0-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect ((probabilistic 
					0.802 (not (notfailed))
					0.198 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-0-6
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect ((probabilistic 
					0.06000000000000005 (not (notfailed))
					0.94 (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-0-7
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-8
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-9
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-10
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-11
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-12
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-13
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-14
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect ((probabilistic 
					0.052000000000000046 (not (notfailed))
					0.948 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-0-15
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect ((probabilistic 
					0.42700000000000005 (not (notfailed))
					0.573 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-0-16
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect ((probabilistic 
					0.8200000000000001 (not (notfailed))
					0.18 (and (symbol_7) (not (symbol_28)) (decrease (reward) 49.00))
				)
		)
	)

	(:action go_left_option-partition-1-17
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-18
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-19
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_9)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-20
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.13 (not (notfailed))
					0.87 (and (symbol_6) (not (symbol_9)) (decrease (reward) 97.00))
				)
		)
	)

	(:action go_left_option-partition-1-21
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.20799999999999996 (not (notfailed))
					0.792 (and (symbol_6) (not (symbol_10)) (decrease (reward) 97.00))
				)
		)
	)

	(:action go_left_option-partition-1-22
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.6930000000000001 (not (notfailed))
					0.307 (and (symbol_6) (not (symbol_10)) (decrease (reward) 97.00))
				)
		)
	)

	(:action go_left_option-partition-1-23
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-24
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-25
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-26
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-27
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.864 (not (notfailed))
					0.136 (and (symbol_6) (not (symbol_28)) (decrease (reward) 97.00))
				)
		)
	)

	(:action go_left_option-partition-2-28
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_19))
		:effect (and (symbol_8) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-29
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (and (symbol_8) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-30
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25))
		:effect ((probabilistic 
					0.21799999999999997 (not (notfailed))
					0.782 (and (symbol_8) (decrease (reward) 32.66))
				)
		)
	)

	(:action go_left_option-partition-2-31
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect ((probabilistic 
					0.819 (not (notfailed))
					0.181 (and (symbol_8) (not (symbol_9)) (decrease (reward) 32.66))
				)
		)
	)

	(:action go_left_option-partition-2-32
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-33
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-34
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-35
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_19))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-36
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-37
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-38
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-39
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_8) (not (symbol_26)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-40
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect ((probabilistic 
					0.07699999999999996 (not (notfailed))
					0.923 (and (symbol_8) (not (symbol_26)) (decrease (reward) 32.66))
				)
		)
	)

	(:action go_left_option-partition-3-41
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_4))
		:effect ((probabilistic 
					0.17300000000000004 (not (notfailed))
					0.827 (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))
				)
		)
	)

	(:action go_left_option-partition-3-42
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))
	)

	(:action go_left_option-partition-3-43
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))
	)

	(:action go_left_option-partition-3-44
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_4))
		:effect ((probabilistic 
					0.638 (not (notfailed))
					0.362 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))
				)
		)
	)

	(:action go_left_option-partition-3-45
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.18100000000000005 (not (notfailed))
					0.819 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))
				)
		)
	)

	(:action go_left_option-partition-3-46
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.18999999999999995 (not (notfailed))
					0.81 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))
				)
		)
	)

	(:action go_left_option-partition-4-47
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_10) (not (symbol_8)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-48
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_10) (not (symbol_8)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-49
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_10) (not (symbol_9)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-50
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect ((probabilistic 
					0.641 (not (notfailed))
					0.359 (and (symbol_10) (not (symbol_9)) (decrease (reward) 80.84))
				)
		)
	)

	(:action go_left_option-partition-4-51
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17))
		:effect (and (symbol_10) (not (symbol_13)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-52
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27))
		:effect ((probabilistic 
					0.622 (not (notfailed))
					0.378 (and (symbol_10) (not (symbol_13)) (decrease (reward) 80.84))
				)
		)
	)

	(:action go_left_option-partition-4-53
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_10) (not (symbol_26)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-54
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_10) (not (symbol_26)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-5-55
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-56
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-57
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-58
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-59
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-60
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-61
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-62
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-63
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.14200000000000002 (not (notfailed))
					0.858 (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
				)
		)
	)

	(:action go_left_option-partition-5-64
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect ((probabilistic 
					0.877 (not (notfailed))
					0.123 (and (symbol_11) (decrease (reward) 32.62))
				)
		)
	)

	(:action go_left_option-partition-5-65
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.796 (not (notfailed))
					0.204 (and (symbol_11) (decrease (reward) 32.62))
				)
		)
	)

	(:action go_left_option-partition-5-66
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-67
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-68
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-69
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-70
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-71
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect ((probabilistic 
					0.17100000000000004 (not (notfailed))
					0.829 (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
				)
		)
	)

	(:action go_left_option-partition-5-72
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-73
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-74
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-75
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-6-76
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.07099999999999995 (not (notfailed))
					0.929 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 49.13))
				)
		)
	)

	(:action go_left_option-partition-6-77
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_2))
		:effect ((probabilistic 
					0.548 (not (notfailed))
					0.452 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 49.13))
				)
		)
	)

	(:action go_left_option-partition-6-78
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.595 (not (notfailed))
					0.405 (and (symbol_12) (symbol_7) (not (symbol_2)) (decrease (reward) 49.13))
				)
		)
	)

	(:action go_left_option-partition-6-79
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_2))
		:effect (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_11)) (decrease (reward) 49.13))
	)

	(:action go_left_option-partition-6-80
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_2))
		:effect ((probabilistic 
					0.38 (not (notfailed))
					0.62 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_11)) (decrease (reward) 49.13))
				)
		)
	)

	(:action go_left_option-partition-6-81
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_2))
		:effect ((probabilistic 
					0.44499999999999995 (not (notfailed))
					0.555 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_14)) (decrease (reward) 49.13))
				)
		)
	)

	(:action go_right_option-partition-0-82
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-83
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-84
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-85
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect ((probabilistic 
					0.526 (not (notfailed))
					0.474 (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
				)
		)
	)

	(:action go_right_option-partition-0-86
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect ((probabilistic 
					0.825 (not (notfailed))
					0.175 (and (symbol_6) (not (symbol_11)) (decrease (reward) 49.09))
				)
		)
	)

	(:action go_right_option-partition-1-87
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-88
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-89
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-90
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-91
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.528 (not (notfailed))
					0.472 (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-92
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-93
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-94
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-95
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.14900000000000002 (not (notfailed))
					0.851 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-96
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-97
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.17700000000000005 (not (notfailed))
					0.823 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-98
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-99
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-100
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.696 (not (notfailed))
					0.304 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-101
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-102
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-103
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-104
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.10699999999999998 (not (notfailed))
					0.893 (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-105
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-106
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-107
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-108
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.889 (not (notfailed))
					0.111 (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-109
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-110
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.08199999999999996 (not (notfailed))
					0.918 (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-111
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-112
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-113
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-114
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.732 (not (notfailed))
					0.268 (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-115
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.39 (not (notfailed))
					0.61 (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-116
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-117
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-118
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-119
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-120
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.657 (not (notfailed))
					0.343 (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-121
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.264 (not (notfailed))
					0.736 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-122
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.31899999999999995 (not (notfailed))
					0.681 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-123
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.476 (not (notfailed))
					0.524 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-124
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.813 (not (notfailed))
					0.187 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-125
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.11099999999999999 (not (notfailed))
					0.889 (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-126
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-127
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-128
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-129
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.45799999999999996 (not (notfailed))
					0.542 (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
				)
		)
	)

	(:action go_right_option-partition-1-130
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-131
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-2-132
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-133
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-134
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-135
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-136
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-137
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-138
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-139
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-140
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-141
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-142
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-143
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.09499999999999997 (not (notfailed))
					0.905 (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-144
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-145
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-146
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-147
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.09299999999999997 (not (notfailed))
					0.907 (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-148
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_15))
		:effect ((probabilistic 
					0.46199999999999997 (not (notfailed))
					0.538 (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-149
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-150
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-151
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_0))
		:effect ((probabilistic 
					0.06699999999999995 (not (notfailed))
					0.933 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-152
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_15))
		:effect ((probabilistic 
					0.05600000000000005 (not (notfailed))
					0.944 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-153
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-154
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-155
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.694 (not (notfailed))
					0.306 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-156
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-157
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.45699999999999996 (not (notfailed))
					0.543 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-158
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_15))
		:effect ((probabilistic 
					0.856 (not (notfailed))
					0.144 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-2-159
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.43000000000000005 (not (notfailed))
					0.57 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))
				)
		)
	)

	(:action go_right_option-partition-3-160
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-161
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-162
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-163
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-164
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect ((probabilistic 
					0.488 (not (notfailed))
					0.512 (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
				)
		)
	)

	(:action go_right_option-partition-3-165
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-166
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect ((probabilistic 
					0.88 (not (notfailed))
					0.12 (and (symbol_11) (decrease (reward) 32.82))
				)
		)
	)

	(:action go_right_option-partition-3-167
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.843 (not (notfailed))
					0.157 (and (symbol_11) (decrease (reward) 32.82))
				)
		)
	)

	(:action go_right_option-partition-4-168
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-4-169
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect ((probabilistic 
					0.511 (not (notfailed))
					0.489 (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))
				)
		)
	)

	(:action go_right_option-partition-4-170
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.15600000000000003 (not (notfailed))
					0.844 (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))
				)
		)
	)

	(:action go_right_option-partition-4-171
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-4-172
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect ((probabilistic 
					0.5840000000000001 (not (notfailed))
					0.416 (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
				)
		)
	)

	(:action go_right_option-partition-4-173
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-4-174
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-5-175
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-176
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-177
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-178
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.24 (not (notfailed))
					0.76 (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-179
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-180
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-181
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect ((probabilistic 
					0.07399999999999995 (not (notfailed))
					0.926 (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-182
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.522 (not (notfailed))
					0.478 (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-183
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-184
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-185
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect ((probabilistic 
					0.10199999999999998 (not (notfailed))
					0.898 (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-186
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect ((probabilistic 
					0.5920000000000001 (not (notfailed))
					0.408 (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-187
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect ((probabilistic 
					0.5449999999999999 (not (notfailed))
					0.455 (and (symbol_10) (not (symbol_28)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-5-188
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect ((probabilistic 
					0.6699999999999999 (not (notfailed))
					0.33 (and (symbol_10) (not (symbol_28)) (decrease (reward) 64.42))
				)
		)
	)

	(:action go_right_option-partition-6-189
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.525 (not (notfailed))
					0.475 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-190
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_0))
		:effect ((probabilistic 
					0.6779999999999999 (not (notfailed))
					0.322 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-191
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.10599999999999998 (not (notfailed))
					0.894 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-192
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_0))
		:effect ((probabilistic 
					0.399 (not (notfailed))
					0.601 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-193
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.19899999999999995 (not (notfailed))
					0.801 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-194
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect ((probabilistic 
					0.8140000000000001 (not (notfailed))
					0.186 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 33.32))
				)
		)
	)

	(:action go_right_option-partition-6-195
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect ((probabilistic 
					0.722 (not (notfailed))
					0.278 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 33.32))
				)
		)
	)

	(:action up_ladder_option-partition-0-196
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-197
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-198
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-199
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect ((probabilistic 
					0.27 (not (notfailed))
					0.73 (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
				)
		)
	)

	(:action up_ladder_option-partition-1-200
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect ((probabilistic 
					0.33399999999999996 (not (notfailed))
					0.666 (and (symbol_16) (not (symbol_17)) (decrease (reward) 49.00))
				)
		)
	)

	(:action up_ladder_option-partition-1-201
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 49.00))
	)

	(:action up_ladder_option-partition-1-202
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_16) (not (symbol_27)) (decrease (reward) 49.00))
	)

	(:action up_ladder_option-partition-1-203
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect ((probabilistic 
					0.8089999999999999 (not (notfailed))
					0.191 (and (symbol_16) (not (symbol_17)) (decrease (reward) 49.00))
				)
		)
	)

	(:action up_ladder_option-partition-1-204
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect ((probabilistic 
					0.11499999999999999 (not (notfailed))
					0.885 (and (symbol_16) (not (symbol_18)) (decrease (reward) 49.00))
				)
		)
	)

	(:action up_ladder_option-partition-1-205
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect ((probabilistic 
					0.19599999999999995 (not (notfailed))
					0.804 (and (symbol_16) (not (symbol_27)) (decrease (reward) 49.00))
				)
		)
	)

	(:action up_ladder_option-partition-2-206
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-207
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-208
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-209
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect ((probabilistic 
					0.256 (not (notfailed))
					0.744 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-210
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-211
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-212
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect ((probabilistic 
					0.08099999999999996 (not (notfailed))
					0.919 (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-213
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect ((probabilistic 
					0.5569999999999999 (not (notfailed))
					0.443 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-214
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-215
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-216
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect ((probabilistic 
					0.10399999999999998 (not (notfailed))
					0.896 (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-217
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect ((probabilistic 
					0.61 (not (notfailed))
					0.39 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-218
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect ((probabilistic 
					0.5409999999999999 (not (notfailed))
					0.459 (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
				)
		)
	)

	(:action up_ladder_option-partition-2-219
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect ((probabilistic 
					0.681 (not (notfailed))
					0.319 (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
				)
		)
	)

	(:action down_ladder_option-partition-0-220
		:parameters ()
		:precondition (and (notfailed) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)) (decrease (reward) 17.37))
	)

	(:action down_ladder_option-partition-1-221
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-222
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-223
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-224
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect ((probabilistic 
					0.09999999999999998 (not (notfailed))
					0.9 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
				)
		)
	)

	(:action down_ladder_option-partition-1-225
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect ((probabilistic 
					0.15200000000000002 (not (notfailed))
					0.848 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
				)
		)
	)

	(:action down_ladder_option-partition-1-226
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect ((probabilistic 
					0.589 (not (notfailed))
					0.411 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
				)
		)
	)

	(:action down_ladder_option-partition-1-227
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-228
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-229
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-230
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-231
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect ((probabilistic 
					0.791 (not (notfailed))
					0.209 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
				)
		)
	)

	(:action down_ladder_option-partition-2-232
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect ((probabilistic 
					0.88 (not (notfailed))
					0.12 (and (symbol_19) (not (symbol_17)) (decrease (reward) 2.00))
				)
		)
	)

	(:action down_ladder_option-partition-2-233
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-234
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-235
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-236
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-237
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-238
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-239
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-240
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-241
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.43400000000000005 (not (notfailed))
					0.566 (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
				)
		)
	)

	(:action down_ladder_option-partition-2-242
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_19) (not (symbol_17)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-243
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-244
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-245
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-246
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-247
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-248
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-249
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-250
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-251
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action interact_option-partition-0-252
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.277 (not (notfailed))
					0.5595 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.1635 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-253
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.7738589211618258 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.22614107883817428 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-254
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_4))
		:effect ((probabilistic 
					0.7738589211618258 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.22614107883817428 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-0-255
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_4))
		:effect ((probabilistic 
					0.51 (not (notfailed))
					0.37919087136929464 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.1108091286307054 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-256
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.377 (not (notfailed))
					0.5023399209486166 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.12066007905138339 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-257
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.10799999999999998 (not (notfailed))
					0.7192411067193676 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1727588932806324 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-258
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.8063241106719368 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19367588932806323 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-259
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.8063241106719368 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19367588932806323 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-260
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24) (symbol_21))
		:effect ((probabilistic 
					0.839 (not (notfailed))
					0.12981818181818183 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.031181818181818182 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-261
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_21))
		:effect ((probabilistic 
					0.5329999999999999 (not (notfailed))
					0.3765533596837945 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.09044664031620553 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-262
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.8063241106719368 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19367588932806323 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-1-263
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_21))
		:effect ((probabilistic 
					0.20799999999999996 (not (notfailed))
					0.6386086956521739 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.15339130434782608 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-264
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.7931034482758621 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.20689655172413793 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-265
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_4))
		:effect ((probabilistic 
					0.7931034482758621 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.20689655172413793 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-2-266
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_4))
		:effect ((probabilistic 
					0.848 (not (notfailed))
					0.12055172413793104 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.03144827586206896 (and (symbol_4) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-267
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_21))
		:effect ((probabilistic 
					0.7983539094650206 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.20164609053497942 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-268
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_21))
		:effect ((probabilistic 
					0.7983539094650206 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.20164609053497942 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-269
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect ((probabilistic 
					0.482 (not (notfailed))
					0.41354732510288067 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.10445267489711935 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-270
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect ((probabilistic 
					0.7983539094650206 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.20164609053497942 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-3-271
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect ((probabilistic 
					0.14200000000000002 (not (notfailed))
					0.6849876543209876 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.17301234567901233 (and (symbol_21) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-4-272
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19) (symbol_12))
		:effect (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
	)

	(:action interact_option-partition-4-273
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24) (symbol_12))
		:effect ((probabilistic 
					0.14900000000000002 (not (notfailed))
					0.851 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
				)
		)
	)

	(:action interact_option-partition-4-274
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25) (symbol_12))
		:effect ((probabilistic 
					0.669 (not (notfailed))
					0.331 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
				)
		)
	)

	(:action down_left_option-partition-0-275
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect ((probabilistic 
					0.32699999999999996 (not (notfailed))
					0.673 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_9)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-276
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_16)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-277
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18))
		:effect (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_18)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-278
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect ((probabilistic 
					0.8220000000000001 (not (notfailed))
					0.178 (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_27)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-279
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect ((probabilistic 
					0.09199999999999997 (not (notfailed))
					0.908 (and (symbol_17) (symbol_10) (not (symbol_5)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-280
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_16)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-281
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_17) (symbol_10) (not (symbol_18)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-282
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect ((probabilistic 
					0.51 (not (notfailed))
					0.49 (and (symbol_17) (symbol_10) (not (symbol_14)) (not (symbol_16)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-283
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect ((probabilistic 
					0.42200000000000004 (not (notfailed))
					0.578 (and (symbol_17) (symbol_10) (not (symbol_16)) (not (symbol_26)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-284
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect ((probabilistic 
					0.512 (not (notfailed))
					0.488 (and (symbol_17) (symbol_10) (not (symbol_18)) (not (symbol_26)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-285
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect ((probabilistic 
					0.238 (not (notfailed))
					0.762 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_28)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-0-286
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_16)) (not (symbol_28)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-287
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect ((probabilistic 
					0.524 (not (notfailed))
					0.476 (and (symbol_17) (symbol_10) (not (symbol_18)) (not (symbol_28)) (decrease (reward) 35.48))
				)
		)
	)

	(:action down_left_option-partition-1-288
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect ((probabilistic 
					0.05800000000000005 (not (notfailed))
					0.942 (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 25.19))
				)
		)
	)

	(:action down_left_option-partition-2-289
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_24) (symbol_9) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (not (symbol_29)) (decrease (reward) 24.71))
	)

	(:action down_left_option-partition-3-290
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_19) (symbol_10) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_26)) (not (symbol_28)) (decrease (reward) 24.84))
	)

	(:action down_left_option-partition-4-291
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_17)) (decrease (reward) 23.44))
	)

	(:action down_left_option-partition-4-292
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_29)) (decrease (reward) 23.44))
	)

	(:action down_left_option-partition-4-293
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect ((probabilistic 
					0.08799999999999997 (not (notfailed))
					0.912 (and (symbol_25) (symbol_26) (not (symbol_17)) (decrease (reward) 23.44))
				)
		)
	)

	(:action down_left_option-partition-4-294
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect ((probabilistic 
					0.18899999999999995 (not (notfailed))
					0.811 (and (symbol_25) (symbol_26) (not (symbol_29)) (decrease (reward) 23.44))
				)
		)
	)

	(:action down_right_option-partition-0-295
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_18)) (decrease (reward) 35.25))
	)

	(:action down_right_option-partition-0-296
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect ((probabilistic 
					0.45099999999999996 (not (notfailed))
					0.549 (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_27)) (decrease (reward) 35.25))
				)
		)
	)

	(:action down_right_option-partition-0-297
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect ((probabilistic 
					0.06299999999999994 (not (notfailed))
					0.937 (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_18)) (decrease (reward) 35.25))
				)
		)
	)

	(:action down_right_option-partition-0-298
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect ((probabilistic 
					0.579 (not (notfailed))
					0.421 (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_27)) (decrease (reward) 35.25))
				)
		)
	)

	(:action down_right_option-partition-0-299
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect ((probabilistic 
					0.18300000000000005 (not (notfailed))
					0.817 (and (symbol_17) (symbol_14) (not (symbol_18)) (decrease (reward) 35.25))
				)
		)
	)

	(:action down_right_option-partition-0-300
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect ((probabilistic 
					0.882 (not (notfailed))
					0.118 (and (symbol_17) (symbol_14) (not (symbol_27)) (decrease (reward) 35.25))
				)
		)
	)

	(:action down_right_option-partition-1-301
		:parameters ()
		:precondition (and (notfailed) (symbol_28))
		:effect ((probabilistic 
					0.06000000000000005 (not (notfailed))
					0.94 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_16)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_27)) (not (symbol_28)) (not (symbol_29)) (decrease (reward) 24.94))
				)
		)
	)

	(:action jump_left_option-partition-0-302
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_10)) (not (symbol_17)) (decrease (reward) 38.47))
	)

	(:action jump_left_option-partition-0-303
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect ((probabilistic 
					0.06999999999999995 (not (notfailed))
					0.93 (and (symbol_27) (symbol_28) (not (symbol_10)) (not (symbol_29)) (decrease (reward) 38.47))
				)
		)
	)

	(:action jump_left_option-partition-0-304
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_17)) (decrease (reward) 38.47))
	)

	(:action jump_left_option-partition-0-305
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect ((probabilistic 
					0.07199999999999995 (not (notfailed))
					0.928 (and (symbol_27) (symbol_28) (not (symbol_29)) (decrease (reward) 38.47))
				)
		)
	)

	(:action jump_left_option-partition-1-306
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect ((probabilistic 
					0.07099999999999995 (not (notfailed))
					0.6704314115308151 (and (symbol_18) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 37.00))
					0.2585685884691849 (and (symbol_17) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 62.60))
				)
		)
	)

	(:action jump_right_option-partition-0-307
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect ((probabilistic 
					0.06699999999999995 (not (notfailed))
					0.7524847826086957 (and (symbol_18) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 36.62))
					0.18051521739130436 (and (symbol_17) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 62.78))
				)
		)
	)

	(:action jump_right_option-partition-1-308
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_27) (symbol_28) (not (symbol_5)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_29)) (decrease (reward) 38.20))
	)

	(:action jump_right_option-partition-2-309
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect ((probabilistic 
					0.786 (not (notfailed))
					0.214 (and (symbol_24) (symbol_9) (not (symbol_6)) (not (symbol_19)) (decrease (reward) 38.21))
				)
		)
	)

	(:action jump_right_option-partition-2-310
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-2-311
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_10)) (not (symbol_19)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-2-312
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect ((probabilistic 
					0.06899999999999995 (not (notfailed))
					0.931 (and (symbol_24) (symbol_9) (not (symbol_14)) (not (symbol_19)) (decrease (reward) 38.21))
				)
		)
	)

	(:action jump_right_option-partition-2-313
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect ((probabilistic 
					0.508 (not (notfailed))
					0.492 (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_26)) (decrease (reward) 38.21))
				)
		)
	)

	(:action jump_right_option-partition-2-314
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_28)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-3-315
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_25) (symbol_26) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_28)) (decrease (reward) 38.44))
	)

	(:action jump_right_option-partition-4-316
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_23))
		:effect (and (symbol_29) (symbol_8) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (decrease (reward) 28.30))
	)
)