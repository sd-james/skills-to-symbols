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
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-3
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-6
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-7
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-8
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-9
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_12))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-10
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_23))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-11
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_2))
		:effect (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-12
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_12))
		:effect (probabilistic
					0.44 (not (notfailed))
					0.56 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-13
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25) (symbol_23))
		:effect (probabilistic
					0.36 (not (notfailed))
					0.64 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-14
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_12))
		:effect (probabilistic
					0.6 (not (notfailed))
					0.4 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-15
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_23))
		:effect (probabilistic
					0.76 (not (notfailed))
					0.24 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-16
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_2))
		:effect (probabilistic
					0.09 (not (notfailed))
					0.91 (and (symbol_7) (not (symbol_6)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-17
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-18
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-19
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-20
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-21
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-22
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-23
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_2))
		:effect (probabilistic
					0.53 (not (notfailed))
					0.47 (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-24
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-25
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-26
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-27
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-28
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-29
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-30
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-31
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-32
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-33
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-34
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-35
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_2))
		:effect (probabilistic
					0.22 (not (notfailed))
					0.78 (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-36
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-37
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-38
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_2))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-39
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_12))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-40
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_23))
		:effect (and (symbol_7) (not (symbol_11)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-41
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_2))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-42
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_12))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-43
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_23))
		:effect (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))
	)

	(:action go_left_option-partition-0-44
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_2))
		:effect (probabilistic
					0.06 (not (notfailed))
					0.94 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-45
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_12))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-46
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19) (symbol_23))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-47
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_2))
		:effect (probabilistic
					0.3 (not (notfailed))
					0.7 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-48
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_12))
		:effect (probabilistic
					0.7 (not (notfailed))
					0.3 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-49
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_23))
		:effect (probabilistic
					0.73 (not (notfailed))
					0.27 (and (symbol_7) (not (symbol_14)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-50
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_2))
		:effect (probabilistic
					0.47 (not (notfailed))
					0.53 (and (symbol_7) (not (symbol_28)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-51
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_12))
		:effect (probabilistic
					0.46 (not (notfailed))
					0.54 (and (symbol_7) (not (symbol_28)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-0-52
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_23))
		:effect (probabilistic
					0.39 (not (notfailed))
					0.61 (and (symbol_7) (not (symbol_28)) (decrease (reward) 49.00))

		)
	)

	(:action go_left_option-partition-1-53
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-54
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-55
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_9)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-56
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.13 (not (notfailed))
					0.87 (and (symbol_6) (not (symbol_9)) (decrease (reward) 97.00))

		)
	)

	(:action go_left_option-partition-1-57
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_21))
		:effect (probabilistic
					0.21 (not (notfailed))
					0.79 (and (symbol_6) (not (symbol_10)) (decrease (reward) 97.00))

		)
	)

	(:action go_left_option-partition-1-58
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.7 (not (notfailed))
					0.3 (and (symbol_6) (not (symbol_10)) (decrease (reward) 97.00))

		)
	)

	(:action go_left_option-partition-1-59
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-60
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_13)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-61
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-62
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_21))
		:effect (and (symbol_6) (not (symbol_26)) (decrease (reward) 97.00))
	)

	(:action go_left_option-partition-1-63
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_21))
		:effect (probabilistic
					0.87 (not (notfailed))
					0.13 (and (symbol_6) (not (symbol_28)) (decrease (reward) 97.00))

		)
	)

	(:action go_left_option-partition-2-64
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_19))
		:effect (and (symbol_8) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-65
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (and (symbol_8) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-66
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25))
		:effect (probabilistic
					0.21 (not (notfailed))
					0.79 (and (symbol_8) (decrease (reward) 32.66))

		)
	)

	(:action go_left_option-partition-2-67
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (probabilistic
					0.81 (not (notfailed))
					0.19 (and (symbol_8) (not (symbol_9)) (decrease (reward) 32.66))

		)
	)

	(:action go_left_option-partition-2-68
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-69
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-70
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-71
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_19))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-72
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-73
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-74
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29))
		:effect (and (symbol_8) (not (symbol_13)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-75
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_8) (not (symbol_26)) (decrease (reward) 32.66))
	)

	(:action go_left_option-partition-2-76
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_8) (not (symbol_26)) (decrease (reward) 32.66))

		)
	)

	(:action go_left_option-partition-3-77
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_4))
		:effect (probabilistic
					0.18 (not (notfailed))
					0.82 (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))

		)
	)

	(:action go_left_option-partition-3-78
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))
	)

	(:action go_left_option-partition-3-79
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)) (decrease (reward) 32.32))
	)

	(:action go_left_option-partition-3-80
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_4))
		:effect (probabilistic
					0.65 (not (notfailed))
					0.35 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))

		)
	)

	(:action go_left_option-partition-3-81
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (probabilistic
					0.17 (not (notfailed))
					0.83 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))

		)
	)

	(:action go_left_option-partition-3-82
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_4))
		:effect (probabilistic
					0.19 (not (notfailed))
					0.81 (and (symbol_9) (not (symbol_26)) (decrease (reward) 32.32))

		)
	)

	(:action go_left_option-partition-4-83
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_10) (not (symbol_8)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-84
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_10) (not (symbol_8)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-85
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_10) (not (symbol_9)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-86
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (probabilistic
					0.64 (not (notfailed))
					0.36 (and (symbol_10) (not (symbol_9)) (decrease (reward) 80.84))

		)
	)

	(:action go_left_option-partition-4-87
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17))
		:effect (and (symbol_10) (not (symbol_13)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-88
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27))
		:effect (probabilistic
					0.57 (not (notfailed))
					0.43 (and (symbol_10) (not (symbol_13)) (decrease (reward) 80.84))

		)
	)

	(:action go_left_option-partition-4-89
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_10) (not (symbol_26)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-4-90
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_10) (not (symbol_26)) (decrease (reward) 80.84))
	)

	(:action go_left_option-partition-5-91
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-92
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-93
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-94
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-95
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_11) (not (symbol_6)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-96
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-97
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-98
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-99
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (probabilistic
					0.19 (not (notfailed))
					0.81 (and (symbol_11) (not (symbol_10)) (decrease (reward) 32.62))

		)
	)

	(:action go_left_option-partition-5-100
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (probabilistic
					0.89 (not (notfailed))
					0.11 (and (symbol_11) (decrease (reward) 32.62))

		)
	)

	(:action go_left_option-partition-5-101
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (probabilistic
					0.8 (not (notfailed))
					0.2 (and (symbol_11) (decrease (reward) 32.62))

		)
	)

	(:action go_left_option-partition-5-102
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-103
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-104
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-105
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-106
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_11) (not (symbol_14)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-107
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (probabilistic
					0.18 (not (notfailed))
					0.82 (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))

		)
	)

	(:action go_left_option-partition-5-108
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-109
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-110
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-5-111
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_11) (not (symbol_28)) (decrease (reward) 32.62))
	)

	(:action go_left_option-partition-6-112
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_2))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 49.13))

		)
	)

	(:action go_left_option-partition-6-113
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_2))
		:effect (probabilistic
					0.57 (not (notfailed))
					0.43 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 49.13))

		)
	)

	(:action go_left_option-partition-6-114
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_2))
		:effect (probabilistic
					0.59 (not (notfailed))
					0.41 (and (symbol_12) (symbol_7) (not (symbol_2)) (decrease (reward) 49.13))

		)
	)

	(:action go_left_option-partition-6-115
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_2))
		:effect (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_11)) (decrease (reward) 49.13))
	)

	(:action go_left_option-partition-6-116
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_2))
		:effect (probabilistic
					0.41 (not (notfailed))
					0.59 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_11)) (decrease (reward) 49.13))

		)
	)

	(:action go_left_option-partition-6-117
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_2))
		:effect (probabilistic
					0.43 (not (notfailed))
					0.57 (and (symbol_12) (symbol_7) (not (symbol_2)) (not (symbol_14)) (decrease (reward) 49.13))

		)
	)

	(:action go_right_option-partition-0-118
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-119
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-120
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18))
		:effect (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))
	)

	(:action go_right_option-partition-0-121
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (probabilistic
					0.53 (not (notfailed))
					0.47 (and (symbol_6) (not (symbol_7)) (decrease (reward) 49.09))

		)
	)

	(:action go_right_option-partition-0-122
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (probabilistic
					0.82 (not (notfailed))
					0.18 (and (symbol_6) (not (symbol_11)) (decrease (reward) 49.09))

		)
	)

	(:action go_right_option-partition-0-123
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (probabilistic
					0.9 (not (notfailed))
					0.1 (and (symbol_6) (not (symbol_11)) (decrease (reward) 49.09))

		)
	)

	(:action go_right_option-partition-1-124
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-125
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-126
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-127
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-128
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_21))
		:effect (probabilistic
					0.53 (not (notfailed))
					0.47 (and (symbol_8) (not (symbol_6)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-129
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-130
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-131
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-132
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_4))
		:effect (probabilistic
					0.14 (not (notfailed))
					0.86 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-133
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-134
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.9 (not (notfailed))
					0.1 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-135
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_21))
		:effect (probabilistic
					0.17 (not (notfailed))
					0.83 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-136
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-137
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-138
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_4))
		:effect (probabilistic
					0.7 (not (notfailed))
					0.3 (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-139
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-140
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-141
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-142
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.11 (not (notfailed))
					0.89 (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-143
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-144
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-145
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-146
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_4))
		:effect (probabilistic
					0.89 (not (notfailed))
					0.11 (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-147
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-148
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-149
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-150
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-151
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-152
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29) (symbol_21))
		:effect (probabilistic
					0.72 (not (notfailed))
					0.28 (and (symbol_8) (not (symbol_11)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-153
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_4))
		:effect (probabilistic
					0.38 (not (notfailed))
					0.62 (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-154
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-155
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-156
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-157
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-158
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29) (symbol_21))
		:effect (probabilistic
					0.67 (not (notfailed))
					0.33 (and (symbol_8) (not (symbol_14)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-159
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16) (symbol_4))
		:effect (probabilistic
					0.25 (not (notfailed))
					0.75 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-160
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (probabilistic
					0.31 (not (notfailed))
					0.69 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-161
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_21))
		:effect (probabilistic
					0.48 (not (notfailed))
					0.52 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-162
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_21))
		:effect (probabilistic
					0.82 (not (notfailed))
					0.18 (and (symbol_8) (not (symbol_26)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-163
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_4))
		:effect (probabilistic
					0.11 (not (notfailed))
					0.89 (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-164
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-165
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-166
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-167
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_4))
		:effect (probabilistic
					0.44 (not (notfailed))
					0.56 (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))

		)
	)

	(:action go_right_option-partition-1-168
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-1-169
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)) (decrease (reward) 33.07))
	)

	(:action go_right_option-partition-2-170
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-171
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-172
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-173
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-174
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-175
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-176
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_8)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-177
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-178
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-179
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-180
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-181
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-182
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_9)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-183
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-184
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-185
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.06 (not (notfailed))
					0.94 (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-186
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_15))
		:effect (probabilistic
					0.55 (not (notfailed))
					0.45 (and (symbol_13) (not (symbol_10)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-187
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-188
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-189
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_0))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-190
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_15))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-191
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_0))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-192
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-193
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.72 (not (notfailed))
					0.28 (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-194
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_15))
		:effect (and (symbol_13) (not (symbol_26)) (decrease (reward) 32.12))
	)

	(:action go_right_option-partition-2-195
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_0))
		:effect (probabilistic
					0.43 (not (notfailed))
					0.57 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-196
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_15))
		:effect (probabilistic
					0.67 (not (notfailed))
					0.33 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-2-197
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.35 (not (notfailed))
					0.65 (and (symbol_13) (not (symbol_28)) (decrease (reward) 32.12))

		)
	)

	(:action go_right_option-partition-3-198
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-199
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-200
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-201
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-202
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (probabilistic
					0.5 (not (notfailed))
					0.5 (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))

		)
	)

	(:action go_right_option-partition-3-203
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_11) (not (symbol_7)) (decrease (reward) 32.82))
	)

	(:action go_right_option-partition-3-204
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (probabilistic
					0.88 (not (notfailed))
					0.12 (and (symbol_11) (decrease (reward) 32.82))

		)
	)

	(:action go_right_option-partition-3-205
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (probabilistic
					0.84 (not (notfailed))
					0.16 (and (symbol_11) (decrease (reward) 32.82))

		)
	)

	(:action go_right_option-partition-4-206
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (probabilistic
					0.1 (not (notfailed))
					0.9 (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))

		)
	)

	(:action go_right_option-partition-4-207
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (probabilistic
					0.69 (not (notfailed))
					0.31 (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))

		)
	)

	(:action go_right_option-partition-4-208
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (probabilistic
					0.31 (not (notfailed))
					0.69 (and (symbol_14) (not (symbol_6)) (decrease (reward) 32.36))

		)
	)

	(:action go_right_option-partition-4-209
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-4-210
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (probabilistic
					0.73 (not (notfailed))
					0.27 (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))

		)
	)

	(:action go_right_option-partition-4-211
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (probabilistic
					0.13 (not (notfailed))
					0.87 (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))

		)
	)

	(:action go_right_option-partition-4-212
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_14) (not (symbol_11)) (decrease (reward) 32.36))
	)

	(:action go_right_option-partition-5-213
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-214
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-215
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-216
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (probabilistic
					0.25 (not (notfailed))
					0.75 (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-217
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-218
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-219
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-220
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (probabilistic
					0.54 (not (notfailed))
					0.46 (and (symbol_10) (not (symbol_11)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-221
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-222
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))
	)

	(:action go_right_option-partition-5-223
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (probabilistic
					0.1 (not (notfailed))
					0.9 (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-224
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (probabilistic
					0.61 (not (notfailed))
					0.39 (and (symbol_10) (not (symbol_14)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-225
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (probabilistic
					0.54 (not (notfailed))
					0.46 (and (symbol_10) (not (symbol_28)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-5-226
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (probabilistic
					0.68 (not (notfailed))
					0.32 (and (symbol_10) (not (symbol_28)) (decrease (reward) 64.42))

		)
	)

	(:action go_right_option-partition-6-227
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (probabilistic
					0.54 (not (notfailed))
					0.46 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-228
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_0))
		:effect (probabilistic
					0.65 (not (notfailed))
					0.35 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-229
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-230
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_0))
		:effect (probabilistic
					0.34 (not (notfailed))
					0.66 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-231
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.18 (not (notfailed))
					0.82 (and (symbol_15) (symbol_13) (not (symbol_0)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-232
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (probabilistic
					0.8 (not (notfailed))
					0.2 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 33.32))

		)
	)

	(:action go_right_option-partition-6-233
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect (probabilistic
					0.71 (not (notfailed))
					0.29 (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_26)) (decrease (reward) 33.32))

		)
	)

	(:action up_ladder_option-partition-0-234
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-235
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-236
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))
	)

	(:action up_ladder_option-partition-0-237
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (probabilistic
					0.36 (not (notfailed))
					0.64 (and (symbol_5) (not (symbol_16)) (decrease (reward) 17.20))

		)
	)

	(:action up_ladder_option-partition-1-238
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (probabilistic
					0.39 (not (notfailed))
					0.61 (and (symbol_16) (not (symbol_17)) (decrease (reward) 49.00))

		)
	)

	(:action up_ladder_option-partition-1-239
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 49.00))
	)

	(:action up_ladder_option-partition-1-240
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_16) (not (symbol_27)) (decrease (reward) 49.00))
	)

	(:action up_ladder_option-partition-1-241
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (probabilistic
					0.85 (not (notfailed))
					0.15 (and (symbol_16) (not (symbol_17)) (decrease (reward) 49.00))

		)
	)

	(:action up_ladder_option-partition-1-242
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (probabilistic
					0.12 (not (notfailed))
					0.88 (and (symbol_16) (not (symbol_18)) (decrease (reward) 49.00))

		)
	)

	(:action up_ladder_option-partition-1-243
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (probabilistic
					0.21 (not (notfailed))
					0.78 (and (symbol_16) (not (symbol_27)) (decrease (reward) 49.00))

		)
	)

	(:action up_ladder_option-partition-2-244
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-245
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-246
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-247
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (probabilistic
					0.27 (not (notfailed))
					0.73 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-248
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-249
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-250
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (probabilistic
					0.08 (not (notfailed))
					0.92 (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-251
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (probabilistic
					0.56 (not (notfailed))
					0.44 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-252
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-253
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))
	)

	(:action up_ladder_option-partition-2-254
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (probabilistic
					0.11 (not (notfailed))
					0.89 (and (symbol_17) (not (symbol_25)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-255
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (probabilistic
					0.63 (not (notfailed))
					0.37 (and (symbol_17) (not (symbol_29)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-256
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (probabilistic
					0.56 (not (notfailed))
					0.44 (and (symbol_17) (not (symbol_19)) (decrease (reward) 80.56))

		)
	)

	(:action up_ladder_option-partition-2-257
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (probabilistic
					0.7 (not (notfailed))
					0.3 (and (symbol_17) (not (symbol_24)) (decrease (reward) 80.56))

		)
	)

	(:action down_ladder_option-partition-0-258
		:parameters ()
		:precondition (and (notfailed) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)) (decrease (reward) 17.37))
	)

	(:action down_ladder_option-partition-1-259
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-260
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-261
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-262
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (probabilistic
					0.1 (not (notfailed))
					0.9 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))

		)
	)

	(:action down_ladder_option-partition-1-263
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (probabilistic
					0.16 (not (notfailed))
					0.84 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))

		)
	)

	(:action down_ladder_option-partition-1-264
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect (probabilistic
					0.59 (not (notfailed))
					0.41 (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))

		)
	)

	(:action down_ladder_option-partition-1-265
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-266
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-267
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-268
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 48.23))
	)

	(:action down_ladder_option-partition-1-269
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (probabilistic
					0.79 (not (notfailed))
					0.21 (and (symbol_18) (not (symbol_5)) (decrease (reward) 48.23))

		)
	)

	(:action down_ladder_option-partition-2-270
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-271
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-272
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-273
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-274
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-275
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-276
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-277
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-278
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (probabilistic
					0.77 (not (notfailed))
					0.23 (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))

		)
	)

	(:action down_ladder_option-partition-2-279
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_19) (not (symbol_17)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-280
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-281
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-282
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-283
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-284
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-285
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-286
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-287
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-288
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)) (decrease (reward) 2.00))
	)

	(:action interact_option-partition-0-289
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_4))
		:effect (probabilistic
					0.28 (not (notfailed))
					0.56 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.16 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-0-290
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_4))
		:effect (probabilistic
					0.77 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.23 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-0-291
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_4))
		:effect (probabilistic
					0.77 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.23 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-0-292
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_4))
		:effect (probabilistic
					0.51 (not (notfailed))
					0.38 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.11 (and (symbol_3) (not (symbol_20)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-293
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5) (symbol_21))
		:effect (probabilistic
					0.39 (not (notfailed))
					0.49 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.12 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-294
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.12 (not (notfailed))
					0.71 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.17 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-295
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17) (symbol_21))
		:effect (probabilistic
					0.81 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-296
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18) (symbol_21))
		:effect (probabilistic
					0.81 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-297
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24) (symbol_21))
		:effect (probabilistic
					0.81 (not (notfailed))
					0.16 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.03 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-298
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_21))
		:effect (probabilistic
					0.48 (not (notfailed))
					0.41 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-299
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27) (symbol_21))
		:effect (probabilistic
					0.81 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.19 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-1-300
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_21))
		:effect (probabilistic
					0.18 (not (notfailed))
					0.66 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.16 (and (symbol_20) (not (symbol_3)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-2-301
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_4))
		:effect (probabilistic
					0.79 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.21 (and (symbol_4) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-2-302
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_4))
		:effect (probabilistic
					0.79 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.21 (and (symbol_4) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-2-303
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_4))
		:effect (probabilistic
					0.84 (not (notfailed))
					0.12 (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.03 (and (symbol_4) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-3-304
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5) (symbol_21))
		:effect (probabilistic
					0.8 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.2 (and (symbol_21) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-3-305
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16) (symbol_21))
		:effect (probabilistic
					0.8 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.2 (and (symbol_21) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-3-306
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (probabilistic
					0.52 (not (notfailed))
					0.38 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.1 (and (symbol_21) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-3-307
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (probabilistic
					0.8 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.2 (and (symbol_21) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-3-308
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (probabilistic
					0.16 (not (notfailed))
					0.67 (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)) (decrease (reward) 1.00))
					0.17 (and (symbol_21) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-4-309
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19) (symbol_12))
		:effect (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))
	)

	(:action interact_option-partition-4-310
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24) (symbol_12))
		:effect (probabilistic
					0.15 (not (notfailed))
					0.85 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))

		)
	)

	(:action interact_option-partition-4-311
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25) (symbol_12))
		:effect (probabilistic
					0.67 (not (notfailed))
					0.33 (and (symbol_22) (symbol_23) (not (symbol_1)) (not (symbol_12)) (decrease (reward) 1.00))

		)
	)

	(:action down_left_option-partition-0-312
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (probabilistic
					0.31 (not (notfailed))
					0.69 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_9)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-313
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_16)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-314
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18))
		:effect (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_18)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-315
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (probabilistic
					0.82 (not (notfailed))
					0.18 (and (symbol_17) (symbol_10) (not (symbol_9)) (not (symbol_27)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-316
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (probabilistic
					0.09 (not (notfailed))
					0.91 (and (symbol_17) (symbol_10) (not (symbol_5)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-317
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_16)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-318
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_17) (symbol_10) (not (symbol_18)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-319
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_16))
		:effect (probabilistic
					0.51 (not (notfailed))
					0.49 (and (symbol_17) (symbol_10) (not (symbol_14)) (not (symbol_16)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-320
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (probabilistic
					0.41 (not (notfailed))
					0.59 (and (symbol_17) (symbol_10) (not (symbol_16)) (not (symbol_26)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-321
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (probabilistic
					0.53 (not (notfailed))
					0.47 (and (symbol_17) (symbol_10) (not (symbol_18)) (not (symbol_26)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-322
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (probabilistic
					0.24 (not (notfailed))
					0.76 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_28)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-0-323
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (and (symbol_17) (symbol_10) (not (symbol_16)) (not (symbol_28)) (decrease (reward) 35.48))
	)

	(:action down_left_option-partition-0-324
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect (probabilistic
					0.51 (not (notfailed))
					0.49 (and (symbol_17) (symbol_10) (not (symbol_18)) (not (symbol_28)) (decrease (reward) 35.48))

		)
	)

	(:action down_left_option-partition-1-325
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (probabilistic
					0.06 (not (notfailed))
					0.94 (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 25.19))

		)
	)

	(:action down_left_option-partition-2-326
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_24) (symbol_9) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (not (symbol_29)) (decrease (reward) 24.71))
	)

	(:action down_left_option-partition-3-327
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_19) (symbol_10) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_26)) (not (symbol_28)) (decrease (reward) 24.84))
	)

	(:action down_left_option-partition-4-328
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_17)) (decrease (reward) 23.44))
	)

	(:action down_left_option-partition-4-329
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_29)) (decrease (reward) 23.44))
	)

	(:action down_left_option-partition-4-330
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (probabilistic
					0.09 (not (notfailed))
					0.91 (and (symbol_25) (symbol_26) (not (symbol_17)) (decrease (reward) 23.44))

		)
	)

	(:action down_left_option-partition-4-331
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect (probabilistic
					0.19 (not (notfailed))
					0.81 (and (symbol_25) (symbol_26) (not (symbol_29)) (decrease (reward) 23.44))

		)
	)

	(:action down_right_option-partition-0-332
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_18)) (decrease (reward) 35.25))
	)

	(:action down_right_option-partition-0-333
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (probabilistic
					0.45 (not (notfailed))
					0.55 (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_27)) (decrease (reward) 35.25))

		)
	)

	(:action down_right_option-partition-0-334
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (probabilistic
					0.06 (not (notfailed))
					0.94 (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_18)) (decrease (reward) 35.25))

		)
	)

	(:action down_right_option-partition-0-335
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (probabilistic
					0.57 (not (notfailed))
					0.43 (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_27)) (decrease (reward) 35.25))

		)
	)

	(:action down_right_option-partition-0-336
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect (probabilistic
					0.19 (not (notfailed))
					0.81 (and (symbol_17) (symbol_14) (not (symbol_18)) (decrease (reward) 35.25))

		)
	)

	(:action down_right_option-partition-0-337
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect (probabilistic
					0.88 (not (notfailed))
					0.12 (and (symbol_17) (symbol_14) (not (symbol_27)) (decrease (reward) 35.25))

		)
	)

	(:action down_right_option-partition-1-338
		:parameters ()
		:precondition (and (notfailed) (symbol_28))
		:effect (probabilistic
					0.06 (not (notfailed))
					0.94 (and (symbol_17) (symbol_10) (not (symbol_5)) (not (symbol_16)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_27)) (not (symbol_28)) (not (symbol_29)) (decrease (reward) 24.94))

		)
	)

	(:action jump_left_option-partition-0-339
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_10)) (not (symbol_17)) (decrease (reward) 38.47))
	)

	(:action jump_left_option-partition-0-340
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (probabilistic
					0.12 (not (notfailed))
					0.88 (and (symbol_27) (symbol_28) (not (symbol_10)) (not (symbol_29)) (decrease (reward) 38.47))

		)
	)

	(:action jump_left_option-partition-0-341
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_17)) (decrease (reward) 38.47))
	)

	(:action jump_left_option-partition-0-342
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (probabilistic
					0.12 (not (notfailed))
					0.88 (and (symbol_27) (symbol_28) (not (symbol_29)) (decrease (reward) 38.47))

		)
	)

	(:action jump_left_option-partition-1-343
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.67 (and (symbol_18) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 37.00))
					0.26 (and (symbol_17) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 62.60))

		)
	)

	(:action jump_right_option-partition-0-344
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.75 (and (symbol_18) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 36.62))
					0.18 (and (symbol_17) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)) (decrease (reward) 62.78))

		)
	)

	(:action jump_right_option-partition-1-345
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_27) (symbol_28) (not (symbol_5)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_29)) (decrease (reward) 38.20))
	)

	(:action jump_right_option-partition-2-346
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (probabilistic
					0.77 (not (notfailed))
					0.23 (and (symbol_24) (symbol_9) (not (symbol_6)) (not (symbol_19)) (decrease (reward) 38.21))

		)
	)

	(:action jump_right_option-partition-2-347
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-2-348
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_10)) (not (symbol_19)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-2-349
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (probabilistic
					0.07 (not (notfailed))
					0.93 (and (symbol_24) (symbol_9) (not (symbol_14)) (not (symbol_19)) (decrease (reward) 38.21))

		)
	)

	(:action jump_right_option-partition-2-350
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (probabilistic
					0.48 (not (notfailed))
					0.52 (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_26)) (decrease (reward) 38.21))

		)
	)

	(:action jump_right_option-partition-2-351
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_28)) (decrease (reward) 38.21))
	)

	(:action jump_right_option-partition-3-352
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_25) (symbol_26) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_28)) (decrease (reward) 38.44))
	)

	(:action jump_right_option-partition-4-353
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_23))
		:effect (and (symbol_29) (symbol_8) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (decrease (reward) 28.30))
	)
)