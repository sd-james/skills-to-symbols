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

	(:action go_left_option-partition-0-0
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action go_left_option-partition-0-1
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action go_left_option-partition-0-2
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action go_left_option-partition-0-3
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action go_left_option-partition-0-4
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_7) (not (symbol_6)))
	)

	(:action go_left_option-partition-0-5
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-0-6
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-7
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-8
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-9
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-10
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-11
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-12
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-13
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_7) (not (symbol_10)))
	)

	(:action go_left_option-partition-0-14
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (and (symbol_7) (not (symbol_14)))
	)

	(:action go_left_option-partition-0-15
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_7) (not (symbol_14)))
	)

	(:action go_left_option-partition-0-16
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-1-17
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_6) (not (symbol_8)))
	)

	(:action go_left_option-partition-1-18
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_6) (not (symbol_8)))
	)

	(:action go_left_option-partition-1-19
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-1-20
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_6) (not (symbol_9)))
	)

	(:action go_left_option-partition-1-21
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-1-22
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-1-23
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_6) (not (symbol_13)))
	)

	(:action go_left_option-partition-1-24
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-1-25
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_6) (not (symbol_26)))
	)

	(:action go_left_option-partition-2-26
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_19))
		:effect (symbol_8)
	)

	(:action go_left_option-partition-2-27
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_24))
		:effect (symbol_8)
	)

	(:action go_left_option-partition-2-28
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25))
		:effect (symbol_8)
	)

	(:action go_left_option-partition-2-29
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-2-30
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-31
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-32
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-33
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_19))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-34
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_24))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-35
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-36
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29))
		:effect (and (symbol_8) (not (symbol_13)))
	)

	(:action go_left_option-partition-2-37
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action go_left_option-partition-2-38
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_24))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action go_left_option-partition-3-39
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action go_left_option-partition-3-40
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action go_left_option-partition-3-41
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_8)))
	)

	(:action go_left_option-partition-3-42
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_4))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-3-43
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (and (symbol_9) (not (symbol_26)))
	)

	(:action go_left_option-partition-3-44
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_4))
		:effect (and (symbol_9) (not (symbol_26)))
	)

	(:action go_left_option-partition-4-45
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action go_left_option-partition-4-46
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action go_left_option-partition-4-47
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action go_left_option-partition-4-48
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action go_left_option-partition-4-49
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_10) (not (symbol_6)))
	)

	(:action go_left_option-partition-4-50
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-4-51
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-4-52
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action go_left_option-partition-4-53
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action go_left_option-partition-4-54
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action go_left_option-partition-4-55
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_10) (not (symbol_11)))
	)

	(:action go_left_option-partition-4-56
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action go_left_option-partition-4-57
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action go_left_option-partition-4-58
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action go_left_option-partition-4-59
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action go_left_option-partition-4-60
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_10) (not (symbol_14)))
	)

	(:action go_left_option-partition-4-61
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action go_left_option-partition-4-62
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action go_left_option-partition-4-63
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action go_left_option-partition-4-64
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action go_left_option-partition-4-65
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_10) (not (symbol_28)))
	)

	(:action go_left_option-partition-5-66
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_11) (not (symbol_8)))
	)

	(:action go_left_option-partition-5-67
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_11) (not (symbol_8)))
	)

	(:action go_left_option-partition-5-68
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_11) (not (symbol_9)))
	)

	(:action go_left_option-partition-5-69
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-5-70
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_17))
		:effect (and (symbol_11) (not (symbol_13)))
	)

	(:action go_left_option-partition-5-71
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_27))
		:effect (not (notfailed))
	)

	(:action go_left_option-partition-5-72
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_11) (not (symbol_26)))
	)

	(:action go_left_option-partition-5-73
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_11) (not (symbol_26)))
	)

	(:action go_right_option-partition-0-74
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action go_right_option-partition-0-75
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action go_right_option-partition-0-76
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18))
		:effect (and (symbol_6) (not (symbol_7)))
	)

	(:action go_right_option-partition-0-77
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-0-78
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-0-79
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-80
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action go_right_option-partition-1-81
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action go_right_option-partition-1-82
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action go_right_option-partition-1-83
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_6)))
	)

	(:action go_right_option-partition-1-84
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-85
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action go_right_option-partition-1-86
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action go_right_option-partition-1-87
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_7)))
	)

	(:action go_right_option-partition-1-88
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-89
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-90
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-91
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-92
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-93
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_4))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-94
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_9)))
	)

	(:action go_right_option-partition-1-95
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action go_right_option-partition-1-96
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action go_right_option-partition-1-97
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action go_right_option-partition-1-98
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_10)))
	)

	(:action go_right_option-partition-1-99
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-100
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-101
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-102
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-103
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-104
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-105
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-106
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_4))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-107
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_11)))
	)

	(:action go_right_option-partition-1-108
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action go_right_option-partition-1-109
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action go_right_option-partition-1-110
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action go_right_option-partition-1-111
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action go_right_option-partition-1-112
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_14)))
	)

	(:action go_right_option-partition-1-113
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29) (symbol_21))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-114
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action go_right_option-partition-1-115
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_4))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action go_right_option-partition-1-116
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_26)))
	)

	(:action go_right_option-partition-1-117
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27) (symbol_21))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-118
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-1-119
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-1-120
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16) (symbol_4))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-1-121
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-1-122
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_4))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-1-123
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-1-124
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27) (symbol_21))
		:effect (and (symbol_8) (not (symbol_28)))
	)

	(:action go_right_option-partition-2-125
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action go_right_option-partition-2-126
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action go_right_option-partition-2-127
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action go_right_option-partition-2-128
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_13) (not (symbol_8)))
	)

	(:action go_right_option-partition-2-129
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_17))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action go_right_option-partition-2-130
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action go_right_option-partition-2-131
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_29))
		:effect (and (symbol_13) (not (symbol_9)))
	)

	(:action go_right_option-partition-2-132
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_13) (not (symbol_11)))
	)

	(:action go_right_option-partition-2-133
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-2-134
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action go_right_option-partition-2-135
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action go_right_option-partition-2-136
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action go_right_option-partition-2-137
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect (and (symbol_13) (not (symbol_26)))
	)

	(:action go_right_option-partition-3-138
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_17))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-139
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_19))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-140
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-141
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-142
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_27))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-143
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_10) (not (symbol_7)))
	)

	(:action go_right_option-partition-3-144
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-3-145
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-4-146
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_17))
		:effect (and (symbol_14) (not (symbol_6)))
	)

	(:action go_right_option-partition-4-147
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-4-148
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_14) (not (symbol_6)))
	)

	(:action go_right_option-partition-4-149
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action go_right_option-partition-4-150
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-4-151
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action go_right_option-partition-4-152
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_14) (not (symbol_10)))
	)

	(:action go_right_option-partition-5-153
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action go_right_option-partition-5-154
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action go_right_option-partition-5-155
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action go_right_option-partition-5-156
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_11) (not (symbol_6)))
	)

	(:action go_right_option-partition-5-157
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action go_right_option-partition-5-158
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action go_right_option-partition-5-159
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_11) (not (symbol_10)))
	)

	(:action go_right_option-partition-5-160
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-5-161
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action go_right_option-partition-5-162
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action go_right_option-partition-5-163
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_11) (not (symbol_14)))
	)

	(:action go_right_option-partition-5-164
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-5-165
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-5-166
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-6-167
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17) (symbol_0))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-6-168
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_25) (symbol_0))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-6-169
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29) (symbol_0))
		:effect (and (symbol_15) (symbol_13) (not (symbol_0)) (not (symbol_8)))
	)

	(:action go_right_option-partition-6-170
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_25) (symbol_0))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-6-171
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_29) (symbol_0))
		:effect (and (symbol_15) (symbol_13) (not (symbol_0)))
	)

	(:action go_right_option-partition-6-172
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17) (symbol_0))
		:effect (not (notfailed))
	)

	(:action go_right_option-partition-6-173
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29) (symbol_0))
		:effect (not (notfailed))
	)

	(:action up_ladder_option-partition-0-174
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action up_ladder_option-partition-0-175
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action up_ladder_option-partition-0-176
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action up_ladder_option-partition-0-177
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (and (symbol_16) (not (symbol_5)))
	)

	(:action up_ladder_option-partition-1-178
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_5) (not (symbol_17)))
	)

	(:action up_ladder_option-partition-1-179
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_18))
		:effect (and (symbol_5) (not (symbol_18)))
	)

	(:action up_ladder_option-partition-1-180
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_27))
		:effect (and (symbol_5) (not (symbol_27)))
	)

	(:action up_ladder_option-partition-1-181
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (not (notfailed))
	)

	(:action up_ladder_option-partition-1-182
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (and (symbol_5) (not (symbol_18)))
	)

	(:action up_ladder_option-partition-1-183
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_27))
		:effect (and (symbol_5) (not (symbol_27)))
	)

	(:action up_ladder_option-partition-2-184
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action up_ladder_option-partition-2-185
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action up_ladder_option-partition-2-186
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action up_ladder_option-partition-2-187
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_17) (not (symbol_29)))
	)

	(:action up_ladder_option-partition-2-188
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action up_ladder_option-partition-2-189
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action up_ladder_option-partition-2-190
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action up_ladder_option-partition-2-191
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (not (notfailed))
	)

	(:action up_ladder_option-partition-2-192
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_17) (not (symbol_19)))
	)

	(:action up_ladder_option-partition-2-193
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_17) (not (symbol_24)))
	)

	(:action up_ladder_option-partition-2-194
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_17) (not (symbol_25)))
	)

	(:action up_ladder_option-partition-2-195
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (not (notfailed))
	)

	(:action up_ladder_option-partition-2-196
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (not (notfailed))
	)

	(:action up_ladder_option-partition-2-197
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (not (notfailed))
	)

	(:action down_ladder_option-partition-0-198
		:parameters ()
		:precondition (and (notfailed) (symbol_16))
		:effect (and (symbol_5) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-199
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action down_ladder_option-partition-1-200
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-201
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action down_ladder_option-partition-1-202
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-203
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect (not (notfailed))
	)

	(:action down_ladder_option-partition-1-204
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-205
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action down_ladder_option-partition-1-206
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-207
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_18) (not (symbol_5)))
	)

	(:action down_ladder_option-partition-1-208
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_16))
		:effect (and (symbol_18) (not (symbol_16)))
	)

	(:action down_ladder_option-partition-1-209
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (not (notfailed))
	)

	(:action down_ladder_option-partition-2-210
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-211
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-212
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action down_ladder_option-partition-2-213
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-214
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-215
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action down_ladder_option-partition-2-216
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_17))
		:effect (and (symbol_19) (not (symbol_17)))
	)

	(:action down_ladder_option-partition-2-217
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-218
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-219
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action down_ladder_option-partition-2-220
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-221
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-222
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (not (notfailed))
	)

	(:action down_ladder_option-partition-2-223
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-224
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-225
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action down_ladder_option-partition-2-226
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_24))
		:effect (and (symbol_19) (not (symbol_24)))
	)

	(:action down_ladder_option-partition-2-227
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_25))
		:effect (and (symbol_19) (not (symbol_25)))
	)

	(:action down_ladder_option-partition-2-228
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_19) (not (symbol_29)))
	)

	(:action interact_option-partition-0-229
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-0-230
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-1-231
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_5))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-1-232
		:parameters ()
		:precondition (and (notfailed) (symbol_13) (symbol_18))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-2-233
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-2-234
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_3) (symbol_4) (not (symbol_20)) (not (symbol_21)))
	)

	(:action interact_option-partition-3-235
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_5))
		:effect (not (notfailed))
	)

	(:action interact_option-partition-3-236
		:parameters ()
		:precondition (and (notfailed) (symbol_7) (symbol_16))
		:effect (and (symbol_20) (symbol_21) (not (symbol_3)) (not (symbol_4)))
	)

	(:action down_left_option-partition-0-237
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_9)))
	)

	(:action down_left_option-partition-0-238
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_16)))
	)

	(:action down_left_option-partition-0-239
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_9)) (not (symbol_18)))
	)

	(:action down_left_option-partition-0-240
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_27))
		:effect (not (notfailed))
	)

	(:action down_left_option-partition-0-241
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)))
	)

	(:action down_left_option-partition-0-242
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)))
	)

	(:action down_left_option-partition-0-243
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_17) (symbol_11) (not (symbol_18)))
	)

	(:action down_left_option-partition-0-244
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_5))
		:effect (not (notfailed))
	)

	(:action down_left_option-partition-0-245
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_26)))
	)

	(:action down_left_option-partition-0-246
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_18))
		:effect (not (notfailed))
	)

	(:action down_left_option-partition-0-247
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_5))
		:effect (and (symbol_17) (symbol_11) (not (symbol_5)) (not (symbol_28)))
	)

	(:action down_left_option-partition-0-248
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_16))
		:effect (and (symbol_17) (symbol_11) (not (symbol_16)) (not (symbol_28)))
	)

	(:action down_left_option-partition-0-249
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect (not (notfailed))
	)

	(:action down_left_option-partition-1-250
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_18)))
	)

	(:action down_left_option-partition-1-251
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_11)) (not (symbol_27)))
	)

	(:action down_left_option-partition-1-252
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)))
	)

	(:action down_left_option-partition-1-253
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_27)))
	)

	(:action down_left_option-partition-1-254
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)) (not (symbol_28)))
	)

	(:action down_left_option-partition-1-255
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_27)) (not (symbol_28)))
	)

	(:action down_left_option-partition-2-256
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_19) (symbol_11) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_26)) (not (symbol_28)))
	)

	(:action down_left_option-partition-3-257
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_24) (symbol_9) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)) (not (symbol_29)))
	)

	(:action down_left_option-partition-4-258
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_17)))
	)

	(:action down_left_option-partition-4-259
		:parameters ()
		:precondition (and (notfailed) (symbol_8) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_8)) (not (symbol_29)))
	)

	(:action down_left_option-partition-4-260
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_17))
		:effect (and (symbol_25) (symbol_26) (not (symbol_17)))
	)

	(:action down_left_option-partition-4-261
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_29))
		:effect (and (symbol_25) (symbol_26) (not (symbol_29)))
	)

	(:action down_right_option-partition-0-262
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_18)))
	)

	(:action down_right_option-partition-0-263
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_27))
		:effect (and (symbol_17) (symbol_14) (not (symbol_6)) (not (symbol_27)))
	)

	(:action down_right_option-partition-0-264
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_10)) (not (symbol_18)))
	)

	(:action down_right_option-partition-0-265
		:parameters ()
		:precondition (and (notfailed) (symbol_10) (symbol_27))
		:effect (not (notfailed))
	)

	(:action down_right_option-partition-0-266
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_18))
		:effect (and (symbol_17) (symbol_14) (not (symbol_18)))
	)

	(:action down_right_option-partition-0-267
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_27))
		:effect (not (notfailed))
	)

	(:action down_right_option-partition-1-268
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_17) (symbol_11) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action jump_left_option-partition-0-269
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_17)))
	)

	(:action jump_left_option-partition-0-270
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_29))
		:effect (and (symbol_27) (symbol_28) (not (symbol_11)) (not (symbol_29)))
	)

	(:action jump_left_option-partition-0-271
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_17))
		:effect (and (symbol_27) (symbol_28) (not (symbol_17)))
	)

	(:action jump_left_option-partition-0-272
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_29))
		:effect (and (symbol_27) (symbol_28) (not (symbol_29)))
	)

	(:action jump_left_option-partition-1-273
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_18) (symbol_6) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action jump_right_option-partition-0-274
		:parameters ()
		:precondition (and (notfailed) (symbol_14))
		:effect (and (symbol_27) (symbol_28) (not (symbol_5)) (not (symbol_14)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_29)))
	)

	(:action jump_right_option-partition-1-275
		:parameters ()
		:precondition (and (notfailed) (symbol_6) (symbol_19))
		:effect (not (notfailed))
	)

	(:action jump_right_option-partition-1-276
		:parameters ()
		:precondition (and (notfailed) (symbol_9) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)))
	)

	(:action jump_right_option-partition-1-277
		:parameters ()
		:precondition (and (notfailed) (symbol_11) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_11)) (not (symbol_19)))
	)

	(:action jump_right_option-partition-1-278
		:parameters ()
		:precondition (and (notfailed) (symbol_14) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_14)) (not (symbol_19)))
	)

	(:action jump_right_option-partition-1-279
		:parameters ()
		:precondition (and (notfailed) (symbol_26) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_26)))
	)

	(:action jump_right_option-partition-1-280
		:parameters ()
		:precondition (and (notfailed) (symbol_28) (symbol_19))
		:effect (and (symbol_24) (symbol_9) (not (symbol_19)) (not (symbol_28)))
	)

	(:action jump_right_option-partition-2-281
		:parameters ()
		:precondition (and (notfailed) (symbol_24))
		:effect (and (symbol_25) (symbol_26) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_9)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_24)) (not (symbol_28)))
	)

	(:action jump_right_option-partition-3-282
		:parameters ()
		:precondition (and (notfailed) (symbol_27))
		:effect (and (symbol_18) (symbol_9) (not (symbol_6)) (not (symbol_7)) (not (symbol_8)) (not (symbol_10)) (not (symbol_11)) (not (symbol_13)) (not (symbol_14)) (not (symbol_26)) (not (symbol_27)) (not (symbol_28)))
	)

	(:action jump_right_option-partition-4-283
		:parameters ()
		:precondition (and (notfailed) (symbol_26))
		:effect (and (symbol_29) (symbol_8) (not (symbol_5)) (not (symbol_16)) (not (symbol_17)) (not (symbol_18)) (not (symbol_19)) (not (symbol_24)) (not (symbol_25)) (not (symbol_26)) (not (symbol_27)))
	)
)