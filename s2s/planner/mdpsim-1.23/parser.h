#ifndef BISON_PARSER_H
# define BISON_PARSER_H

#ifndef YYSTYPE
typedef union {
  Assignment::AssignOp setop;
  const Effect* effect;
  ConjunctiveEffect* ceffect;
  ProbabilisticEffect* peffect;
  const StateFormula* formula;
  const Atom* atom;
  Conjunction* conj;
  Disjunction* disj;
  const Expression* expr;
  const Application* appl;
  Comparison::CmpPredicate comp;
  Type type;
  TypeSet* types;
  const std::string* str;
  std::vector<const std::string*>* strs;
  const Rational* num;
} yystype;
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif
# define	DEFINE	257
# define	DOMAIN_TOKEN	258
# define	PROBLEM	259
# define	REQUIREMENTS	260
# define	TYPES	261
# define	CONSTANTS	262
# define	PREDICATES	263
# define	FUNCTIONS	264
# define	STRIPS	265
# define	TYPING	266
# define	NEGATIVE_PRECONDITIONS	267
# define	DISJUNCTIVE_PRECONDITIONS	268
# define	EQUALITY	269
# define	EXISTENTIAL_PRECONDITIONS	270
# define	UNIVERSAL_PRECONDITIONS	271
# define	QUANTIFIED_PRECONDITIONS	272
# define	CONDITIONAL_EFFECTS	273
# define	FLUENTS	274
# define	ADL	275
# define	DURATIVE_ACTIONS	276
# define	DURATION_INEQUALITIES	277
# define	CONTINUOUS_EFFECTS	278
# define	PROBABILISTIC_EFFECTS	279
# define	REWARDS	280
# define	MDP	281
# define	ACTION	282
# define	PARAMETERS	283
# define	PRECONDITION	284
# define	EFFECT	285
# define	PDOMAIN	286
# define	OBJECTS	287
# define	INIT	288
# define	GOAL	289
# define	GOAL_REWARD	290
# define	METRIC	291
# define	GOAL_PROBABILITY	292
# define	WHEN	293
# define	NOT	294
# define	AND	295
# define	OR	296
# define	IMPLY	297
# define	EXISTS	298
# define	FORALL	299
# define	PROBABILISTIC	300
# define	ASSIGN	301
# define	SCALE_UP	302
# define	SCALE_DOWN	303
# define	INCREASE	304
# define	DECREASE	305
# define	MINIMIZE	306
# define	MAXIMIZE	307
# define	NUMBER_TOKEN	308
# define	OBJECT_TOKEN	309
# define	EITHER	310
# define	LE	311
# define	GE	312
# define	NAME	313
# define	VARIABLE	314
# define	NUMBER	315
# define	ILLEGAL_TOKEN	316


extern YYSTYPE yylval;

#endif /* not BISON_PARSER_H */
