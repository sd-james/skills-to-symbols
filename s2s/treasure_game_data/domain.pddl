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
		:precondition (and (notfailed) (symbol_6) (symbol_7) (symbol_20))
		:effect (probabilistic 
					0.772 (not (notfailed))
					0.228 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_7) (symbol_28))
		:effect (probabilistic 
					0.071 (not (notfailed))
					0.929 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_9) (symbol_20))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-3
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_9) (symbol_28))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_11) (symbol_28))
		:effect (probabilistic 
					0.315 (not (notfailed))
					0.685 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12) (symbol_2))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-6
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12) (symbol_20))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-7
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12) (symbol_28))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-8
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13) (symbol_2))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-9
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13) (symbol_20))
		:effect (probabilistic 
					0.544 (not (notfailed))
					0.456 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-10
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13) (symbol_28))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-11
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15) (symbol_2))
		:effect (probabilistic 
					0.149 (not (notfailed))
					0.851 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-12
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15) (symbol_28))
		:effect (probabilistic 
					0.142 (not (notfailed))
					0.858 (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-13
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21) (symbol_2))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-14
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21) (symbol_20))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-15
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21) (symbol_28))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-16
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_2))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-17
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_20))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-18
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_28))
		:effect (and (symbol_29) (not (symbol_6)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-19
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_2))
		:effect (probabilistic 
					0.496 (not (notfailed))
					0.504 (and (symbol_29) (not (symbol_8)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-20
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_20))
		:effect (probabilistic 
					0.433 (not (notfailed))
					0.567 (and (symbol_29) (not (symbol_8)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-21
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_28))
		:effect (probabilistic 
					0.482 (not (notfailed))
					0.518 (and (symbol_29) (not (symbol_8)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-22
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9) (symbol_28))
		:effect (probabilistic 
					0.357 (not (notfailed))
					0.643 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-23
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12) (symbol_2))
		:effect (probabilistic 
					0.284 (not (notfailed))
					0.716 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-24
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12) (symbol_20))
		:effect (probabilistic 
					0.728 (not (notfailed))
					0.272 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-25
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12) (symbol_28))
		:effect (probabilistic 
					0.196 (not (notfailed))
					0.804 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-26
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_13) (symbol_28))
		:effect (probabilistic 
					0.862 (not (notfailed))
					0.138 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-27
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21) (symbol_2))
		:effect (probabilistic 
					0.073 (not (notfailed))
					0.927 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-28
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21) (symbol_20))
		:effect (probabilistic 
					0.083 (not (notfailed))
					0.917 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-29
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21) (symbol_28))
		:effect (probabilistic 
					0.052 (not (notfailed))
					0.948 (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-30
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_2))
		:effect (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-31
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_20))
		:effect (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-32
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_28))
		:effect (and (symbol_29) (not (symbol_17)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-33
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7) (symbol_2))
		:effect (probabilistic 
					0.426 (not (notfailed))
					0.574 (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-34
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-35
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-36
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9) (symbol_2))
		:effect (probabilistic 
					0.714 (not (notfailed))
					0.286 (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
			
		)
	)

	(:action go_left_option-partition-0-37
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-38
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-39
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-40
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-41
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-42
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-43
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-44
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-45
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-46
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-47
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-48
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-49
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-50
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-51
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-52
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-53
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-54
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_2))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-55
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_20))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-0-56
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_28))
		:effect (and (symbol_29) (not (symbol_26)) (decrease (reward) 48.59))
	)

	(:action go_left_option-partition-1-57
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5) (symbol_4))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-58
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5) (symbol_23))
		:effect (probabilistic 
					0.519 (not (notfailed))
					0.481 (and (symbol_6) (not (symbol_8)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-59
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_4))
		:effect (and (symbol_6) (not (symbol_8)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-60
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.783 (not (notfailed))
					0.217 (and (symbol_6) (not (symbol_8)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-61
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_4))
		:effect (and (symbol_6) (not (symbol_10)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-62
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_23))
		:effect (and (symbol_6) (not (symbol_10)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-63
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24) (symbol_4))
		:effect (and (symbol_6) (not (symbol_10)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-64
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24) (symbol_23))
		:effect (and (symbol_6) (not (symbol_10)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-65
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_4))
		:effect (probabilistic 
					0.077 (not (notfailed))
					0.923 (and (symbol_6) (not (symbol_14)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-66
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_23))
		:effect (and (symbol_6) (not (symbol_14)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-67
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.318 (not (notfailed))
					0.682 (and (symbol_6) (not (symbol_14)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-68
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24) (symbol_23))
		:effect (and (symbol_6) (not (symbol_14)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-69
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_5) (symbol_23))
		:effect (and (symbol_6) (not (symbol_16)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-70
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_24) (symbol_23))
		:effect (and (symbol_6) (not (symbol_16)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-71
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_5) (symbol_4))
		:effect (probabilistic 
					0.481 (not (notfailed))
					0.519 (and (symbol_6) (not (symbol_17)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-72
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.561 (not (notfailed))
					0.439 (and (symbol_6) (not (symbol_17)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-73
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_5) (symbol_4))
		:effect (and (symbol_6) (not (symbol_18)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-74
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_5) (symbol_23))
		:effect (and (symbol_6) (not (symbol_18)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-75
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_24) (symbol_4))
		:effect (and (symbol_6) (not (symbol_18)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-76
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.172 (not (notfailed))
					0.828 (and (symbol_6) (not (symbol_18)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-1-77
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_5) (symbol_23))
		:effect (and (symbol_6) (not (symbol_25)) (decrease (reward) 64.46))
	)

	(:action go_left_option-partition-1-78
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.055 (not (notfailed))
					0.945 (and (symbol_6) (not (symbol_25)) (decrease (reward) 64.46))
			
		)
	)

	(:action go_left_option-partition-2-79
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_21))
		:effect (probabilistic 
					0.866 (not (notfailed))
					0.134 (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.60))
			
		)
	)

	(:action go_left_option-partition-2-80
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_12))
		:effect (probabilistic 
					0.17 (not (notfailed))
					0.83 (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.60))
			
		)
	)

	(:action go_left_option-partition-2-81
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_21))
		:effect (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-82
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_12))
		:effect (and (symbol_16) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-83
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_13))
		:effect (probabilistic 
					0.244 (not (notfailed))
					0.756 (and (symbol_16) (decrease (reward) 32.60))
			
		)
	)

	(:action go_left_option-partition-2-84
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_21))
		:effect (and (symbol_16) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-85
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_5))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-86
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_9))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-87
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_12))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-88
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_13))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-89
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_15))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-90
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_21))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-2-91
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_24))
		:effect (and (symbol_16) (not (symbol_25)) (decrease (reward) 32.60))
	)

	(:action go_left_option-partition-3-92
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7) (symbol_4))
		:effect (probabilistic 
					0.254 (not (notfailed))
					0.746 (and (symbol_10) (not (symbol_14)) (decrease (reward) 32.27))
			
		)
	)

	(:action go_left_option-partition-3-93
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9) (symbol_4))
		:effect (probabilistic 
					0.252 (not (notfailed))
					0.748 (and (symbol_10) (not (symbol_14)) (decrease (reward) 32.27))
			
		)
	)

	(:action go_left_option-partition-3-94
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11) (symbol_4))
		:effect (probabilistic 
					0.644 (not (notfailed))
					0.356 (and (symbol_10) (not (symbol_14)) (decrease (reward) 32.27))
			
		)
	)

	(:action go_left_option-partition-3-95
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_7) (symbol_4))
		:effect (and (symbol_10) (not (symbol_16)) (decrease (reward) 32.27))
	)

	(:action go_left_option-partition-3-96
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_9) (symbol_4))
		:effect (and (symbol_10) (not (symbol_16)) (decrease (reward) 32.27))
	)

	(:action go_left_option-partition-3-97
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11) (symbol_4))
		:effect (probabilistic 
					0.122 (not (notfailed))
					0.878 (and (symbol_10) (not (symbol_16)) (decrease (reward) 32.27))
			
		)
	)

	(:action go_left_option-partition-4-98
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_11))
		:effect (and (symbol_26) (not (symbol_6)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-99
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12))
		:effect (and (symbol_26) (not (symbol_6)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-100
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13))
		:effect (and (symbol_26) (not (symbol_6)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-101
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15))
		:effect (and (symbol_26) (not (symbol_6)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-102
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21))
		:effect (and (symbol_26) (not (symbol_6)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-103
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_11))
		:effect (probabilistic 
					0.063 (not (notfailed))
					0.937 (and (symbol_26) (not (symbol_8)) (decrease (reward) 32.68))
			
		)
	)

	(:action go_left_option-partition-4-104
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_12))
		:effect (and (symbol_26) (not (symbol_8)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-105
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_13))
		:effect (and (symbol_26) (not (symbol_8)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-106
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_15))
		:effect (and (symbol_26) (not (symbol_8)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-107
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_21))
		:effect (and (symbol_26) (not (symbol_8)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-108
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7))
		:effect (probabilistic 
					0.874 (not (notfailed))
					0.126 (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
			
		)
	)

	(:action go_left_option-partition-4-109
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_11))
		:effect (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-110
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12))
		:effect (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-111
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_13))
		:effect (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-112
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_15))
		:effect (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-113
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21))
		:effect (and (symbol_26) (not (symbol_17)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-114
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_12))
		:effect (and (symbol_26) (not (symbol_18)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-115
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_13))
		:effect (and (symbol_26) (not (symbol_18)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-116
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_15))
		:effect (and (symbol_26) (not (symbol_18)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-117
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_21))
		:effect (and (symbol_26) (not (symbol_18)) (decrease (reward) 32.68))
	)

	(:action go_left_option-partition-4-118
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13))
		:effect (probabilistic 
					0.626 (not (notfailed))
					0.374 (and (symbol_26) (decrease (reward) 32.68))
			
		)
	)

	(:action go_left_option-partition-4-119
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (probabilistic 
					0.442 (not (notfailed))
					0.558 (and (symbol_26) (decrease (reward) 32.68))
			
		)
	)

	(:action go_left_option-partition-5-120
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7))
		:effect (probabilistic 
					0.601 (not (notfailed))
					0.399 (and (symbol_18) (not (symbol_10)) (decrease (reward) 15.60))
			
		)
	)

	(:action go_left_option-partition-5-121
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_11))
		:effect (and (symbol_18) (not (symbol_10)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-5-122
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7))
		:effect (and (symbol_18) (not (symbol_14)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-5-123
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11))
		:effect (and (symbol_18) (not (symbol_14)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-5-124
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_7))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-5-125
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11))
		:effect (and (symbol_18) (not (symbol_16)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-5-126
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_7))
		:effect (probabilistic 
					0.589 (not (notfailed))
					0.411 (and (symbol_18) (not (symbol_25)) (decrease (reward) 15.60))
			
		)
	)

	(:action go_left_option-partition-5-127
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_11))
		:effect (and (symbol_18) (not (symbol_25)) (decrease (reward) 15.60))
	)

	(:action go_left_option-partition-6-128
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_7) (symbol_2))
		:effect (probabilistic 
					0.528 (not (notfailed))
					0.472 (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_left_option-partition-6-129
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_9) (symbol_2))
		:effect (probabilistic 
					0.073 (not (notfailed))
					0.927 (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_6)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_left_option-partition-6-130
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7) (symbol_2))
		:effect (probabilistic 
					0.888 (not (notfailed))
					0.112 (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_17)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_left_option-partition-6-131
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9) (symbol_2))
		:effect (probabilistic 
					0.379 (not (notfailed))
					0.621 (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_17)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_left_option-partition-6-132
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7) (symbol_2))
		:effect (probabilistic 
					0.407 (not (notfailed))
					0.593 (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_26)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_left_option-partition-6-133
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9) (symbol_2))
		:effect (and (symbol_28) (symbol_29) (not (symbol_2)) (not (symbol_26)) (decrease (reward) 48.50))
	)

	(:action go_left_option-partition-6-134
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_9) (symbol_2))
		:effect (probabilistic 
					0.648 (not (notfailed))
					0.352 (and (symbol_28) (symbol_29) (not (symbol_2)) (decrease (reward) 48.50))
			
		)
	)

	(:action go_right_option-partition-0-135
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect (probabilistic 
					0.841 (not (notfailed))
					0.159 (and (symbol_6) (not (symbol_26)) (decrease (reward) 48.82))
			
		)
	)

	(:action go_right_option-partition-0-136
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_5))
		:effect (and (symbol_6) (not (symbol_29)) (decrease (reward) 48.82))
	)

	(:action go_right_option-partition-0-137
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_7))
		:effect (probabilistic 
					0.499 (not (notfailed))
					0.501 (and (symbol_6) (not (symbol_29)) (decrease (reward) 48.82))
			
		)
	)

	(:action go_right_option-partition-0-138
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_9))
		:effect (and (symbol_6) (not (symbol_29)) (decrease (reward) 48.82))
	)

	(:action go_right_option-partition-0-139
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_24))
		:effect (and (symbol_6) (not (symbol_29)) (decrease (reward) 48.82))
	)

	(:action go_right_option-partition-1-140
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_4))
		:effect (and (symbol_10) (not (symbol_6)) (decrease (reward) 64.18))
	)

	(:action go_right_option-partition-1-141
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.126 (not (notfailed))
					0.874 (and (symbol_10) (not (symbol_8)) (decrease (reward) 64.18))
			
		)
	)

	(:action go_right_option-partition-1-142
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_4))
		:effect (and (symbol_10) (not (symbol_17)) (decrease (reward) 64.18))
	)

	(:action go_right_option-partition-1-143
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.865 (not (notfailed))
					0.135 (and (symbol_10) (not (symbol_18)) (decrease (reward) 64.18))
			
		)
	)

	(:action go_right_option-partition-1-144
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.12 (not (notfailed))
					0.88 (and (symbol_10) (not (symbol_26)) (decrease (reward) 64.18))
			
		)
	)

	(:action go_right_option-partition-2-145
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_6)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-146
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_6)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-147
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_11) (symbol_23))
		:effect (and (symbol_16) (not (symbol_6)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-148
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24) (symbol_23))
		:effect (and (symbol_16) (not (symbol_6)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-149
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_8)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-150
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_9) (symbol_4))
		:effect (probabilistic 
					0.875 (not (notfailed))
					0.125 (and (symbol_16) (not (symbol_8)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-151
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_8)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-152
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_11) (symbol_23))
		:effect (and (symbol_16) (not (symbol_8)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-153
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24) (symbol_23))
		:effect (and (symbol_16) (not (symbol_8)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-154
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7) (symbol_4))
		:effect (probabilistic 
					0.295 (not (notfailed))
					0.705 (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-155
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-156
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_9) (symbol_4))
		:effect (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-157
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-158
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_11) (symbol_23))
		:effect (probabilistic 
					0.253 (not (notfailed))
					0.747 (and (symbol_16) (not (symbol_10)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-159
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7) (symbol_4))
		:effect (probabilistic 
					0.807 (not (notfailed))
					0.193 (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-160
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7) (symbol_23))
		:effect (probabilistic 
					0.77 (not (notfailed))
					0.23 (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-161
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9) (symbol_4))
		:effect (probabilistic 
					0.207 (not (notfailed))
					0.793 (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-162
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9) (symbol_23))
		:effect (probabilistic 
					0.385 (not (notfailed))
					0.615 (and (symbol_16) (not (symbol_14)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-163
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_17)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-164
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_17)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-165
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_11) (symbol_23))
		:effect (and (symbol_16) (not (symbol_17)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-166
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24) (symbol_23))
		:effect (and (symbol_16) (not (symbol_17)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-167
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_7) (symbol_4))
		:effect (probabilistic 
					0.745 (not (notfailed))
					0.255 (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-168
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-169
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_9) (symbol_4))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-170
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-171
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_11) (symbol_23))
		:effect (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-172
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.144 (not (notfailed))
					0.856 (and (symbol_16) (not (symbol_18)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-173
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_26)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-174
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_26)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-175
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11) (symbol_23))
		:effect (and (symbol_16) (not (symbol_26)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-176
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.074 (not (notfailed))
					0.926 (and (symbol_16) (not (symbol_26)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-2-177
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_7) (symbol_23))
		:effect (and (symbol_16) (not (symbol_29)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-178
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_9) (symbol_23))
		:effect (and (symbol_16) (not (symbol_29)) (decrease (reward) 32.95))
	)

	(:action go_right_option-partition-2-179
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_11) (symbol_23))
		:effect (probabilistic 
					0.213 (not (notfailed))
					0.787 (and (symbol_16) (not (symbol_29)) (decrease (reward) 32.95))
			
		)
	)

	(:action go_right_option-partition-3-180
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_11) (symbol_0))
		:effect (probabilistic 
					0.713 (not (notfailed))
					0.287 (and (symbol_25) (not (symbol_8)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-181
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_11) (symbol_27))
		:effect (probabilistic 
					0.879 (not (notfailed))
					0.121 (and (symbol_25) (not (symbol_8)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-182
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.394 (not (notfailed))
					0.606 (and (symbol_25) (not (symbol_8)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-183
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7) (symbol_0))
		:effect (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-184
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7) (symbol_27))
		:effect (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-185
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_11) (symbol_0))
		:effect (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-186
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_11) (symbol_27))
		:effect (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-187
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.067 (not (notfailed))
					0.933 (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-188
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_15) (symbol_27))
		:effect (and (symbol_25) (not (symbol_10)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-189
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7) (symbol_0))
		:effect (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-190
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7) (symbol_27))
		:effect (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-191
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9) (symbol_0))
		:effect (probabilistic 
					0.093 (not (notfailed))
					0.907 (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-192
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9) (symbol_27))
		:effect (probabilistic 
					0.085 (not (notfailed))
					0.915 (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-193
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11) (symbol_0))
		:effect (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-194
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11) (symbol_27))
		:effect (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-195
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.634 (not (notfailed))
					0.366 (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-196
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_15) (symbol_27))
		:effect (and (symbol_25) (not (symbol_14)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-197
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_7) (symbol_0))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-198
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_7) (symbol_27))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-199
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_9) (symbol_0))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-200
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_9) (symbol_27))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-201
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11) (symbol_0))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-202
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11) (symbol_27))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-203
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_15) (symbol_27))
		:effect (and (symbol_25) (not (symbol_16)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-204
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_11) (symbol_0))
		:effect (and (symbol_25) (not (symbol_18)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-205
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_11) (symbol_27))
		:effect (and (symbol_25) (not (symbol_18)) (decrease (reward) 32.39))
	)

	(:action go_right_option-partition-3-206
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.052 (not (notfailed))
					0.948 (and (symbol_25) (not (symbol_18)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-3-207
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_15) (symbol_27))
		:effect (probabilistic 
					0.574 (not (notfailed))
					0.426 (and (symbol_25) (not (symbol_18)) (decrease (reward) 32.39))
			
		)
	)

	(:action go_right_option-partition-4-208
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_7))
		:effect (probabilistic 
					0.652 (not (notfailed))
					0.348 (and (symbol_17) (not (symbol_6)) (decrease (reward) 32.42))
			
		)
	)

	(:action go_right_option-partition-4-209
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_11))
		:effect (probabilistic 
					0.099 (not (notfailed))
					0.901 (and (symbol_17) (not (symbol_6)) (decrease (reward) 32.42))
			
		)
	)

	(:action go_right_option-partition-4-210
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15))
		:effect (probabilistic 
					0.341 (not (notfailed))
					0.659 (and (symbol_17) (not (symbol_6)) (decrease (reward) 32.42))
			
		)
	)

	(:action go_right_option-partition-4-211
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7))
		:effect (probabilistic 
					0.104 (not (notfailed))
					0.896 (and (symbol_17) (not (symbol_26)) (decrease (reward) 32.42))
			
		)
	)

	(:action go_right_option-partition-4-212
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11))
		:effect (and (symbol_17) (not (symbol_26)) (decrease (reward) 32.42))
	)

	(:action go_right_option-partition-4-213
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13))
		:effect (probabilistic 
					0.725 (not (notfailed))
					0.275 (and (symbol_17) (not (symbol_26)) (decrease (reward) 32.42))
			
		)
	)

	(:action go_right_option-partition-4-214
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (and (symbol_17) (not (symbol_26)) (decrease (reward) 32.42))
	)

	(:action go_right_option-partition-5-215
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (probabilistic 
					0.882 (not (notfailed))
					0.118 (and (symbol_26) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-5-216
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_7))
		:effect (probabilistic 
					0.481 (not (notfailed))
					0.519 (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-5-217
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_11))
		:effect (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
	)

	(:action go_right_option-partition-5-218
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_12))
		:effect (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
	)

	(:action go_right_option-partition-5-219
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_13))
		:effect (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
	)

	(:action go_right_option-partition-5-220
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_15))
		:effect (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
	)

	(:action go_right_option-partition-5-221
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_21))
		:effect (and (symbol_26) (not (symbol_29)) (decrease (reward) 32.74))
	)

	(:action go_right_option-partition-6-222
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12))
		:effect (and (symbol_18) (not (symbol_6)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-223
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13))
		:effect (and (symbol_18) (not (symbol_6)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-224
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15))
		:effect (probabilistic 
					0.212 (not (notfailed))
					0.788 (and (symbol_18) (not (symbol_6)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-225
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21))
		:effect (and (symbol_18) (not (symbol_6)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-226
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_12))
		:effect (probabilistic 
					0.506 (not (notfailed))
					0.494 (and (symbol_18) (not (symbol_8)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-227
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_13))
		:effect (probabilistic 
					0.84 (not (notfailed))
					0.16 (and (symbol_18) (not (symbol_8)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-228
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_21))
		:effect (probabilistic 
					0.378 (not (notfailed))
					0.622 (and (symbol_18) (not (symbol_8)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-229
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12))
		:effect (and (symbol_18) (not (symbol_17)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-230
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_13))
		:effect (probabilistic 
					0.071 (not (notfailed))
					0.929 (and (symbol_18) (not (symbol_17)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-231
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_15))
		:effect (probabilistic 
					0.511 (not (notfailed))
					0.489 (and (symbol_18) (not (symbol_17)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-232
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21))
		:effect (and (symbol_18) (not (symbol_17)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-233
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12))
		:effect (and (symbol_18) (not (symbol_26)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-6-234
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13))
		:effect (probabilistic 
					0.058 (not (notfailed))
					0.942 (and (symbol_18) (not (symbol_26)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-235
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (probabilistic 
					0.463 (not (notfailed))
					0.537 (and (symbol_18) (not (symbol_26)) (decrease (reward) 64.04))
			
		)
	)

	(:action go_right_option-partition-6-236
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21))
		:effect (and (symbol_18) (not (symbol_26)) (decrease (reward) 64.04))
	)

	(:action go_right_option-partition-7-237
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11) (symbol_0))
		:effect (probabilistic 
					0.868 (not (notfailed))
					0.132 (and (symbol_27) (symbol_25) (not (symbol_0)) (not (symbol_14)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-238
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.825 (not (notfailed))
					0.175 (and (symbol_27) (symbol_25) (not (symbol_0)) (not (symbol_14)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-239
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11) (symbol_0))
		:effect (probabilistic 
					0.641 (not (notfailed))
					0.359 (and (symbol_27) (symbol_25) (not (symbol_0)) (not (symbol_16)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-240
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_13) (symbol_0))
		:effect (probabilistic 
					0.683 (not (notfailed))
					0.317 (and (symbol_27) (symbol_25) (not (symbol_0)) (not (symbol_16)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-241
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.111 (not (notfailed))
					0.889 (and (symbol_27) (symbol_25) (not (symbol_0)) (not (symbol_16)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-242
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_13) (symbol_0))
		:effect (probabilistic 
					0.315 (not (notfailed))
					0.685 (and (symbol_27) (symbol_25) (not (symbol_0)) (decrease (reward) 32.74))
			
		)
	)

	(:action go_right_option-partition-7-243
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_15) (symbol_0))
		:effect (probabilistic 
					0.167 (not (notfailed))
					0.833 (and (symbol_27) (symbol_25) (not (symbol_0)) (decrease (reward) 32.74))
			
		)
	)

	(:action up_ladder_option-partition-0-244
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_5) (not (symbol_24)) (decrease (reward) 17.38))
	)

	(:action up_ladder_option-partition-0-245
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (probabilistic 
					0.331 (not (notfailed))
					0.669 (and (symbol_5) (not (symbol_24)) (decrease (reward) 17.38))
			
		)
	)

	(:action up_ladder_option-partition-0-246
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_24))
		:effect (and (symbol_5) (not (symbol_24)) (decrease (reward) 17.38))
	)

	(:action up_ladder_option-partition-0-247
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect (and (symbol_5) (not (symbol_24)) (decrease (reward) 17.38))
	)

	(:action up_ladder_option-partition-1-248
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7))
		:effect (probabilistic 
					0.287 (not (notfailed))
					0.713 (and (symbol_24) (not (symbol_7)) (decrease (reward) 48.65))
			
		)
	)

	(:action up_ladder_option-partition-1-249
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9))
		:effect (probabilistic 
					0.174 (not (notfailed))
					0.826 (and (symbol_24) (not (symbol_9)) (decrease (reward) 48.65))
			
		)
	)

	(:action up_ladder_option-partition-1-250
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11))
		:effect (probabilistic 
					0.846 (not (notfailed))
					0.154 (and (symbol_24) (not (symbol_11)) (decrease (reward) 48.65))
			
		)
	)

	(:action up_ladder_option-partition-1-251
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_7))
		:effect (and (symbol_24) (not (symbol_7)) (decrease (reward) 48.65))
	)

	(:action up_ladder_option-partition-1-252
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_9))
		:effect (and (symbol_24) (not (symbol_9)) (decrease (reward) 48.65))
	)

	(:action up_ladder_option-partition-1-253
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11))
		:effect (probabilistic 
					0.305 (not (notfailed))
					0.695 (and (symbol_24) (not (symbol_11)) (decrease (reward) 48.65))
			
		)
	)

	(:action up_ladder_option-partition-2-254
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12))
		:effect (and (symbol_11) (not (symbol_12)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-255
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13))
		:effect (and (symbol_11) (not (symbol_13)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-256
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15))
		:effect (probabilistic 
					0.274 (not (notfailed))
					0.726 (and (symbol_11) (not (symbol_15)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-257
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21))
		:effect (and (symbol_11) (not (symbol_21)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-258
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_12))
		:effect (probabilistic 
					0.577 (not (notfailed))
					0.423 (and (symbol_11) (not (symbol_12)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-259
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_13))
		:effect (probabilistic 
					0.872 (not (notfailed))
					0.128 (and (symbol_11) (not (symbol_13)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-260
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_21))
		:effect (probabilistic 
					0.415 (not (notfailed))
					0.585 (and (symbol_11) (not (symbol_21)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-261
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12))
		:effect (and (symbol_11) (not (symbol_12)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-262
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_13))
		:effect (probabilistic 
					0.096 (not (notfailed))
					0.904 (and (symbol_11) (not (symbol_13)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-263
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_15))
		:effect (probabilistic 
					0.598 (not (notfailed))
					0.402 (and (symbol_11) (not (symbol_15)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-264
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21))
		:effect (and (symbol_11) (not (symbol_21)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-265
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12))
		:effect (and (symbol_11) (not (symbol_12)) (decrease (reward) 80.63))
	)

	(:action up_ladder_option-partition-2-266
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13))
		:effect (probabilistic 
					0.077 (not (notfailed))
					0.923 (and (symbol_11) (not (symbol_13)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-267
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (probabilistic 
					0.545 (not (notfailed))
					0.455 (and (symbol_11) (not (symbol_15)) (decrease (reward) 80.63))
			
		)
	)

	(:action up_ladder_option-partition-2-268
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21))
		:effect (and (symbol_11) (not (symbol_21)) (decrease (reward) 80.63))
	)

	(:action down_ladder_option-partition-0-269
		:parameters ()
		:precondition (and (notfailed) (symbol_5))
		:effect (and (symbol_24) (not (symbol_5)) (decrease (reward) 17.36))
	)

	(:action down_ladder_option-partition-1-270
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (probabilistic 
					0.089 (not (notfailed))
					0.911 (and (symbol_9) (not (symbol_5)) (decrease (reward) 48.54))
			
		)
	)

	(:action down_ladder_option-partition-1-271
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (probabilistic 
					0.598 (not (notfailed))
					0.402 (and (symbol_9) (not (symbol_24)) (decrease (reward) 48.54))
			
		)
	)

	(:action down_ladder_option-partition-1-272
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_5))
		:effect (and (symbol_9) (not (symbol_5)) (decrease (reward) 48.54))
	)

	(:action down_ladder_option-partition-1-273
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_24))
		:effect (and (symbol_9) (not (symbol_24)) (decrease (reward) 48.54))
	)

	(:action down_ladder_option-partition-1-274
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_5))
		:effect (and (symbol_9) (not (symbol_5)) (decrease (reward) 48.54))
	)

	(:action down_ladder_option-partition-1-275
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_24))
		:effect (and (symbol_9) (not (symbol_24)) (decrease (reward) 48.54))
	)

	(:action down_ladder_option-partition-2-276
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-277
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-278
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_15))
		:effect (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-279
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21))
		:effect (probabilistic 
					0.56 (not (notfailed))
					0.44 (and (symbol_21) (decrease (reward) 2.00))
			
		)
	)

	(:action down_ladder_option-partition-2-280
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-281
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-282
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_15))
		:effect (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-283
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-284
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-285
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_15))
		:effect (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-286
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-287
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-288
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_15))
		:effect (probabilistic 
					0.086 (not (notfailed))
					0.914 (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
			
		)
	)

	(:action down_ladder_option-partition-2-289
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_11))
		:effect (and (symbol_21) (not (symbol_11)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-290
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-291
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-292
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_15))
		:effect (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-293
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_21))
		:effect (probabilistic 
					0.216 (not (notfailed))
					0.784 (and (symbol_21) (decrease (reward) 2.00))
			
		)
	)

	(:action down_ladder_option-partition-2-294
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_12))
		:effect (and (symbol_21) (not (symbol_12)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-295
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_13))
		:effect (and (symbol_21) (not (symbol_13)) (decrease (reward) 2.00))
	)

	(:action down_ladder_option-partition-2-296
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_15))
		:effect (and (symbol_21) (not (symbol_15)) (decrease (reward) 2.00))
	)

	(:action interact_option-partition-0-297
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_4))
		:effect (probabilistic 
					0.883 (not (notfailed))
					0.094 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.023 (and (symbol_4) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-0-298
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_5) (symbol_4))
		:effect (probabilistic 
					0.801 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.199 (and (symbol_4) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-0-299
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.801 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.199 (and (symbol_4) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-1-300
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_5) (symbol_23))
		:effect (probabilistic 
					0.792 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.208 (and (symbol_23) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-1-301
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_7) (symbol_23))
		:effect (probabilistic 
					0.162 (not (notfailed))
					0.664 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.174 (and (symbol_23) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-1-302
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_9) (symbol_23))
		:effect (probabilistic 
					0.792 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.208 (and (symbol_23) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-1-303
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_11) (symbol_23))
		:effect (probabilistic 
					0.492 (not (notfailed))
					0.403 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.105 (and (symbol_23) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-1-304
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.792 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.208 (and (symbol_23) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-305
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_5) (symbol_23))
		:effect (probabilistic 
					0.386 (not (notfailed))
					0.509 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.105 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-306
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_7) (symbol_23))
		:effect (probabilistic 
					0.829 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.171 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-307
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_9) (symbol_23))
		:effect (probabilistic 
					0.829 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.171 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-308
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_11) (symbol_23))
		:effect (probabilistic 
					0.829 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.171 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-309
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_12) (symbol_23))
		:effect (probabilistic 
					0.843 (not (notfailed))
					0.13 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.027 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-310
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_13) (symbol_23))
		:effect (probabilistic 
					0.544 (not (notfailed))
					0.378 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.078 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-311
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_15) (symbol_23))
		:effect (probabilistic 
					0.225 (not (notfailed))
					0.642 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.133 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-2-312
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_24) (symbol_23))
		:effect (probabilistic 
					0.111 (not (notfailed))
					0.737 (and (symbol_3) (symbol_4) (not (symbol_22)) (not (symbol_23)) (decrease (reward) 1.00))
					0.152 (and (symbol_22) (not (symbol_3)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-3-313
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_5) (symbol_4))
		:effect (probabilistic 
					0.289 (not (notfailed))
					0.568 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.143 (and (symbol_3) (not (symbol_22)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-3-314
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_7) (symbol_4))
		:effect (probabilistic 
					0.509 (not (notfailed))
					0.392 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.099 (and (symbol_3) (not (symbol_22)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-3-315
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_9) (symbol_4))
		:effect (probabilistic 
					0.799 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.201 (and (symbol_3) (not (symbol_22)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-3-316
		:parameters ()
		:precondition (and (notfailed) (symbol_25) (symbol_24) (symbol_4))
		:effect (probabilistic 
					0.799 (and (symbol_22) (symbol_23) (not (symbol_3)) (not (symbol_4)) (decrease (reward) 1.00))
					0.201 (and (symbol_3) (not (symbol_22)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-4-317
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_12) (symbol_28))
		:effect (probabilistic 
					0.144 (not (notfailed))
					0.856 (and (symbol_19) (symbol_20) (not (symbol_1)) (not (symbol_28)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-4-318
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_13) (symbol_28))
		:effect (probabilistic 
					0.666 (not (notfailed))
					0.334 (and (symbol_19) (symbol_20) (not (symbol_1)) (not (symbol_28)) (decrease (reward) 1.00))
			
		)
	)

	(:action interact_option-partition-4-319
		:parameters ()
		:precondition (and (notfailed) (symbol_29) (symbol_21) (symbol_28))
		:effect (and (symbol_19) (symbol_20) (not (symbol_1)) (not (symbol_28)) (decrease (reward) 1.00))
	)

	(:action down_left_option-partition-0-320
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_9))
		:effect (probabilistic 
					0.882 (not (notfailed))
					0.118 (and (symbol_11) (symbol_18) (not (symbol_8)) (not (symbol_9)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-0-321
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_7))
		:effect (probabilistic 
					0.382 (not (notfailed))
					0.618 (and (symbol_11) (symbol_18) (not (symbol_7)) (not (symbol_10)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-0-322
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_9))
		:effect (and (symbol_11) (symbol_18) (not (symbol_9)) (not (symbol_10)) (decrease (reward) 35.69))
	)

	(:action down_left_option-partition-0-323
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_7))
		:effect (probabilistic 
					0.863 (not (notfailed))
					0.137 (and (symbol_11) (symbol_18) (not (symbol_7)) (not (symbol_14)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-0-324
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_9))
		:effect (probabilistic 
					0.338 (not (notfailed))
					0.662 (and (symbol_11) (symbol_18) (not (symbol_9)) (not (symbol_14)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-0-325
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_7))
		:effect (probabilistic 
					0.726 (not (notfailed))
					0.274 (and (symbol_11) (symbol_18) (not (symbol_7)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-0-326
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_9))
		:effect (probabilistic 
					0.069 (not (notfailed))
					0.931 (and (symbol_11) (symbol_18) (not (symbol_9)) (decrease (reward) 35.69))
			
		)
	)

	(:action down_left_option-partition-1-327
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_7))
		:effect (and (symbol_11) (symbol_17) (not (symbol_7)) (not (symbol_8)) (decrease (reward) 24.94))
	)

	(:action down_left_option-partition-1-328
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_9))
		:effect (and (symbol_11) (symbol_17) (not (symbol_8)) (not (symbol_9)) (decrease (reward) 24.94))
	)

	(:action down_left_option-partition-1-329
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7))
		:effect (probabilistic 
					0.439 (not (notfailed))
					0.561 (and (symbol_11) (symbol_17) (not (symbol_7)) (decrease (reward) 24.94))
			
		)
	)

	(:action down_left_option-partition-1-330
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9))
		:effect (probabilistic 
					0.11 (not (notfailed))
					0.89 (and (symbol_11) (symbol_17) (not (symbol_9)) (decrease (reward) 24.94))
			
		)
	)

	(:action down_left_option-partition-1-331
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_7))
		:effect (probabilistic 
					0.316 (not (notfailed))
					0.684 (and (symbol_11) (symbol_17) (not (symbol_7)) (not (symbol_18)) (decrease (reward) 24.94))
			
		)
	)

	(:action down_left_option-partition-1-332
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_9))
		:effect (probabilistic 
					0.064 (not (notfailed))
					0.936 (and (symbol_11) (symbol_17) (not (symbol_9)) (not (symbol_18)) (decrease (reward) 24.94))
			
		)
	)

	(:action down_left_option-partition-2-333
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_12) (symbol_10) (not (symbol_5)) (not (symbol_7)) (not (symbol_9)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_15)) (not (symbol_21)) (not (symbol_24)) (decrease (reward) 24.59))
	)

	(:action down_left_option-partition-3-334
		:parameters ()
		:precondition (and (notfailed) (symbol_12))
		:effect (and (symbol_21) (symbol_18) (not (symbol_6)) (not (symbol_8)) (not (symbol_10)) (not (symbol_12)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_25)) (not (symbol_26)) (not (symbol_29)) (decrease (reward) 24.72))
	)

	(:action down_left_option-partition-4-335
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_11))
		:effect (probabilistic 
					0.174 (not (notfailed))
					0.826 (and (symbol_13) (symbol_14) (not (symbol_11)) (decrease (reward) 23.20))
			
		)
	)

	(:action down_left_option-partition-4-336
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_15))
		:effect (probabilistic 
					0.254 (not (notfailed))
					0.746 (and (symbol_13) (symbol_14) (not (symbol_15)) (decrease (reward) 23.20))
			
		)
	)

	(:action down_left_option-partition-4-337
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_11))
		:effect (and (symbol_13) (symbol_14) (not (symbol_11)) (not (symbol_16)) (decrease (reward) 23.20))
	)

	(:action down_left_option-partition-4-338
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_15))
		:effect (and (symbol_13) (symbol_14) (not (symbol_15)) (not (symbol_16)) (decrease (reward) 23.20))
	)

	(:action down_right_option-partition-0-339
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_7))
		:effect (probabilistic 
					0.47 (not (notfailed))
					0.53 (and (symbol_11) (symbol_17) (not (symbol_6)) (not (symbol_7)) (decrease (reward) 35.28))
			
		)
	)

	(:action down_right_option-partition-0-340
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_9))
		:effect (and (symbol_11) (symbol_17) (not (symbol_6)) (not (symbol_9)) (decrease (reward) 35.28))
	)

	(:action down_right_option-partition-0-341
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7))
		:effect (probabilistic 
					0.867 (not (notfailed))
					0.133 (and (symbol_11) (symbol_17) (not (symbol_7)) (decrease (reward) 35.28))
			
		)
	)

	(:action down_right_option-partition-0-342
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9))
		:effect (probabilistic 
					0.175 (not (notfailed))
					0.825 (and (symbol_11) (symbol_17) (not (symbol_9)) (decrease (reward) 35.28))
			
		)
	)

	(:action down_right_option-partition-0-343
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_7))
		:effect (probabilistic 
					0.567 (not (notfailed))
					0.433 (and (symbol_11) (symbol_17) (not (symbol_7)) (not (symbol_26)) (decrease (reward) 35.28))
			
		)
	)

	(:action down_right_option-partition-0-344
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_9))
		:effect (probabilistic 
					0.06 (not (notfailed))
					0.94 (and (symbol_11) (symbol_17) (not (symbol_9)) (not (symbol_26)) (decrease (reward) 35.28))
			
		)
	)

	(:action down_right_option-partition-1-345
		:parameters ()
		:precondition (and (notfailed) (symbol_7))
		:effect (probabilistic 
					0.058 (not (notfailed))
					0.942 (and (symbol_11) (symbol_18) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_25)) (not (symbol_26)) (not (symbol_29)) (decrease (reward) 24.74))
			
		)
	)

	(:action jump_left_option-partition-0-346
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_11))
		:effect (and (symbol_7) (symbol_8) (not (symbol_11)) (decrease (reward) 38.58))
	)

	(:action jump_left_option-partition-0-347
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_15))
		:effect (probabilistic 
					0.194 (not (notfailed))
					0.806 (and (symbol_7) (symbol_8) (not (symbol_15)) (decrease (reward) 38.58))
			
		)
	)

	(:action jump_left_option-partition-0-348
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_11))
		:effect (and (symbol_7) (symbol_8) (not (symbol_11)) (not (symbol_18)) (decrease (reward) 38.58))
	)

	(:action jump_left_option-partition-0-349
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_15))
		:effect (probabilistic 
					0.127 (not (notfailed))
					0.873 (and (symbol_7) (symbol_8) (not (symbol_15)) (not (symbol_18)) (decrease (reward) 38.58))
			
		)
	)

	(:action jump_left_option-partition-1-350
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_7))
		:effect (probabilistic 
					0.696 (and (symbol_9) (symbol_6) (not (symbol_7)) (not (symbol_8)) (decrease (reward) 37.01))
					0.304 (and (symbol_11) (symbol_6) (not (symbol_7)) (not (symbol_8)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_left_option-partition-1-351
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_9))
		:effect (probabilistic 
					0.696 (and (symbol_9) (symbol_6) (not (symbol_8)) (decrease (reward) 37.01))
					0.304 (and (symbol_11) (symbol_6) (not (symbol_8)) (not (symbol_9)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_left_option-partition-1-352
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_7))
		:effect (probabilistic 
					0.423 (not (notfailed))
					0.402 (and (symbol_9) (symbol_6) (not (symbol_7)) (not (symbol_17)) (decrease (reward) 37.01))
					0.175 (and (symbol_11) (symbol_6) (not (symbol_7)) (not (symbol_17)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_left_option-partition-1-353
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_9))
		:effect (probabilistic 
					0.111 (not (notfailed))
					0.619 (and (symbol_9) (symbol_6) (not (symbol_17)) (decrease (reward) 37.01))
					0.27 (and (symbol_11) (symbol_6) (not (symbol_9)) (not (symbol_17)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_left_option-partition-1-354
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_7))
		:effect (probabilistic 
					0.331 (not (notfailed))
					0.466 (and (symbol_9) (symbol_6) (not (symbol_7)) (not (symbol_18)) (decrease (reward) 37.01))
					0.203 (and (symbol_11) (symbol_6) (not (symbol_7)) (not (symbol_18)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_left_option-partition-1-355
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_9))
		:effect (probabilistic 
					0.075 (not (notfailed))
					0.644 (and (symbol_9) (symbol_6) (not (symbol_18)) (decrease (reward) 37.01))
					0.281 (and (symbol_11) (symbol_6) (not (symbol_9)) (not (symbol_18)) (decrease (reward) 62.73))
			
		)
	)

	(:action jump_right_option-partition-0-356
		:parameters ()
		:precondition (and (notfailed) (symbol_17))
		:effect (and (symbol_7) (symbol_8) (not (symbol_5)) (not (symbol_9)) (not (symbol_11)) (not (symbol_12)) (not (symbol_13)) (not (symbol_15)) (not (symbol_17)) (not (symbol_21)) (not (symbol_24)) (decrease (reward) 38.36))
	)

	(:action jump_right_option-partition-1-357
		:parameters ()
		:precondition (and (notfailed) (symbol_7))
		:effect (probabilistic 
					0.066 (not (notfailed))
					0.803 (and (symbol_9) (symbol_10) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_25)) (not (symbol_26)) (not (symbol_29)) (decrease (reward) 37.06))
					0.131 (and (symbol_11) (symbol_10) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_25)) (not (symbol_26)) (not (symbol_29)) (decrease (reward) 62.86))
			
		)
	)

	(:action jump_right_option-partition-2-358
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_21))
		:effect (probabilistic 
					0.818 (not (notfailed))
					0.182 (and (symbol_12) (symbol_10) (not (symbol_6)) (not (symbol_21)) (decrease (reward) 38.39))
			
		)
	)

	(:action jump_right_option-partition-2-359
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_21))
		:effect (and (symbol_12) (symbol_10) (not (symbol_8)) (not (symbol_21)) (decrease (reward) 38.39))
	)

	(:action jump_right_option-partition-2-360
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_21))
		:effect (and (symbol_12) (symbol_10) (not (symbol_21)) (decrease (reward) 38.39))
	)

	(:action jump_right_option-partition-2-361
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_21))
		:effect (probabilistic 
					0.533 (not (notfailed))
					0.467 (and (symbol_12) (symbol_10) (not (symbol_14)) (not (symbol_21)) (decrease (reward) 38.39))
			
		)
	)

	(:action jump_right_option-partition-2-362
		:parameters ()
		:precondition (and (notfailed) (symbol_17) (symbol_21))
		:effect (probabilistic 
					0.107 (not (notfailed))
					0.893 (and (symbol_12) (symbol_10) (not (symbol_17)) (not (symbol_21)) (decrease (reward) 38.39))
			
		)
	)

	(:action jump_right_option-partition-2-363
		:parameters ()
		:precondition (and (notfailed) (symbol_18) (symbol_21))
		:effect (and (symbol_12) (symbol_10) (not (symbol_18)) (not (symbol_21)) (decrease (reward) 38.39))
	)

	(:action jump_right_option-partition-3-364
		:parameters ()
		:precondition (and (notfailed) (symbol_12))
		:effect (and (symbol_13) (symbol_14) (not (symbol_6)) (not (symbol_8)) (not (symbol_10)) (not (symbol_12)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_25)) (not (symbol_26)) (not (symbol_29)) (decrease (reward) 38.56))
	)

	(:action jump_right_option-partition-4-365
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_13) (symbol_20))
		:effect (probabilistic 
					0.351 (not (notfailed))
					0.649 (and (symbol_15) (symbol_16) (not (symbol_10)) (not (symbol_13)) (decrease (reward) 28.55))
			
		)
	)

	(:action jump_right_option-partition-4-366
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_15) (symbol_20))
		:effect (probabilistic 
					0.52 (not (notfailed))
					0.48 (and (symbol_15) (symbol_16) (not (symbol_10)) (decrease (reward) 28.55))
			
		)
	)

	(:action jump_right_option-partition-4-367
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_12) (symbol_20))
		:effect (probabilistic 
					0.312 (not (notfailed))
					0.688 (and (symbol_15) (symbol_16) (not (symbol_12)) (not (symbol_14)) (decrease (reward) 28.55))
			
		)
	)

	(:action jump_right_option-partition-4-368
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_13) (symbol_20))
		:effect (and (symbol_15) (symbol_16) (not (symbol_13)) (not (symbol_14)) (decrease (reward) 28.55))
	)

	(:action jump_right_option-partition-4-369
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_15) (symbol_20))
		:effect (probabilistic 
					0.473 (not (notfailed))
					0.527 (and (symbol_15) (symbol_16) (not (symbol_14)) (decrease (reward) 28.55))
			
		)
	)

	(:action jump_right_option-partition-4-370
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_12) (symbol_20))
		:effect (probabilistic 
					0.224 (not (notfailed))
					0.776 (and (symbol_15) (symbol_16) (not (symbol_12)) (decrease (reward) 28.55))
			
		)
	)

	(:action jump_right_option-partition-4-371
		:parameters ()
		:precondition (and (notfailed) (symbol_16) (symbol_13) (symbol_20))
		:effect (probabilistic 
					0.264 (not (notfailed))
					0.736 (and (symbol_15) (symbol_16) (not (symbol_13)) (decrease (reward) 28.55))
			
		)
	)
)