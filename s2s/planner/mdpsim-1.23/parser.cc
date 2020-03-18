/* A Bison parser, made from parser.yy
   by GNU bison 1.35.  */

#define YYBISON 1  /* Identify Bison output.  */

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

#line 20 "parser.yy"

#include <config.h>
#include "problems.h"
#include "domains.h"
#include "actions.h"
#include "effects.h"
#include "formulas.h"
#include "expressions.h"
#include "functions.h"
#include "predicates.h"
#include "terms.h"
#include "types.h"
#include "rational.h"
#include "exceptions.h"
#include <iostream>
#include <map>
#include <string>
#include <typeinfo>


/* Workaround for bug in Bison 1.35 that disables stack growth. */
#define YYLTYPE_IS_TRIVIAL 1


/*
 * Context of free variables.
 */
struct Context {
  void push_frame() {
    frames_.push_back(VariableMap());
  }

  void pop_frame() {
    frames_.pop_back();
  }

  void insert(const std::string& name, Variable v) {
    frames_.back()[name] = v;
  }

  std::pair<Variable, bool> shallow_find(const std::string& name) const {
    VariableMap::const_iterator vi = frames_.back().find(name);
    if (vi != frames_.back().end()) {
      return std::make_pair((*vi).second, true);
    } else {
      return std::make_pair(0, false);
    }
  }

  std::pair<Variable, bool> find(const std::string& name) const {
    for (std::vector<VariableMap>::const_reverse_iterator fi =
	   frames_.rbegin(); fi != frames_.rend(); fi++) {
      VariableMap::const_iterator vi = (*fi).find(name);
      if (vi != (*fi).end()) {
	return std::make_pair((*vi).second, true);
      }
    }
    return std::make_pair(0, false);
  }

private:
  struct VariableMap : public std::map<std::string, Variable> {
  };

  std::vector<VariableMap> frames_;
};


/* The lexer. */
extern int yylex();
/* Current line number. */
extern size_t line_number;
/* Name of current file. */
extern std::string current_file;
/* Level of warnings. */
extern int warning_level;

/* Whether the last parsing attempt succeeded. */
static bool success = true;
/* Current domain. */
static Domain* domain;
/* Domains. */
static std::map<std::string, Domain*> domains;
/* Problem being parsed, or NULL if no problem is being parsed. */
static Problem* problem;
/* Current requirements. */
static Requirements* requirements;
/* The goal probability function, if probabilistic effects are required. */
static Function goal_prob_function; 
/* The reward function, if rewards are required. */
static Function reward_function;
/* Predicate being parsed. */
static Predicate predicate;
/* Whether a predicate is being parsed. */
static bool parsing_predicate;
/* Whether predicate declaration is repeated. */
static bool repeated_predicate;
/* Function being parsed. */
static Function function;
/* Whether a function is being parsed. */
static bool parsing_function;
/* Whether function declaration is repeated. */
static bool repeated_function;
/* Action being parsed, or NULL if no action is being parsed. */
static ActionSchema* action;
/* Current variable context. */
static Context context;
/* Predicate for atomic state formula being parsed. */
static Predicate atom_predicate;
/* Whether the predicate of the currently parsed atom was undeclared. */
static bool undeclared_atom_predicate;
/* Whether parsing effect fluents. */
static bool effect_fluent;
/* Whether parsing metric fluent. */
static bool metric_fluent;
/* Function for function application being parsed. */
static Function appl_function;
/* Whether the function of the currently parsed application was undeclared. */
static bool undeclared_appl_function;
/* Paramerers for atomic state formula or function application being parsed. */
static TermList term_parameters;
/* Whether parsing an atom. */
static bool parsing_atom;
/* Whether parsing a function application. */
static bool parsing_application;
/* Quantified variables for effect or formula being parsed. */
static VariableList quantified;
/* Most recently parsed term for equality formula. */
static Term eq_term;
/* Most recently parsed expression for equality formula. */
static const Expression* eq_expr;
/* The first term for equality formula. */
static Term first_eq_term;
/* The first expression for equality formula. */
static const Expression* first_eq_expr;
/* Kind of name map being parsed. */
static enum { TYPE_KIND, CONSTANT_KIND, OBJECT_KIND, VOID_KIND } name_kind;

/* Outputs an error message. */
static void yyerror(const std::string& s); 
/* Outputs a warning message. */
static void yywarning(const std::string& s);
/* Creates an empty domain with the given name. */
static void make_domain(const std::string* name);
/* Creates an empty problem with the given name. */
static void make_problem(const std::string* name,
			 const std::string* domain_name);
/* Adds :typing to the requirements. */
static void require_typing();
/* Adds :fluents to the requirements. */
static void require_fluents();
/* Adds :disjunctive-preconditions to the requirements. */
static void require_disjunction();
/* Adds :conditional-effects to the requirements. */ 
static void require_conditional_effects();
/* Returns a simple type with the given name. */
static Type make_type(const std::string* name);
/* Returns the union of the given types. */
static Type make_type(const TypeSet& types);
/* Returns a simple term with the given name. */
static Term make_term(const std::string* name);
/* Creates a predicate with the given name. */
static void make_predicate(const std::string* name);
/* Creates a function with the given name. */
static void make_function(const std::string* name);
/* Creates an action with the given name. */
static void make_action(const std::string* name);
/* Adds the current action to the current domain. */
static void add_action();
/* Prepares for the parsing of a universally quantified effect. */ 
static void prepare_forall_effect();
/* Creates a universally quantified effect. */
static const Effect* make_forall_effect(const Effect& effect);
/* Adds an outcome to the given probabilistic effect. */
static void add_effect_outcome(ProbabilisticEffect& peffect,
			       const Rational* p, const Effect& effect);
/* Creates an add effect. */
static const Effect* make_add_effect(const Atom& atom);
/* Creates a delete effect. */
static const Effect* make_delete_effect(const Atom& atom);
/* Creates an assignment effect. */
static const Effect* make_assignment_effect(Assignment::AssignOp oper,
					    const Application& application,
					    const Expression& expr);
/* Adds types, constants, or objects to the current domain or problem. */
static void add_names(const std::vector<const std::string*>* names, Type type);
/* Adds variables to the current variable list. */
static void add_variables(const std::vector<const std::string*>* names,
			  Type type);
/* Prepares for the parsing of an atomic state formula. */ 
static void prepare_atom(const std::string* name);
/* Prepares for the parsing of a function application. */ 
static void prepare_application(const std::string* name);
/* Adds a term with the given name to the current atomic state formula. */
static void add_term(const std::string* name);
/* Creates the atomic formula just parsed. */
static const Atom* make_atom();
/* Creates the function application just parsed. */
static const Application* make_application();
/* Creates a subtraction. */
static const Expression* make_subtraction(const Expression& term,
					  const Expression* opt_term);
/* Creates an atom or fluent for the given name to be used in an
   equality formula. */
static void make_eq_name(const std::string* name);
/* Creates an equality formula. */
static const StateFormula* make_equality();
/* Creates a negated formula. */
static const StateFormula* make_negation(const StateFormula& negand);
/* Creates an implication. */
static const StateFormula* make_implication(const StateFormula& f1,
					    const StateFormula& f2);
/* Prepares for the parsing of an existentially quantified formula. */
static void prepare_exists();
/* Prepares for the parsing of a universally quantified formula. */
static void prepare_forall();
/* Creates an existentially quantified formula. */
static const StateFormula* make_exists(const StateFormula& body);
/* Creates a universally quantified formula. */
static const StateFormula* make_forall(const StateFormula& body);
/* Sets the goal reward for the current problem. */
static void set_goal_reward(const Expression& goal_reward);
/* Sets the default metric for the current problem. */
static void set_default_metric();

#line 261 "parser.yy"
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
#ifndef YYDEBUG
# define YYDEBUG 0
#endif



#define	YYFINAL		480
#define	YYFLAG		-32768
#define	YYNTBASE	72

/* YYTRANSLATE(YYLEX) -- Bison token number corresponding to YYLEX. */
#define YYTRANSLATE(x) ((unsigned)(x) <= 316 ? yytranslate[x] : 209)

/* YYTRANSLATE[YYLEX] -- Bison token number corresponding to YYLEX. */
static const char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      63,    64,    70,    69,     2,    65,     2,    71,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      67,    66,    68,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62
};

#if YYDEBUG
static const short yyprhs[] =
{
       0,     0,     1,     4,     5,     8,    11,    12,    22,    23,
      25,    28,    30,    32,    35,    37,    39,    41,    43,    46,
      49,    52,    54,    56,    58,    61,    64,    66,    68,    70,
      73,    76,    78,    80,    82,    85,    88,    90,    92,    95,
      97,    99,   102,   104,   106,   109,   111,   113,   116,   118,
     123,   125,   128,   130,   132,   134,   136,   138,   140,   142,
     144,   146,   148,   150,   152,   154,   156,   158,   160,   162,
     163,   169,   170,   176,   181,   182,   188,   189,   192,   193,
     199,   200,   202,   206,   208,   211,   212,   216,   217,   223,
     224,   232,   233,   238,   241,   243,   244,   246,   249,   252,
     254,   259,   260,   269,   270,   277,   282,   283,   286,   289,
     293,   295,   297,   302,   303,   310,   312,   314,   316,   318,
     320,   321,   335,   338,   340,   343,   345,   348,   350,   351,
     357,   362,   363,   366,   368,   374,   379,   382,   386,   388,
     393,   394,   397,   399,   405,   407,   413,   415,   417,   423,
     424,   425,   432,   433,   440,   442,   443,   450,   451,   458,
     463,   468,   469,   475,   481,   482,   491,   492,   501,   502,
     505,   506,   509,   510,   516,   518,   519,   525,   527,   529,
     531,   533,   535,   537,   543,   549,   555,   561,   563,   565,
     566,   573,   574,   581,   582,   589,   590,   597,   598,   604,
     606,   608,   609,   611,   612,   618,   620,   622,   628,   634,
     640,   646,   648,   650,   651,   653,   654,   660,   662,   663,
     666,   669,   670,   673,   674,   676,   677,   682,   684,   687,
     688,   690,   691,   696,   698,   701,   702,   706,   708,   710,
     715,   717,   719,   722,   725,   727,   729,   731,   733,   735,
     737,   739,   741,   743,   745,   747,   749,   751,   753,   755,
     757,   759,   761,   763,   765,   767,   769,   771,   773,   775,
     777,   779,   781,   783,   785,   787,   789,   791,   793,   795,
     797,   799,   801,   803,   805,   807,   809,   811,   813,   815,
     817,   819,   821,   823,   825,   827,   829,   831,   833,   835
};
static const short yyrhs[] =
{
      -1,    73,    74,     0,     0,    74,    75,     0,    74,   123,
       0,     0,    63,   183,    63,   184,   207,    64,    76,    77,
      64,     0,     0,    88,     0,    88,    78,     0,    78,     0,
      91,     0,    91,    79,     0,    79,     0,    93,     0,    95,
       0,    96,     0,    93,    80,     0,    95,    81,     0,    96,
      82,     0,    86,     0,    95,     0,    96,     0,    95,    83,
       0,    96,    84,     0,    86,     0,    93,     0,    96,     0,
      93,    83,     0,    96,    85,     0,    86,     0,    93,     0,
      95,     0,    93,    84,     0,    95,    85,     0,    86,     0,
      96,     0,    96,    86,     0,    86,     0,    95,     0,    95,
      86,     0,    86,     0,    93,     0,    93,    86,     0,    86,
       0,    87,     0,    86,    87,     0,   107,     0,    63,     6,
      89,    64,     0,    90,     0,    89,    90,     0,    11,     0,
      12,     0,    13,     0,    14,     0,    15,     0,    16,     0,
      17,     0,    18,     0,    19,     0,    20,     0,    21,     0,
      22,     0,    23,     0,    24,     0,    25,     0,    26,     0,
      27,     0,     0,    63,     7,    92,   175,    64,     0,     0,
      63,     8,    94,   175,    64,     0,    63,     9,    98,    64,
       0,     0,    63,    10,    97,   101,    64,     0,     0,    98,
      99,     0,     0,    63,   205,   100,   172,    64,     0,     0,
     102,     0,   102,   103,   101,     0,   105,     0,   102,   105,
       0,     0,    65,   104,   182,     0,     0,    63,   206,   106,
     172,    64,     0,     0,    63,    28,   207,   108,   109,   110,
      64,     0,     0,    29,    63,   172,    64,     0,   112,   111,
       0,   111,     0,     0,   113,     0,    30,   143,     0,    31,
     114,     0,   120,     0,    63,   188,   117,    64,     0,     0,
      63,   192,   115,    63,   172,    64,   114,    64,     0,     0,
      63,   186,   116,   143,   114,    64,     0,    63,   193,   118,
      64,     0,     0,   117,   114,     0,   119,   114,     0,   118,
     119,   114,     0,    61,     0,   151,     0,    63,   187,   151,
      64,     0,     0,    63,   122,   121,   164,   156,    64,     0,
     194,     0,   195,     0,   196,     0,   197,     0,   198,     0,
       0,    63,   183,    63,   185,   207,    64,    63,    32,   207,
      64,   124,   125,    64,     0,    88,   126,     0,   126,     0,
     128,   127,     0,   127,     0,   130,   138,     0,   138,     0,
       0,    63,    33,   129,   175,    64,     0,    63,    34,   131,
      64,     0,     0,   131,   132,     0,   153,     0,    63,    66,
     168,    61,    64,     0,    63,   193,   133,    64,     0,   119,
     134,     0,   133,   119,   134,     0,   136,     0,    63,   188,
     135,    64,     0,     0,   135,   136,     0,   153,     0,    63,
      66,   168,   137,    64,     0,    61,     0,    63,    35,   143,
      64,   139,     0,   140,     0,   140,     0,    63,    36,   166,
      64,   140,     0,     0,     0,    63,    37,   200,   141,   166,
      64,     0,     0,    63,    37,   199,   142,   166,    64,     0,
     151,     0,     0,    63,    66,   157,   144,   157,    64,     0,
       0,    63,   155,   145,   156,   156,    64,     0,    63,   187,
     143,    64,     0,    63,   188,   149,    64,     0,     0,    63,
     189,   146,   150,    64,     0,    63,   190,   143,   143,    64,
       0,     0,    63,   191,   147,    63,   172,    64,   143,    64,
       0,     0,    63,   192,   148,    63,   172,    64,   143,    64,
       0,     0,   149,   143,     0,     0,   150,   143,     0,     0,
      63,   205,   152,   170,    64,     0,   205,     0,     0,    63,
     205,   154,   171,    64,     0,   205,     0,    67,     0,    57,
       0,    58,     0,    68,     0,    61,     0,    63,    69,   156,
     156,    64,     0,    63,    65,   156,   163,    64,     0,    63,
      70,   156,   156,    64,     0,    63,    71,   156,   156,    64,
       0,   164,     0,    61,     0,     0,    63,    69,   158,   156,
     156,    64,     0,     0,    63,    65,   159,   156,   163,    64,
       0,     0,    63,    70,   160,   156,   156,    64,     0,     0,
      63,    71,   161,   156,   156,    64,     0,     0,    63,   206,
     162,   170,    64,     0,   207,     0,   208,     0,     0,   156,
       0,     0,    63,   206,   165,   170,    64,     0,   206,     0,
      61,     0,    63,    69,   166,   166,    64,     0,    63,    65,
     166,   167,    64,     0,    63,    70,   166,   166,    64,     0,
      63,    71,   166,   166,    64,     0,   168,     0,    38,     0,
       0,   166,     0,     0,    63,   206,   169,   171,    64,     0,
     206,     0,     0,   170,   207,     0,   170,   208,     0,     0,
     171,   207,     0,     0,   174,     0,     0,   174,   178,   173,
     172,     0,   208,     0,   174,   208,     0,     0,   177,     0,
       0,   177,   178,   176,   175,     0,   207,     0,   177,   207,
       0,     0,    65,   179,   180,     0,   202,     0,   204,     0,
      63,   203,   181,    64,     0,   202,     0,   204,     0,   181,
     202,     0,   181,   204,     0,   201,     0,     3,     0,     4,
       0,     5,     0,    39,     0,    40,     0,    41,     0,    42,
       0,    43,     0,    44,     0,    45,     0,    46,     0,    47,
       0,    48,     0,    49,     0,    50,     0,    51,     0,    52,
       0,    53,     0,    54,     0,    55,     0,    56,     0,     3,
       0,     4,     0,     5,     0,    56,     0,    52,     0,    53,
       0,    59,     0,   204,     0,    55,     0,    54,     0,   207,
       0,     3,     0,     4,     0,     5,     0,    54,     0,    55,
       0,    56,     0,    39,     0,    40,     0,    41,     0,    42,
       0,    43,     0,    44,     0,    45,     0,    46,     0,    47,
       0,    48,     0,    49,     0,    50,     0,    51,     0,    52,
       0,    53,     0,    59,     0,    60,     0
};

#endif

#if YYDEBUG
/* YYRLINE[YYN] -- source line where rule number YYN was defined. */
static const short yyrline[] =
{
       0,   304,   304,   308,   309,   310,   317,   317,   321,   322,
     323,   324,   327,   328,   329,   332,   333,   334,   335,   336,
     337,   338,   341,   342,   343,   344,   345,   348,   349,   350,
     351,   352,   355,   356,   357,   358,   359,   362,   363,   364,
     367,   368,   369,   372,   373,   374,   377,   378,   381,   384,
     387,   388,   391,   392,   393,   395,   397,   398,   400,   402,
     404,   405,   406,   407,   409,   411,   413,   419,   424,   434,
     434,   438,   438,   442,   445,   445,   452,   453,   456,   456,
     460,   461,   462,   465,   466,   469,   469,   472,   472,   480,
     480,   484,   485,   488,   489,   492,   493,   496,   499,   506,
     507,   508,   508,   510,   510,   512,   515,   516,   519,   524,
     528,   531,   532,   533,   533,   537,   538,   539,   540,   541,
     548,   548,   553,   554,   557,   558,   561,   562,   565,   565,
     569,   572,   573,   576,   577,   579,   583,   588,   592,   593,
     596,   597,   600,   601,   605,   608,   609,   612,   613,   617,
     618,   618,   620,   620,   627,   628,   628,   631,   631,   633,
     634,   635,   635,   636,   637,   637,   639,   639,   643,   644,
     647,   648,   651,   651,   653,   656,   656,   658,   661,   662,
     663,   664,   671,   672,   673,   674,   675,   676,   679,   681,
     681,   683,   683,   685,   685,   687,   687,   689,   689,   691,
     692,   695,   696,   699,   699,   701,   704,   705,   707,   709,
     711,   713,   714,   718,   719,   722,   722,   724,   732,   733,
     734,   737,   738,   741,   742,   743,   743,   746,   747,   750,
     751,   752,   752,   755,   756,   759,   759,   762,   763,   764,
     767,   768,   769,   770,   773,   780,   783,   786,   789,   792,
     795,   798,   801,   804,   807,   810,   813,   816,   819,   822,
     825,   828,   831,   834,   837,   840,   843,   843,   843,   844,
     845,   845,   846,   849,   850,   850,   853,   856,   856,   856,
     857,   857,   857,   858,   858,   858,   858,   858,   858,   858,
     858,   859,   859,   859,   859,   859,   860,   860,   861,   864
};
#endif


#if (YYDEBUG) || defined YYERROR_VERBOSE

/* YYTNAME[TOKEN_NUM] -- String name of the token TOKEN_NUM. */
static const char *const yytname[] =
{
  "$", "error", "$undefined.", "DEFINE", "DOMAIN_TOKEN", "PROBLEM", 
  "REQUIREMENTS", "TYPES", "CONSTANTS", "PREDICATES", "FUNCTIONS", 
  "STRIPS", "TYPING", "NEGATIVE_PRECONDITIONS", 
  "DISJUNCTIVE_PRECONDITIONS", "EQUALITY", "EXISTENTIAL_PRECONDITIONS", 
  "UNIVERSAL_PRECONDITIONS", "QUANTIFIED_PRECONDITIONS", 
  "CONDITIONAL_EFFECTS", "FLUENTS", "ADL", "DURATIVE_ACTIONS", 
  "DURATION_INEQUALITIES", "CONTINUOUS_EFFECTS", "PROBABILISTIC_EFFECTS", 
  "REWARDS", "MDP", "ACTION", "PARAMETERS", "PRECONDITION", "EFFECT", 
  "PDOMAIN", "OBJECTS", "INIT", "GOAL", "GOAL_REWARD", "METRIC", 
  "GOAL_PROBABILITY", "WHEN", "NOT", "AND", "OR", "IMPLY", "EXISTS", 
  "FORALL", "PROBABILISTIC", "ASSIGN", "SCALE_UP", "SCALE_DOWN", 
  "INCREASE", "DECREASE", "MINIMIZE", "MAXIMIZE", "NUMBER_TOKEN", 
  "OBJECT_TOKEN", "EITHER", "LE", "GE", "NAME", "VARIABLE", "NUMBER", 
  "ILLEGAL_TOKEN", "'('", "')'", "'-'", "'='", "'<'", "'>'", "'+'", "'*'", 
  "'/'", "file", "@1", "domains_and_problems", "domain_def", "@2", 
  "domain_body", "domain_body2", "domain_body3", "domain_body4", 
  "domain_body5", "domain_body6", "domain_body7", "domain_body8", 
  "domain_body9", "structure_defs", "structure_def", "require_def", 
  "require_keys", "require_key", "types_def", "@3", "constants_def", "@4", 
  "predicates_def", "functions_def", "@5", "predicate_decls", 
  "predicate_decl", "@6", "function_decls", "function_decl_seq", 
  "function_type_spec", "@7", "function_decl", "@8", "action_def", "@9", 
  "parameters", "action_body", "action_body2", "precondition", "effect", 
  "eff_formula", "@10", "@11", "eff_formulas", "prob_effs", "probability", 
  "p_effect", "@12", "assign_op", "problem_def", "@13", "problem_body", 
  "problem_body2", "problem_body3", "object_decl", "@14", "init", 
  "init_elements", "init_element", "prob_inits", "simple_init", 
  "one_inits", "one_init", "value", "goal_spec", "goal_reward", 
  "metric_spec", "@15", "@16", "formula", "@17", "@18", "@19", "@20", 
  "@21", "conjuncts", "disjuncts", "atomic_term_formula", "@22", 
  "atomic_name_formula", "@23", "binary_comp", "f_exp", "term_or_f_exp", 
  "@24", "@25", "@26", "@27", "@28", "opt_f_exp", "f_head", "@29", 
  "ground_f_exp", "opt_ground_f_exp", "ground_f_head", "@30", "terms", 
  "names", "variables", "@31", "variable_seq", "typed_names", "@32", 
  "name_seq", "type_spec", "@33", "type", "types", "function_type", 
  "define", "domain", "problem", "when", "not", "and", "or", "imply", 
  "exists", "forall", "probabilistic", "assign", "scale_up", "scale_down", 
  "increase", "decrease", "minimize", "maximize", "number", "object", 
  "either", "type_name", "predicate", "function", "name", "variable", 0
};
#endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives. */
static const short yyr1[] =
{
       0,    73,    72,    74,    74,    74,    76,    75,    77,    77,
      77,    77,    78,    78,    78,    79,    79,    79,    79,    79,
      79,    79,    80,    80,    80,    80,    80,    81,    81,    81,
      81,    81,    82,    82,    82,    82,    82,    83,    83,    83,
      84,    84,    84,    85,    85,    85,    86,    86,    87,    88,
      89,    89,    90,    90,    90,    90,    90,    90,    90,    90,
      90,    90,    90,    90,    90,    90,    90,    90,    90,    92,
      91,    94,    93,    95,    97,    96,    98,    98,   100,    99,
     101,   101,   101,   102,   102,   104,   103,   106,   105,   108,
     107,   109,   109,   110,   110,   111,   111,   112,   113,   114,
     114,   115,   114,   116,   114,   114,   117,   117,   118,   118,
     119,   120,   120,   121,   120,   122,   122,   122,   122,   122,
     124,   123,   125,   125,   126,   126,   127,   127,   129,   128,
     130,   131,   131,   132,   132,   132,   133,   133,   134,   134,
     135,   135,   136,   136,   137,   138,   138,   139,   139,   140,
     141,   140,   142,   140,   143,   144,   143,   145,   143,   143,
     143,   146,   143,   143,   147,   143,   148,   143,   149,   149,
     150,   150,   152,   151,   151,   154,   153,   153,   155,   155,
     155,   155,   156,   156,   156,   156,   156,   156,   157,   158,
     157,   159,   157,   160,   157,   161,   157,   162,   157,   157,
     157,   163,   163,   165,   164,   164,   166,   166,   166,   166,
     166,   166,   166,   167,   167,   169,   168,   168,   170,   170,
     170,   171,   171,   172,   172,   173,   172,   174,   174,   175,
     175,   176,   175,   177,   177,   179,   178,   180,   180,   180,
     181,   181,   181,   181,   182,   183,   184,   185,   186,   187,
     188,   189,   190,   191,   192,   193,   194,   195,   196,   197,
     198,   199,   200,   201,   202,   203,   204,   204,   204,   204,
     204,   204,   204,   205,   205,   205,   206,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   208
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN. */
static const short yyr2[] =
{
       0,     0,     2,     0,     2,     2,     0,     9,     0,     1,
       2,     1,     1,     2,     1,     1,     1,     1,     2,     2,
       2,     1,     1,     1,     2,     2,     1,     1,     1,     2,
       2,     1,     1,     1,     2,     2,     1,     1,     2,     1,
       1,     2,     1,     1,     2,     1,     1,     2,     1,     4,
       1,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       5,     0,     5,     4,     0,     5,     0,     2,     0,     5,
       0,     1,     3,     1,     2,     0,     3,     0,     5,     0,
       7,     0,     4,     2,     1,     0,     1,     2,     2,     1,
       4,     0,     8,     0,     6,     4,     0,     2,     2,     3,
       1,     1,     4,     0,     6,     1,     1,     1,     1,     1,
       0,    13,     2,     1,     2,     1,     2,     1,     0,     5,
       4,     0,     2,     1,     5,     4,     2,     3,     1,     4,
       0,     2,     1,     5,     1,     5,     1,     1,     5,     0,
       0,     6,     0,     6,     1,     0,     6,     0,     6,     4,
       4,     0,     5,     5,     0,     8,     0,     8,     0,     2,
       0,     2,     0,     5,     1,     0,     5,     1,     1,     1,
       1,     1,     1,     5,     5,     5,     5,     1,     1,     0,
       6,     0,     6,     0,     6,     0,     6,     0,     5,     1,
       1,     0,     1,     0,     5,     1,     1,     5,     5,     5,
       5,     1,     1,     0,     1,     0,     5,     1,     0,     2,
       2,     0,     2,     0,     1,     0,     4,     1,     2,     0,
       1,     0,     4,     1,     2,     0,     3,     1,     1,     4,
       1,     1,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[S] -- default rule to reduce with in state S when YYTABLE
   doesn't specify something else to do.  Zero means the default is an
   error. */
static const short yydefact[] =
{
       1,     3,     2,     0,     4,     5,   245,     0,     0,   246,
     247,     0,     0,   277,   278,   279,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   280,   281,   282,   298,     0,     0,     6,     0,     8,
       0,     0,     0,    11,    14,    21,    46,     9,    12,    15,
      16,    17,    48,     0,     0,    69,    71,    76,    74,     0,
       7,     0,    47,     0,    10,     0,    13,     0,    18,    26,
      22,    23,     0,    19,    31,    27,    28,     0,    20,    36,
      32,    33,     0,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
       0,    50,   229,   229,     0,    80,    89,     0,    24,    39,
      37,     0,    25,    42,    40,    29,     0,    30,    45,    43,
      34,    35,   120,    49,    51,     0,   230,   233,     0,     0,
      73,    77,     0,     0,    81,    83,    91,    38,    41,    44,
     149,    70,   235,   231,   234,    72,   266,   267,   268,   270,
     271,   275,   274,   269,   272,   273,    78,    87,   276,    75,
      85,    80,    84,     0,    95,     0,   149,     0,   123,   125,
     149,   149,   127,   146,     0,   229,   223,   223,     0,    82,
     223,     0,     0,     0,    94,    95,    96,   128,   131,     0,
       0,     0,   122,   121,     0,   124,     0,   126,   264,     0,
     236,   237,   238,   232,   299,     0,   224,   227,     0,   263,
      86,   244,     0,     0,    97,   154,   174,     0,    98,    99,
     111,    90,    93,   229,     0,     0,   261,   262,   152,   150,
     265,     0,    79,   225,   228,    88,    92,   249,   250,   251,
     252,   253,   254,   179,   180,     0,   178,   181,   157,     0,
     168,   161,     0,   164,   166,   172,   248,   255,   256,   257,
     258,   259,   260,   113,   103,     0,   106,   101,     0,   115,
     116,   117,   118,   119,     0,     0,   130,   132,   133,   177,
     149,     0,     0,     0,   240,   241,   223,   188,     0,   155,
     199,   200,     0,     0,     0,   170,     0,     0,     0,   218,
       0,     0,     0,     0,     0,     0,   110,     0,     0,   129,
       0,     0,   175,     0,   145,   147,   212,   206,     0,     0,
     211,   217,     0,   239,   242,   243,   226,   191,   189,   193,
     195,   197,     0,   182,     0,     0,   187,   205,   159,   160,
     169,     0,     0,   223,   223,     0,     0,     0,     0,   112,
     100,   107,   223,   105,     0,   108,     0,     0,     0,     0,
     221,     0,     0,     0,     0,     0,   215,   153,   151,     0,
       0,     0,     0,   218,     0,     0,     0,     0,     0,   203,
       0,   162,   171,   163,     0,     0,   173,   219,   220,     0,
       0,     0,   109,     0,     0,   136,   138,   142,   135,     0,
       0,     0,   213,     0,     0,     0,   221,   201,     0,     0,
       0,     0,   156,   201,     0,     0,     0,   218,   158,     0,
       0,   114,   104,     0,   134,     0,   140,   137,   176,   222,
     149,   214,     0,     0,     0,     0,     0,   202,     0,     0,
       0,     0,   198,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   148,   208,   207,   209,   210,   216,
     192,   190,   194,   196,   184,   183,   185,   186,   204,   165,
     167,   102,   144,     0,     0,   139,   141,   143,     0,     0,
       0
};

static const short yydefgoto[] =
{
     478,     1,     2,     4,    39,    42,    43,    44,    68,    73,
      78,   108,   112,   117,    45,    46,    47,   100,   101,    48,
     102,    49,   103,    50,    51,   105,   104,   131,   176,   133,
     134,   161,   178,   135,   177,    52,   136,   164,   183,   184,
     185,   186,   218,   305,   301,   304,   307,   308,   219,   300,
     263,     5,   140,   167,   168,   169,   170,   223,   171,   224,
     277,   359,   395,   452,   396,   473,   172,   314,   173,   282,
     281,   214,   332,   292,   295,   297,   298,   294,   341,   215,
     299,   397,   360,   248,   437,   289,   370,   369,   371,   372,
     373,   438,   336,   417,   319,   432,   320,   406,   345,   400,
     205,   286,   206,   125,   175,   126,   143,   174,   200,   283,
     210,     7,    11,    12,   264,   249,   250,   251,   252,   253,
     254,   268,   269,   270,   271,   272,   273,   228,   229,   211,
     201,   231,   155,   216,   337,   158,   207
};

static const short yypact[] =
{
  -32768,-32768,   -22,    44,-32768,-32768,-32768,    -7,    78,-32768,
  -32768,  1022,  1022,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,    -4,     0,-32768,    14,    26,
      81,   179,    55,-32768,-32768,    65,-32768,    90,   109,   115,
     118,   120,-32768,  1022,   482,-32768,-32768,-32768,-32768,  1022,
  -32768,    95,-32768,   191,-32768,    60,-32768,    21,-32768,    65,
     127,   128,    70,-32768,    65,   127,   130,   113,-32768,    65,
     128,   130,   107,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
     842,-32768,  1022,  1022,    43,   131,-32768,    15,-32768,    65,
      65,    11,-32768,    65,    65,-32768,    57,-32768,    65,    65,
  -32768,-32768,-32768,-32768,-32768,   138,   486,-32768,   139,  1030,
  -32768,-32768,  1022,   140,   -31,-32768,   148,    65,    65,    65,
     142,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,   131,-32768,   143,   116,    17,   150,   145,-32768,-32768,
     151,   152,-32768,-32768,   957,  1022,   119,   119,   157,-32768,
     119,   940,   952,   154,-32768,   192,-32768,-32768,-32768,   940,
     114,   126,-32768,-32768,   108,-32768,   100,-32768,-32768,   168,
  -32768,-32768,-32768,-32768,-32768,   161,   -27,-32768,   164,-32768,
  -32768,-32768,   165,   249,-32768,-32768,-32768,  1054,-32768,-32768,
  -32768,-32768,-32768,  1022,   658,   169,-32768,-32768,-32768,-32768,
  -32768,  1087,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,   758,-32768,-32768,-32768,   940,
  -32768,-32768,   940,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,   985,-32768,-32768,   171,-32768,
  -32768,-32768,-32768,-32768,   176,   277,-32768,-32768,-32768,-32768,
     178,   785,   785,   335,-32768,-32768,   119,-32768,   309,-32768,
  -32768,-32768,   846,   183,   688,-32768,   940,   185,   186,-32768,
     871,   940,  1030,   187,   701,   194,-32768,    53,   952,-32768,
     928,   171,-32768,   132,-32768,-32768,-32768,-32768,   368,   195,
  -32768,-32768,   197,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,   758,-32768,   401,   846,-32768,-32768,-32768,-32768,
  -32768,   715,   198,   119,   119,   515,  1022,   846,   952,-32768,
  -32768,-32768,   119,-32768,   952,-32768,  1022,   181,   997,    93,
  -32768,   785,   785,   785,   785,   785,-32768,-32768,-32768,   846,
     846,   846,   846,-32768,   199,   846,   846,   846,   846,-32768,
     200,-32768,-32768,-32768,   202,   204,-32768,-32768,-32768,   205,
     206,   207,-32768,   209,   426,-32768,-32768,-32768,-32768,   997,
     601,   210,   785,   785,   785,   785,-32768,   846,   846,   846,
     846,   543,-32768,   846,   846,   846,   846,-32768,-32768,   940,
     940,-32768,-32768,   952,-32768,   928,-32768,-32768,-32768,-32768,
     212,-32768,   219,   220,   221,   222,   631,-32768,   223,   224,
     231,   232,-32768,   233,   234,   236,   245,   573,   246,   247,
     254,   189,   728,   218,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,   255,   458,-32768,-32768,-32768,   258,   320,
  -32768
};

static const short yypgoto[] =
{
  -32768,-32768,-32768,-32768,-32768,-32768,   275,   276,-32768,-32768,
  -32768,   251,   248,   256,   146,   -34,   201,-32768,   227,-32768,
  -32768,   -23,-32768,   -25,   -13,-32768,-32768,-32768,-32768,   174,
  -32768,-32768,-32768,   208,-32768,-32768,-32768,-32768,-32768,   159,
  -32768,-32768,  -287,-32768,-32768,-32768,-32768,  -293,-32768,-32768,
  -32768,-32768,-32768,-32768,   180,   175,-32768,-32768,-32768,-32768,
  -32768,-32768,   -33,-32768,   -85,-32768,   211,-32768,  -272,-32768,
  -32768,  -176,-32768,-32768,-32768,-32768,-32768,-32768,-32768,  -178,
  -32768,   153,-32768,-32768,  -276,    37,-32768,-32768,-32768,-32768,
  -32768,   -43,    75,-32768,  -253,-32768,  -298,-32768,  -354,   -30,
    -170,-32768,-32768,   -94,-32768,-32768,   177,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,   167,  -214,-32768,-32768,-32768,
     184,   106,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
    -209,-32768,  -159,  -127,  -126,   -11,  -201
};


#define	YYLAST		1146


static const short yytable[] =
{
      35,    36,   156,   266,   220,   234,   157,   208,   315,   128,
     212,    62,   357,   225,   354,   202,   335,   351,   358,   411,
      57,   355,   284,    54,    70,    58,    81,    75,    80,   322,
      57,    58,   132,   204,   160,    62,    71,    76,   142,    59,
      62,     3,    82,    59,   291,    62,   114,     6,   106,    59,
     187,   188,   189,   119,   190,   114,     8,   110,   119,   380,
      37,   390,   110,   447,    38,    56,   399,   392,    56,    57,
      58,   389,   285,   293,   324,    62,   296,    40,    56,    62,
      58,   203,     9,    10,    62,    59,   255,   303,    59,    41,
     255,   127,   127,   407,   408,   409,   410,   279,    59,   413,
     414,   415,   416,    62,    62,    62,   129,   130,   401,   402,
     403,   404,   405,    53,   306,   144,   326,   353,   340,    60,
     342,    56,    57,    59,   325,   348,   220,   451,    61,   274,
     220,   291,   439,   440,   441,   189,   450,   190,   444,   445,
     446,    59,   188,   189,   388,   190,   181,   182,   312,   431,
     433,   434,   435,    63,   306,   321,   321,   398,   454,   187,
     188,   189,   331,   190,   127,   382,   226,   227,   361,   190,
     220,   122,    65,   384,   385,   255,   220,   163,    67,   204,
     426,    72,   391,    77,   321,    54,    55,    56,    57,    58,
     107,   111,   366,   116,   132,    69,    74,    79,    55,    56,
      57,    58,   141,   145,   159,   165,   180,    59,   379,   193,
     388,   209,   127,   191,   194,   196,   109,   113,   221,    59,
     379,   109,   118,   182,   230,   232,   113,   118,   235,   236,
     366,   279,   306,   280,   290,   321,   321,   321,   321,   321,
     309,   313,   393,   448,   449,   220,   388,   338,   343,   344,
     472,   349,   146,   147,   148,   190,   137,   352,   479,   367,
     138,   368,   383,   412,   418,   139,   419,   312,   420,   421,
     422,   423,   279,   424,   430,   453,   321,   321,   321,   321,
     146,   147,   148,   455,   456,   457,   458,   460,   461,   237,
     238,   239,   240,   241,   242,   462,   463,   464,   465,   321,
     466,   149,   150,   151,   152,   153,   243,   244,   154,   467,
     469,   470,    13,    14,    15,   245,   246,   247,   471,   477,
     480,   290,    64,   257,    66,   279,   115,   124,   120,   149,
     150,   151,   152,   153,   387,   179,   154,   121,   146,   147,
     148,   166,   162,   310,   222,   195,   192,   312,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,   427,   476,    34,   374,
     443,    13,    14,    15,   327,   347,   436,   278,   328,   329,
     330,   311,   197,   233,   265,     0,     0,   149,   150,   429,
     198,   153,     0,     0,   154,     0,     0,     0,     0,   323,
     387,   267,     0,     0,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,   429,     0,    34,     0,   146,
     147,   148,     0,   362,     0,     0,   387,   363,   364,   365,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,     0,     0,
      34,   146,   147,   148,     0,     0,   375,   238,     0,     0,
     376,   377,   378,     0,     0,     0,     0,     0,   149,   150,
     151,   152,   153,     0,     0,   154,     0,     0,     0,    13,
      14,    15,   425,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     149,   150,   151,   152,   153,     0,     0,   154,    13,    14,
      15,     0,     0,     0,   425,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,     0,     0,    34,    13,    14,    15,     0,
       0,   142,     0,     0,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,     0,     0,    34,   204,    13,    14,    15,   386,
       0,     0,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
       0,     0,    34,   204,    13,    14,    15,   442,     0,     0,
       0,     0,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
       0,     0,    34,   204,    13,    14,    15,   468,     0,     0,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,     0,     0,
      34,   146,   147,   148,     0,   428,     0,     0,     0,     0,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,     0,     0,
      34,   146,   147,   148,     0,   459,     0,     0,     0,     0,
       0,     0,     0,     0,   146,   147,   148,     0,     0,     0,
     149,   150,   151,   152,   153,     0,     0,   154,   146,   147,
     148,   275,   276,     0,     0,     0,     0,     0,     0,     0,
       0,   146,   147,   148,     0,     0,     0,     0,     0,     0,
     149,   150,   151,   152,   153,     0,     0,   154,     0,     0,
       0,   213,   339,   149,   150,   151,   152,   153,     0,     0,
     154,    13,    14,    15,   217,   350,     0,   149,   150,   151,
     152,   153,     0,     0,   154,     0,     0,     0,   213,   381,
     149,   150,   151,   152,   153,     0,     0,   154,    13,    14,
      15,   474,   475,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,     0,     0,    34,   204,   287,
       0,   288,     0,   316,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,     0,     0,    34,     0,   317,     0,   318,    13,
      14,    15,     0,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
       0,     0,     0,     0,    13,    14,    15,     0,     0,     0,
       0,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,     0,     0,    34,   123,   333,     0,   334,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,     0,     0,
      34,    13,    14,    15,   346,     0,     0,     0,     0,     0,
       0,     0,     0,   146,   147,   148,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   146,   147,   148,     0,     0,
     146,   147,   148,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,     0,     0,    34,   146,   147,
     148,   356,   149,   150,   151,   152,   153,     0,     0,   154,
     146,   147,   148,   213,   149,   150,   151,   152,   153,   149,
     150,   154,   198,   153,     0,   217,   154,     0,     0,     0,
     199,     0,     0,     0,     0,    13,    14,    15,     0,     0,
       0,     0,     0,   146,   147,   148,     0,   149,   150,   151,
     152,   153,     0,     0,   154,     0,     0,     0,   302,   149,
     150,   151,   152,   153,     0,     0,   154,   146,   147,   148,
     394,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,     0,
       0,    34,   149,   150,   151,   152,   153,     0,     0,   154,
     146,   147,   148,   256,   237,   238,     0,     0,     0,   242,
     257,   258,   259,   260,   261,   262,   149,   150,   151,   152,
     153,     0,     0,   154,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   149,
     150,     0,   198,   153,     0,     0,   154
};

static const short yycheck[] =
{
      11,    12,   129,   217,   182,   206,   132,   177,   280,   103,
     180,    45,   310,   189,   307,   174,   292,   304,   311,   373,
       9,   308,   231,     6,    49,    10,    51,    50,    51,   282,
       9,    10,    63,    60,    65,    69,    49,    50,    65,    28,
      74,    63,    53,    28,   245,    79,    71,     3,    59,    28,
      33,    34,    35,    76,    37,    80,    63,    70,    81,   335,
      64,   348,    75,   417,    64,     8,   359,   354,     8,     9,
      10,   347,   231,   249,   283,   109,   252,    63,     8,   113,
      10,   175,     4,     5,   118,    28,   213,   265,    28,    63,
     217,   102,   103,   369,   370,   371,   372,   224,    28,   375,
     376,   377,   378,   137,   138,   139,    63,    64,   361,   362,
     363,   364,   365,    32,    61,   126,   286,    64,   294,    64,
     296,     8,     9,    28,   283,   301,   304,   425,    63,   223,
     308,   332,   408,   409,   410,    35,   423,    37,   414,   415,
     416,    28,    34,    35,   345,    37,    30,    31,   275,   402,
     403,   404,   405,    63,    61,   281,   282,    64,   430,    33,
      34,    35,   288,    37,   175,   341,    52,    53,    36,    37,
     348,    64,    63,   343,   344,   302,   354,    29,    63,    60,
     394,    63,   352,    63,   310,     6,     7,     8,     9,    10,
      63,    63,   318,    63,    63,    49,    50,    51,     7,     8,
       9,    10,    64,    64,    64,    63,    63,    28,   334,    64,
     411,    54,   223,    63,    63,    63,    70,    71,    64,    28,
     346,    75,    76,    31,    56,    64,    80,    81,    64,    64,
     356,   358,    61,    64,   245,   361,   362,   363,   364,   365,
      64,    63,    61,   419,   420,   423,   447,    64,    63,    63,
      61,    64,     3,     4,     5,    37,   110,    63,     0,    64,
     114,    64,    64,    64,    64,   119,    64,   394,    64,    64,
      64,    64,   399,    64,    64,    63,   402,   403,   404,   405,
       3,     4,     5,    64,    64,    64,    64,    64,    64,    40,
      41,    42,    43,    44,    45,    64,    64,    64,    64,   425,
      64,    52,    53,    54,    55,    56,    57,    58,    59,    64,
      64,    64,     3,     4,     5,    66,    67,    68,    64,    64,
       0,   332,    47,    46,    48,   452,    75,   100,    80,    52,
      53,    54,    55,    56,   345,   161,    59,    81,     3,     4,
       5,   140,   134,    66,   185,   170,   166,   474,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,   399,   452,    59,   332,
     413,     3,     4,     5,    65,   300,   406,   224,    69,    70,
      71,   275,   171,   206,   217,    -1,    -1,    52,    53,   400,
      55,    56,    -1,    -1,    59,    -1,    -1,    -1,    -1,    64,
     411,   217,    -1,    -1,     3,     4,     5,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,   436,    -1,    59,    -1,     3,
       4,     5,    -1,    65,    -1,    -1,   447,    69,    70,    71,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    -1,    -1,
      59,     3,     4,     5,    -1,    -1,    65,    41,    -1,    -1,
      69,    70,    71,    -1,    -1,    -1,    -1,    -1,    52,    53,
      54,    55,    56,    -1,    -1,    59,    -1,    -1,    -1,     3,
       4,     5,    66,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      52,    53,    54,    55,    56,    -1,    -1,    59,     3,     4,
       5,    -1,    -1,    -1,    66,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    -1,    -1,    59,     3,     4,     5,    -1,
      -1,    65,    -1,    -1,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    -1,    -1,    59,    60,     3,     4,     5,    64,
      -1,    -1,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      -1,    -1,    59,    60,     3,     4,     5,    64,    -1,    -1,
      -1,    -1,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      -1,    -1,    59,    60,     3,     4,     5,    64,    -1,    -1,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    -1,    -1,
      59,     3,     4,     5,    -1,    64,    -1,    -1,    -1,    -1,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    -1,    -1,
      59,     3,     4,     5,    -1,    64,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,     4,     5,    -1,    -1,    -1,
      52,    53,    54,    55,    56,    -1,    -1,    59,     3,     4,
       5,    63,    64,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      52,    53,    54,    55,    56,    -1,    -1,    59,    -1,    -1,
      -1,    63,    64,    52,    53,    54,    55,    56,    -1,    -1,
      59,     3,     4,     5,    63,    64,    -1,    52,    53,    54,
      55,    56,    -1,    -1,    59,    -1,    -1,    -1,    63,    64,
      52,    53,    54,    55,    56,    -1,    -1,    59,     3,     4,
       5,    63,    64,    -1,    -1,    -1,    -1,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    -1,    -1,    59,    60,    61,
      -1,    63,    -1,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    -1,    -1,    59,    -1,    61,    -1,    63,     3,
       4,     5,    -1,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      -1,    -1,    -1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    -1,    -1,    59,    64,    61,    -1,    63,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    -1,    -1,
      59,     3,     4,     5,    63,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,     4,     5,    -1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    -1,    -1,    59,     3,     4,
       5,    63,    52,    53,    54,    55,    56,    -1,    -1,    59,
       3,     4,     5,    63,    52,    53,    54,    55,    56,    52,
      53,    59,    55,    56,    -1,    63,    59,    -1,    -1,    -1,
      63,    -1,    -1,    -1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,     3,     4,     5,    -1,    52,    53,    54,
      55,    56,    -1,    -1,    59,    -1,    -1,    -1,    63,    52,
      53,    54,    55,    56,    -1,    -1,    59,     3,     4,     5,
      63,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    -1,
      -1,    59,    52,    53,    54,    55,    56,    -1,    -1,    59,
       3,     4,     5,    39,    40,    41,    -1,    -1,    -1,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    -1,    -1,    59,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      53,    -1,    55,    56,    -1,    -1,    59
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison/bison.simple"

/* Skeleton output parser for bison,

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software
   Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* This is the parser code that is written into each bison parser when
   the %semantic_parser declaration is not specified in the grammar.
   It was written by Richard Stallman by simplifying the hairy parser
   used when %semantic_parser is specified.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

#if ! defined (yyoverflow) || defined (YYERROR_VERBOSE)

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# if YYSTACK_USE_ALLOCA
#  define YYSTACK_ALLOC alloca
# else
#  ifndef YYSTACK_USE_ALLOCA
#   if defined (alloca) || defined (_ALLOCA_H)
#    define YYSTACK_ALLOC alloca
#   else
#    ifdef __GNUC__
#     define YYSTACK_ALLOC __builtin_alloca
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC malloc
#  define YYSTACK_FREE free
# endif
#endif /* ! defined (yyoverflow) || defined (YYERROR_VERBOSE) */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
# if YYLSP_NEEDED
  YYLTYPE yyls;
# endif
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# if YYLSP_NEEDED
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE) + sizeof (YYLTYPE))	\
      + 2 * YYSTACK_GAP_MAX)
# else
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)
# endif

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (0)
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif


#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	goto yyacceptlab
#define YYABORT 	goto yyabortlab
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");			\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).

   When YYLLOC_DEFAULT is run, CURRENT is set the location of the
   first token.  By default, to implement support for ranges, extend
   its range to the last symbol.  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)       	\
   Current.last_line   = Rhs[N].last_line;	\
   Current.last_column = Rhs[N].last_column;
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#if YYPURE
# if YYLSP_NEEDED
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, &yylloc, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval, &yylloc)
#  endif
# else /* !YYLSP_NEEDED */
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval)
#  endif
# endif /* !YYLSP_NEEDED */
#else /* !YYPURE */
# define YYLEX			yylex ()
#endif /* !YYPURE */


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (0)
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
#endif /* !YYDEBUG */

/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif

#ifdef YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif
#endif

#line 315 "/usr/share/bison/bison.simple"


/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL
# else
#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
# endif
#else /* !YYPARSE_PARAM */
# define YYPARSE_PARAM_ARG
# define YYPARSE_PARAM_DECL
#endif /* !YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
# ifdef YYPARSE_PARAM
int yyparse (void *);
# else
int yyparse (void);
# endif
#endif

/* YY_DECL_VARIABLES -- depending whether we use a pure parser,
   variables are global, or local to YYPARSE.  */

#define YY_DECL_NON_LSP_VARIABLES			\
/* The lookahead symbol.  */				\
int yychar;						\
							\
/* The semantic value of the lookahead symbol. */	\
YYSTYPE yylval;						\
							\
/* Number of parse errors so far.  */			\
int yynerrs;

#if YYLSP_NEEDED
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES			\
						\
/* Location data for the lookahead symbol.  */	\
YYLTYPE yylloc;
#else
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES
#endif


/* If nonreentrant, generate the variables here. */

#if !YYPURE
YY_DECL_VARIABLES
#endif  /* !YYPURE */

int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* If reentrant, generate the variables here. */
#if YYPURE
  YY_DECL_VARIABLES
#endif  /* !YYPURE */

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yychar1 = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack. */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;

#if YYLSP_NEEDED
  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
#endif

#if YYLSP_NEEDED
# define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
# define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  YYSIZE_T yystacksize = YYINITDEPTH;


  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
#if YYLSP_NEEDED
  YYLTYPE yyloc;
#endif

  /* When reducing, the number of symbols on the RHS of the reduced
     rule. */
  int yylen;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
#if YYLSP_NEEDED
  yylsp = yyls;
#endif
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  */
# if YYLSP_NEEDED
	YYLTYPE *yyls1 = yyls;
	/* This used to be a conditional around just the two extra args,
	   but that might be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
# else
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);
# endif
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
# if YYLSP_NEEDED
	YYSTACK_RELOCATE (yyls);
# endif
# undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
#if YYLSP_NEEDED
      yylsp = yyls + yysize - 1;
#endif

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

#if YYDEBUG
     /* We have to keep this `#if YYDEBUG', since we use variables
	which are defined only if `YYDEBUG' is set.  */
      if (yydebug)
	{
	  YYFPRINTF (stderr, "Next token is %d (%s",
		     yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise
	     meaning of a token, for further debugging info.  */
# ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
# endif
	  YYFPRINTF (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to the semantic value of
     the lookahead token.  This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

#if YYLSP_NEEDED
  /* Similarly for the default location.  Let the user run additional
     commands if for instance locations are ranges.  */
  yyloc = yylsp[1-yylen];
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
#endif

#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] > 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif

  switch (yyn) {

case 1:
#line 304 "parser.yy"
{ success = true; line_number = 1; }
    break;
case 2:
#line 305 "parser.yy"
{ if (!success) YYERROR; }
    break;
case 6:
#line 317 "parser.yy"
{ make_domain(yyvsp[-1].str); }
    break;
case 52:
#line 391 "parser.yy"
{ requirements->strips = true; }
    break;
case 53:
#line 392 "parser.yy"
{ requirements->typing = true; }
    break;
case 54:
#line 394 "parser.yy"
{ requirements->negative_preconditions = true; }
    break;
case 55:
#line 396 "parser.yy"
{ requirements->disjunctive_preconditions = true; }
    break;
case 56:
#line 397 "parser.yy"
{ requirements->equality = true; }
    break;
case 57:
#line 399 "parser.yy"
{ requirements->existential_preconditions = true; }
    break;
case 58:
#line 401 "parser.yy"
{ requirements->universal_preconditions = true; }
    break;
case 59:
#line 403 "parser.yy"
{ requirements->quantified_preconditions(); }
    break;
case 60:
#line 404 "parser.yy"
{ requirements->conditional_effects = true; }
    break;
case 61:
#line 405 "parser.yy"
{ requirements->fluents = true; }
    break;
case 62:
#line 406 "parser.yy"
{ requirements->adl(); }
    break;
case 63:
#line 408 "parser.yy"
{ throw Exception("`:durative-actions' not supported"); }
    break;
case 64:
#line 410 "parser.yy"
{ throw Exception("`:duration-inequalities' not supported"); }
    break;
case 65:
#line 412 "parser.yy"
{ throw Exception("`:continuous-effects' not supported"); }
    break;
case 66:
#line 414 "parser.yy"
{
		  requirements->probabilistic_effects = true;
		  goal_prob_function =
		    domain->functions().add_function("goal-probability");
		}
    break;
case 67:
#line 420 "parser.yy"
{
		  requirements->rewards = true;
		  reward_function = domain->functions().add_function("reward");
		}
    break;
case 68:
#line 425 "parser.yy"
{
		  requirements->probabilistic_effects = true;
		  requirements->rewards = true;
		  goal_prob_function =
		    domain->functions().add_function("goal-probability");
		  reward_function = domain->functions().add_function("reward");
		}
    break;
case 69:
#line 434 "parser.yy"
{ require_typing(); name_kind = TYPE_KIND; }
    break;
case 70:
#line 435 "parser.yy"
{ name_kind = VOID_KIND; }
    break;
case 71:
#line 438 "parser.yy"
{ name_kind = CONSTANT_KIND; }
    break;
case 72:
#line 439 "parser.yy"
{ name_kind = VOID_KIND; }
    break;
case 74:
#line 445 "parser.yy"
{ require_fluents(); }
    break;
case 78:
#line 456 "parser.yy"
{ make_predicate(yyvsp[0].str); }
    break;
case 79:
#line 457 "parser.yy"
{ parsing_predicate = false; }
    break;
case 85:
#line 469 "parser.yy"
{ require_typing(); }
    break;
case 87:
#line 472 "parser.yy"
{ make_function(yyvsp[0].str); }
    break;
case 88:
#line 473 "parser.yy"
{ parsing_function = false; }
    break;
case 89:
#line 480 "parser.yy"
{ make_action(yyvsp[0].str); }
    break;
case 90:
#line 481 "parser.yy"
{ add_action(); }
    break;
case 97:
#line 496 "parser.yy"
{ action->set_precondition(*yyvsp[0].formula); }
    break;
case 98:
#line 499 "parser.yy"
{ action->set_effect(*yyvsp[0].effect); }
    break;
case 100:
#line 507 "parser.yy"
{ yyval.effect = yyvsp[-1].ceffect; }
    break;
case 101:
#line 508 "parser.yy"
{ prepare_forall_effect(); }
    break;
case 102:
#line 509 "parser.yy"
{ yyval.effect = make_forall_effect(*yyvsp[-1].effect); }
    break;
case 103:
#line 510 "parser.yy"
{ require_conditional_effects(); }
    break;
case 104:
#line 511 "parser.yy"
{ yyval.effect = &ConditionalEffect::make(*yyvsp[-2].formula, *yyvsp[-1].effect); }
    break;
case 105:
#line 512 "parser.yy"
{ yyval.effect = yyvsp[-1].peffect; }
    break;
case 106:
#line 515 "parser.yy"
{ yyval.ceffect = new ConjunctiveEffect(); }
    break;
case 107:
#line 516 "parser.yy"
{ yyval.ceffect = yyvsp[-1].ceffect; yyval.ceffect->add_conjunct(*yyvsp[0].effect); }
    break;
case 108:
#line 520 "parser.yy"
{
		yyval.peffect = new ProbabilisticEffect();
		add_effect_outcome(*yyval.peffect, yyvsp[-1].num, *yyvsp[0].effect);
	      }
    break;
case 109:
#line 525 "parser.yy"
{ yyval.peffect = yyvsp[-2].peffect; add_effect_outcome(*yyval.peffect, yyvsp[-1].num, *yyvsp[0].effect); }
    break;
case 111:
#line 531 "parser.yy"
{ yyval.effect = make_add_effect(*yyvsp[0].atom); }
    break;
case 112:
#line 532 "parser.yy"
{ yyval.effect = make_delete_effect(*yyvsp[-1].atom); }
    break;
case 113:
#line 533 "parser.yy"
{ effect_fluent = true; }
    break;
case 114:
#line 534 "parser.yy"
{ yyval.effect = make_assignment_effect(yyvsp[-4].setop, *yyvsp[-2].appl, *yyvsp[-1].expr); }
    break;
case 115:
#line 537 "parser.yy"
{ yyval.setop = Assignment::ASSIGN_OP; }
    break;
case 116:
#line 538 "parser.yy"
{ yyval.setop = Assignment::SCALE_UP_OP; }
    break;
case 117:
#line 539 "parser.yy"
{ yyval.setop = Assignment::SCALE_DOWN_OP; }
    break;
case 118:
#line 540 "parser.yy"
{ yyval.setop = Assignment::INCREASE_OP; }
    break;
case 119:
#line 541 "parser.yy"
{ yyval.setop = Assignment::DECREASE_OP; }
    break;
case 120:
#line 549 "parser.yy"
{ make_problem(yyvsp[-5].str, yyvsp[-1].str); }
    break;
case 121:
#line 550 "parser.yy"
{ problem->instantiate_actions(); delete requirements; }
    break;
case 128:
#line 565 "parser.yy"
{ name_kind = OBJECT_KIND; }
    break;
case 129:
#line 566 "parser.yy"
{ name_kind = VOID_KIND; }
    break;
case 133:
#line 576 "parser.yy"
{ problem->add_init_atom(*yyvsp[0].atom); }
    break;
case 134:
#line 578 "parser.yy"
{ problem->add_init_value(*yyvsp[-2].appl, *yyvsp[-1].num); delete yyvsp[-1].num; }
    break;
case 135:
#line 580 "parser.yy"
{ problem->add_init_effect(*yyvsp[-1].peffect); }
    break;
case 136:
#line 584 "parser.yy"
{
		 yyval.peffect = new ProbabilisticEffect();
		 add_effect_outcome(*yyval.peffect, yyvsp[-1].num, *yyvsp[0].effect);
	       }
    break;
case 137:
#line 589 "parser.yy"
{ yyval.peffect = yyvsp[-2].peffect; add_effect_outcome(*yyval.peffect, yyvsp[-1].num, *yyvsp[0].effect); }
    break;
case 139:
#line 593 "parser.yy"
{ yyval.effect = yyvsp[-1].ceffect; }
    break;
case 140:
#line 596 "parser.yy"
{ yyval.ceffect = new ConjunctiveEffect(); }
    break;
case 141:
#line 597 "parser.yy"
{ yyval.ceffect = yyvsp[-1].ceffect; yyval.ceffect->add_conjunct(*yyvsp[0].effect); }
    break;
case 142:
#line 600 "parser.yy"
{ yyval.effect = make_add_effect(*yyvsp[0].atom); }
    break;
case 143:
#line 602 "parser.yy"
{ yyval.effect = make_assignment_effect(Assignment::ASSIGN_OP, *yyvsp[-2].appl, *yyvsp[-1].expr); }
    break;
case 144:
#line 605 "parser.yy"
{ yyval.expr = new Value(*yyvsp[0].num); delete yyvsp[0].num; }
    break;
case 145:
#line 608 "parser.yy"
{ problem->set_goal(*yyvsp[-2].formula); }
    break;
case 148:
#line 614 "parser.yy"
{ set_goal_reward(*yyvsp[-2].expr); }
    break;
case 149:
#line 617 "parser.yy"
{ set_default_metric(); }
    break;
case 150:
#line 618 "parser.yy"
{ metric_fluent = true; }
    break;
case 151:
#line 619 "parser.yy"
{ problem->set_metric(*yyvsp[-1].expr); metric_fluent = false; }
    break;
case 152:
#line 620 "parser.yy"
{ metric_fluent = true; }
    break;
case 153:
#line 621 "parser.yy"
{ problem->set_metric(*yyvsp[-1].expr, true); metric_fluent = false; }
    break;
case 154:
#line 627 "parser.yy"
{ yyval.formula = yyvsp[0].atom; }
    break;
case 155:
#line 629 "parser.yy"
{ first_eq_term = eq_term; first_eq_expr = eq_expr; }
    break;
case 156:
#line 630 "parser.yy"
{ yyval.formula = make_equality(); }
    break;
case 157:
#line 631 "parser.yy"
{ require_fluents(); }
    break;
case 158:
#line 632 "parser.yy"
{ yyval.formula = new Comparison(yyvsp[-4].comp, *yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 159:
#line 633 "parser.yy"
{ yyval.formula = make_negation(*yyvsp[-1].formula); }
    break;
case 160:
#line 634 "parser.yy"
{ yyval.formula = yyvsp[-1].conj; }
    break;
case 161:
#line 635 "parser.yy"
{ require_disjunction(); }
    break;
case 162:
#line 635 "parser.yy"
{ yyval.formula = yyvsp[-1].disj; }
    break;
case 163:
#line 636 "parser.yy"
{ yyval.formula = make_implication(*yyvsp[-2].formula, *yyvsp[-1].formula); }
    break;
case 164:
#line 637 "parser.yy"
{ prepare_exists(); }
    break;
case 165:
#line 638 "parser.yy"
{ yyval.formula = make_exists(*yyvsp[-1].formula); }
    break;
case 166:
#line 639 "parser.yy"
{ prepare_forall(); }
    break;
case 167:
#line 640 "parser.yy"
{ yyval.formula = make_forall(*yyvsp[-1].formula); }
    break;
case 168:
#line 643 "parser.yy"
{ yyval.conj = new Conjunction(); }
    break;
case 169:
#line 644 "parser.yy"
{ yyval.conj->add_conjunct(*yyvsp[0].formula); }
    break;
case 170:
#line 647 "parser.yy"
{ yyval.disj = new Disjunction(); }
    break;
case 171:
#line 648 "parser.yy"
{ yyval.disj->add_disjunct(*yyvsp[0].formula); }
    break;
case 172:
#line 651 "parser.yy"
{ prepare_atom(yyvsp[0].str); }
    break;
case 173:
#line 652 "parser.yy"
{ yyval.atom = make_atom(); }
    break;
case 174:
#line 653 "parser.yy"
{ prepare_atom(yyvsp[0].str); yyval.atom = make_atom(); }
    break;
case 175:
#line 656 "parser.yy"
{ prepare_atom(yyvsp[0].str); }
    break;
case 176:
#line 657 "parser.yy"
{ yyval.atom = make_atom(); }
    break;
case 177:
#line 658 "parser.yy"
{ prepare_atom(yyvsp[0].str); yyval.atom = make_atom(); }
    break;
case 178:
#line 661 "parser.yy"
{ yyval.comp = Comparison::LT_CMP; }
    break;
case 179:
#line 662 "parser.yy"
{ yyval.comp = Comparison::LE_CMP; }
    break;
case 180:
#line 663 "parser.yy"
{ yyval.comp = Comparison::GE_CMP; }
    break;
case 181:
#line 664 "parser.yy"
{yyval.comp = Comparison::GT_CMP; }
    break;
case 182:
#line 671 "parser.yy"
{ yyval.expr = new Value(*yyvsp[0].num); delete yyvsp[0].num; }
    break;
case 183:
#line 672 "parser.yy"
{ yyval.expr = new Addition(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 184:
#line 673 "parser.yy"
{ yyval.expr = make_subtraction(*yyvsp[-2].expr, yyvsp[-1].expr); }
    break;
case 185:
#line 674 "parser.yy"
{ yyval.expr = new Multiplication(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 186:
#line 675 "parser.yy"
{ yyval.expr = new Division(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 187:
#line 676 "parser.yy"
{ yyval.expr = yyvsp[0].appl; }
    break;
case 188:
#line 680 "parser.yy"
{ require_fluents(); eq_expr = new Value(*yyvsp[0].num); delete yyvsp[0].num; }
    break;
case 189:
#line 681 "parser.yy"
{ require_fluents(); }
    break;
case 190:
#line 682 "parser.yy"
{ eq_expr = new Addition(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 191:
#line 683 "parser.yy"
{ require_fluents(); }
    break;
case 192:
#line 684 "parser.yy"
{ eq_expr = make_subtraction(*yyvsp[-2].expr, yyvsp[-1].expr); }
    break;
case 193:
#line 685 "parser.yy"
{ require_fluents(); }
    break;
case 194:
#line 686 "parser.yy"
{ eq_expr = new Multiplication(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 195:
#line 687 "parser.yy"
{ require_fluents(); }
    break;
case 196:
#line 688 "parser.yy"
{ eq_expr = new Division(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 197:
#line 689 "parser.yy"
{ require_fluents(); prepare_application(yyvsp[0].str); }
    break;
case 198:
#line 690 "parser.yy"
{ eq_expr = make_application(); }
    break;
case 199:
#line 691 "parser.yy"
{ make_eq_name(yyvsp[0].str); }
    break;
case 200:
#line 692 "parser.yy"
{ eq_term = make_term(yyvsp[0].str); eq_expr = NULL; }
    break;
case 201:
#line 695 "parser.yy"
{ yyval.expr = NULL; }
    break;
case 203:
#line 699 "parser.yy"
{ prepare_application(yyvsp[0].str); }
    break;
case 204:
#line 700 "parser.yy"
{ yyval.appl = make_application(); }
    break;
case 205:
#line 701 "parser.yy"
{ prepare_application(yyvsp[0].str); yyval.appl = make_application(); }
    break;
case 206:
#line 704 "parser.yy"
{ yyval.expr = new Value(*yyvsp[0].num); delete yyvsp[0].num; }
    break;
case 207:
#line 706 "parser.yy"
{ yyval.expr = new Addition(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 208:
#line 708 "parser.yy"
{ yyval.expr = make_subtraction(*yyvsp[-2].expr, yyvsp[-1].expr); }
    break;
case 209:
#line 710 "parser.yy"
{ yyval.expr = new Multiplication(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 210:
#line 712 "parser.yy"
{ yyval.expr = new Division(*yyvsp[-2].expr, *yyvsp[-1].expr); }
    break;
case 211:
#line 713 "parser.yy"
{ yyval.expr = yyvsp[0].appl; }
    break;
case 212:
#line 715 "parser.yy"
{ prepare_application(yyvsp[0].str); yyval.expr = make_application(); }
    break;
case 213:
#line 718 "parser.yy"
{ yyval.expr = NULL; }
    break;
case 215:
#line 722 "parser.yy"
{ prepare_application(yyvsp[0].str); }
    break;
case 216:
#line 723 "parser.yy"
{ yyval.appl = make_application(); }
    break;
case 217:
#line 725 "parser.yy"
{ prepare_application(yyvsp[0].str); yyval.appl = make_application(); }
    break;
case 219:
#line 733 "parser.yy"
{ add_term(yyvsp[0].str); }
    break;
case 220:
#line 734 "parser.yy"
{ add_term(yyvsp[0].str); }
    break;
case 222:
#line 738 "parser.yy"
{ add_term(yyvsp[0].str); }
    break;
case 224:
#line 742 "parser.yy"
{ add_variables(yyvsp[0].strs, OBJECT_TYPE); }
    break;
case 225:
#line 743 "parser.yy"
{ add_variables(yyvsp[-1].strs, yyvsp[0].type); }
    break;
case 227:
#line 746 "parser.yy"
{ yyval.strs = new std::vector<const std::string*>(1, yyvsp[0].str); }
    break;
case 228:
#line 747 "parser.yy"
{ yyval.strs = yyvsp[-1].strs; yyval.strs->push_back(yyvsp[0].str); }
    break;
case 230:
#line 751 "parser.yy"
{ add_names(yyvsp[0].strs, OBJECT_TYPE); }
    break;
case 231:
#line 752 "parser.yy"
{ add_names(yyvsp[-1].strs, yyvsp[0].type); }
    break;
case 233:
#line 755 "parser.yy"
{ yyval.strs = new std::vector<const std::string*>(1, yyvsp[0].str); }
    break;
case 234:
#line 756 "parser.yy"
{ yyval.strs = yyvsp[-1].strs; yyval.strs->push_back(yyvsp[0].str); }
    break;
case 235:
#line 759 "parser.yy"
{ require_typing(); }
    break;
case 236:
#line 759 "parser.yy"
{ yyval.type = yyvsp[0].type; }
    break;
case 237:
#line 762 "parser.yy"
{ yyval.type = OBJECT_TYPE; }
    break;
case 238:
#line 763 "parser.yy"
{ yyval.type = make_type(yyvsp[0].str); }
    break;
case 239:
#line 764 "parser.yy"
{ yyval.type = make_type(*yyvsp[-1].types); delete yyvsp[-1].types; }
    break;
case 240:
#line 767 "parser.yy"
{ yyval.types = new TypeSet(); }
    break;
case 241:
#line 768 "parser.yy"
{ yyval.types = new TypeSet(); yyval.types->insert(make_type(yyvsp[0].str)); }
    break;
case 242:
#line 769 "parser.yy"
{ yyval.types = yyvsp[-1].types; }
    break;
case 243:
#line 770 "parser.yy"
{ yyval.types = yyvsp[-1].types; yyval.types->insert(make_type(yyvsp[0].str)); }
    break;
case 245:
#line 780 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 246:
#line 783 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 247:
#line 786 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 248:
#line 789 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 249:
#line 792 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 250:
#line 795 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 251:
#line 798 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 252:
#line 801 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 253:
#line 804 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 254:
#line 807 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 255:
#line 810 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 256:
#line 813 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 257:
#line 816 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 258:
#line 819 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 259:
#line 822 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 260:
#line 825 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 261:
#line 828 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 262:
#line 831 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 263:
#line 834 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 264:
#line 837 "parser.yy"
{ delete yyvsp[0].str; }
    break;
case 265:
#line 840 "parser.yy"
{ delete yyvsp[0].str; }
    break;
}

#line 705 "/usr/share/bison/bison.simple"


  yyvsp -= yylen;
  yyssp -= yylen;
#if YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;
#if YYLSP_NEEDED
  *++yylsp = yyloc;
#endif

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[YYTRANSLATE (yychar)]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[YYTRANSLATE (yychar)]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx)
		      {
			const char *yyq = ! yycount ? ", expecting " : " or ";
			yyp = yystpcpy (yyp, yyq);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yycount++;
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exhausted");
	}
      else
#endif /* defined (YYERROR_VERBOSE) */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*--------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action |
`--------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;
      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;


/*-------------------------------------------------------------------.
| yyerrdefault -- current state does not do anything special for the |
| error token.                                                       |
`-------------------------------------------------------------------*/
yyerrdefault:
#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */

  /* If its default is to accept any token, ok.  Otherwise pop it.  */
  yyn = yydefact[yystate];
  if (yyn)
    goto yydefault;
#endif


/*---------------------------------------------------------------.
| yyerrpop -- pop the current state because it cannot handle the |
| error token                                                    |
`---------------------------------------------------------------*/
yyerrpop:
  if (yyssp == yyss)
    YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#if YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "Error: state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

/*--------------.
| yyerrhandle.  |
`--------------*/
yyerrhandle:
  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

/*---------------------------------------------.
| yyoverflowab -- parser overflow comes here.  |
`---------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}
#line 867 "parser.yy"


/* Outputs an error message. */
static void yyerror(const std::string& s) {
  std::cerr << PACKAGE ":" << current_file << ':' << line_number << ": " << s
	    << std::endl;
  success = false;
}


/* Outputs a warning. */
static void yywarning(const std::string& s) {
  if (warning_level > 0) {
    std::cerr << PACKAGE ":" << current_file << ':' << line_number << ": " << s
	      << std::endl;
    if (warning_level > 1) {
      success = false;
    }
  }
}


/* Creates an empty domain with the given name. */
static void make_domain(const std::string* name) {
  domain = new Domain(*name);
  domains[*name] = domain;
  requirements = &domain->requirements;
  problem = NULL;
  delete name;
}


/* Creates an empty problem with the given name. */
static void make_problem(const std::string* name,
			 const std::string* domain_name) {
  std::map<std::string, Domain*>::const_iterator di =
    domains.find(*domain_name);
  if (di != domains.end()) {
    domain = (*di).second;
  } else {
    domain = new Domain(*domain_name);
    domains[*domain_name] = domain;
    yyerror("undeclared domain `" + *domain_name + "' used");
  }
  requirements = new Requirements(domain->requirements);
  problem = new Problem(*name, *domain);
  if (requirements->rewards) {
    const Application& reward_appl =
      Application::make_application(reward_function, TermList());
    const Assignment* reward_assignment =
      new Assignment(Assignment::ASSIGN_OP, reward_appl, *new Value(0));
    problem->add_init_effect(*new AssignmentEffect(*reward_assignment));
  }
  delete name;
  delete domain_name;
}


/* Adds :typing to the requirements. */
static void require_typing() {
  if (!requirements->typing) {
    yywarning("assuming `:typing' requirement");
    requirements->typing = true;
  }
}


/* Adds :fluents to the requirements. */
static void require_fluents() {
  if (!requirements->fluents) {
    yywarning("assuming `:fluents' requirement");
    requirements->fluents = true;
  }
}


/* Adds :disjunctive-preconditions to the requirements. */
static void require_disjunction() {
  if (!requirements->disjunctive_preconditions) {
    yywarning("assuming `:disjunctive-preconditions' requirement");
    requirements->disjunctive_preconditions = true;
  }
}


/* Adds :conditional-effects to the requirements. */ 
static void require_conditional_effects() {
  if (!requirements->conditional_effects) {
    yywarning("assuming `:conditional-effects' requirement");
    requirements->conditional_effects = true;
  }
}


/* Returns a simple type with the given name. */
static Type make_type(const std::string* name) {
  std::pair<Type, bool> t = domain->types().find_type(*name);
  if (!t.second) {
    t.first = domain->types().add_type(*name);
    if (name_kind != TYPE_KIND) {
      yywarning("implicit declaration of type `" + *name + "'");
    }
  }
  delete name;
  return t.first;
}


/* Returns the union of the given types. */
static Type make_type(const TypeSet& types) {
  return domain->types().add_type(types);
}


/* Returns a simple term with the given name. */
static Term make_term(const std::string* name) {
  if ((*name)[0] == '?') {
    std::pair<Variable, bool> v = context.find(*name);
    if (!v.second) {
      if (problem != NULL) {
	v.first = problem->terms().add_variable(OBJECT_TYPE);
      } else {
	v.first = domain->terms().add_variable(OBJECT_TYPE);
      }
      context.insert(*name, v.first);
      yyerror("free variable `" + *name + "' used");
    }
    delete name;
    return v.first;
  } else {
    TermTable& terms = (problem != NULL) ? problem->terms() : domain->terms();
    const PredicateTable& predicates = domain->predicates();
    std::pair<Object, bool> o = terms.find_object(*name);
    if (!o.second) {
      size_t n = term_parameters.size();
      if (parsing_atom && predicates.arity(atom_predicate) > n) {
	o.first = terms.add_object(*name,
				   predicates.parameter(atom_predicate, n));
      } else {
	o.first = terms.add_object(*name, OBJECT_TYPE);
      }
      yywarning("implicit declaration of object `" + *name + "'");
    }
    delete name;
    return o.first;
  }
}


/* Creates a predicate with the given name. */
static void make_predicate(const std::string* name) {
  repeated_predicate = false;
  std::pair<Predicate, bool> p = domain->predicates().find_predicate(*name);
  if (!p.second) {
    p.first = domain->predicates().add_predicate(*name);
  } else {
    repeated_predicate = true;
    yywarning("ignoring repeated declaration of predicate `" + *name + "'");
  }
  predicate = p.first;
  parsing_predicate = true;
  delete name;
}


/* Creates a function with the given name. */
static void make_function(const std::string* name) {
  repeated_function = false;
  std::pair<Function, bool> f = domain->functions().find_function(*name);
  if (!f.second) {
    f.first = domain->functions().add_function(*name);
  } else {
    repeated_function = true;
    if (requirements->rewards && f.first == reward_function) {
      yywarning("ignoring declaration of reserved function `reward'");
    } else {
      yywarning("ignoring repeated declaration of function `" + *name + "'");
    }
  }
  function = f.first;
  parsing_function = true;
  delete name;
}


/* Creates an action with the given name. */
static void make_action(const std::string* name) {
  context.push_frame();
  action = new ActionSchema(*name);
  delete name;
}


/* Adds the current action to the current domain. */
static void add_action() {
  context.pop_frame();
  if (domain->find_action(action->name()) == NULL) {
    domain->add_action(*action);
  } else {
    yywarning("ignoring repeated declaration of action `"
	      + action->name() + "'");
    delete action;
  }
  action = NULL;
}


/* Prepares for the parsing of a universally quantified effect. */ 
static void prepare_forall_effect() {
  if (!requirements->conditional_effects) {
    yywarning("assuming `:conditional-effects' requirement");
    requirements->conditional_effects = true;
  }
  context.push_frame();
  quantified.push_back(NULL_TERM);
}


/* Creates a universally quantified effect. */
static const Effect* make_forall_effect(const Effect& effect) {
  context.pop_frame();
  QuantifiedEffect* qeffect = new QuantifiedEffect(effect);
  size_t n = quantified.size() - 1;
  size_t m = n;
  while (is_variable(quantified[n])) {
    n--;
  }
  for (size_t i = n + 1; i <= m; i++) {
    qeffect->add_parameter(quantified[i]);
  }
  quantified.resize(n);
  return qeffect;
}


/* Adds an outcome to the given probabilistic effect. */
static void add_effect_outcome(ProbabilisticEffect& peffect,
			       const Rational* p, const Effect& effect) {
  if (!requirements->probabilistic_effects) {
    yywarning("assuming `:probabilistic-effects' requirement");
    requirements->probabilistic_effects = true;
  }
  if (*p < 0 || *p > 1) {
    yyerror("outcome probability needs to be in the interval [0,1]");
  }
  if (!peffect.add_outcome(*p, effect)) {
    yyerror("effect outcome probabilities add up to more than 1");
  }
  delete p;
}


/* Creates an add effect. */
static const Effect* make_add_effect(const Atom& atom) {
  domain->predicates().make_dynamic(atom.predicate());
  return new AddEffect(atom);
}


/* Creates a delete effect. */
static const Effect* make_delete_effect(const Atom& atom) {
  domain->predicates().make_dynamic(atom.predicate());
  return new DeleteEffect(atom);
}


/* Creates an assignment effect. */
static const Effect* make_assignment_effect(Assignment::AssignOp oper,
					    const Application& application,
					    const Expression& expr) {
  if (requirements->rewards && application.function() == reward_function) {
    if ((oper != Assignment::INCREASE_OP && oper != Assignment::DECREASE_OP)
	|| typeid(expr) != typeid(Value)) {
      yyerror("only constant reward increments/decrements allowed");
    }
  } else {
    require_fluents();
  }
  effect_fluent = false;
  domain->functions().make_dynamic(application.function());
  const Assignment& assignment = *new Assignment(oper, application, expr);
  return new AssignmentEffect(assignment);
}


/* Adds types, constants, or objects to the current domain or problem. */
static void add_names(const std::vector<const std::string*>* names,
		      Type type) {
  for (std::vector<const std::string*>::const_iterator si = names->begin();
       si != names->end(); si++) {
    const std::string* s = *si;
    if (name_kind == TYPE_KIND) {
      if (*s == OBJECT_NAME) {
	yywarning("ignoring declaration of reserved type `object'");
      } else if (*s == NUMBER_NAME) {
	yywarning("ignoring declaration of reserved type `number'");
      } else {
	std::pair<Type, bool> t = domain->types().find_type(*s);
	if (!t.second) {
	  t.first = domain->types().add_type(*s);
	}
	if (!domain->types().add_supertype(t.first, type)) {
	  yyerror("cyclic type hierarchy");
	}
      }
    } else if (name_kind == CONSTANT_KIND) {
      std::pair<Object, bool> o = domain->terms().find_object(*s);
      if (!o.second) {
	domain->terms().add_object(*s, type);
      } else {
	TypeSet components;
	domain->types().components(components, domain->terms().type(o.first));
	components.insert(type);
	domain->terms().set_type(o.first, make_type(components));
      }
    } else { /* name_kind == OBJECT_KIND */
      if (domain->terms().find_object(*s).second) {
	yywarning("ignoring declaration of object `" + *s
		  + "' previously declared as constant");
      } else {
	std::pair<Object, bool> o = problem->terms().find_object(*s);
	if (!o.second) {
	  problem->terms().add_object(*s, type);
	} else {
	  TypeSet components;
	  domain->types().components(components,
				     problem->terms().type(o.first));
	  components.insert(type);
	  problem->terms().set_type(o.first, make_type(components));
	}
      }
    }
    delete s;
  }
  delete names;
}


/* Adds variables to the current variable list. */
static void add_variables(const std::vector<const std::string*>* names,
			  Type type) {
  for (std::vector<const std::string*>::const_iterator si = names->begin();
       si != names->end(); si++) {
    const std::string* s = *si;
    if (parsing_predicate) {
      if (!repeated_predicate) {
	domain->predicates().add_parameter(predicate, type);
      }
    } else if (parsing_function) {
      if (!repeated_function) {
	domain->functions().add_parameter(function, type);
      }
    } else {
      if (context.shallow_find(*s).second) {
	yyerror("repetition of parameter `" + *s + "'");
      } else if (context.find(*s).second) {
	yywarning("shadowing parameter `" + *s + "'");
      }
      Variable var;
      if (problem != NULL) {
	var = problem->terms().add_variable(type);
      } else {
	var = domain->terms().add_variable(type);
      }
      context.insert(*s, var);
      if (!quantified.empty()) {
	quantified.push_back(var);
      } else { /* action != NULL */
	action->add_parameter(var);
      }
    }
    delete s;
  }
  delete names;
}


/* Prepares for the parsing of an atomic state formula. */ 
static void prepare_atom(const std::string* name) {
  std::pair<Predicate, bool> p = domain->predicates().find_predicate(*name);
  if (!p.second) {
    atom_predicate = domain->predicates().add_predicate(*name);
    undeclared_atom_predicate = true;
    if (problem != NULL) {
      yywarning("undeclared predicate `" + *name + "' used");
    } else {
      yywarning("implicit declaration of predicate `" + *name + "'");
    }
  } else {
    atom_predicate = p.first;
    undeclared_atom_predicate = false;
  }
  term_parameters.clear();
  parsing_atom = true;
  delete name;
}


/* Prepares for the parsing of a function application. */ 
static void prepare_application(const std::string* name) {
  std::pair<Function, bool> f = domain->functions().find_function(*name);
  if (!f.second) {
    appl_function = domain->functions().add_function(*name);
    undeclared_appl_function = true;
    if (problem != NULL) {
      yywarning("undeclared function `" + *name + "' used");
    } else {
      yywarning("implicit declaration of function `" + *name + "'");
    }
  } else {
    appl_function = f.first;
    undeclared_appl_function = false;
  }
  if (requirements->rewards && f.first == reward_function) {
    if (!effect_fluent && !metric_fluent) {
      yyerror("reserved function `reward' not allowed here");
    }
  } else {
    require_fluents();
  }
  term_parameters.clear();
  parsing_application = true;
  delete name;
}


/* Adds a term with the given name to the current atomic state formula. */
static void add_term(const std::string* name) {
  Term term = make_term(name);
  const TermTable& terms =
    (problem != NULL) ? problem->terms() : domain->terms();
  if (parsing_atom) {
    PredicateTable& predicates = domain->predicates();
    size_t n = term_parameters.size();
    if (undeclared_atom_predicate) {
      predicates.add_parameter(atom_predicate, terms.type(term));
    } else if (predicates.arity(atom_predicate) > n
	       && !domain->types().subtype(terms.type(term),
					   predicates.parameter(atom_predicate,
								n))) {
      yyerror("type mismatch");
    }
  } else if (parsing_application) {
    FunctionTable& functions = domain->functions();
    size_t n = term_parameters.size();
    if (undeclared_appl_function) {
      functions.add_parameter(appl_function, terms.type(term));
    } else if (functions.arity(appl_function) > n
	       && !domain->types().subtype(terms.type(term),
					   functions.parameter(appl_function,
							       n))) {
      yyerror("type mismatch");
    }
  }
  term_parameters.push_back(term);
}


/* Creates the atomic formula just parsed. */
static const Atom* make_atom() {
  size_t n = term_parameters.size();
  if (domain->predicates().arity(atom_predicate) < n) {
    yyerror("too many parameters passed to predicate `"
	    + domain->predicates().name(atom_predicate) + "'");
  } else if (domain->predicates().arity(atom_predicate) > n) {
    yyerror("too few parameters passed to predicate `"
	    + domain->predicates().name(atom_predicate) + "'");
  }
  parsing_atom = false;
  return &Atom::make_atom(atom_predicate, term_parameters);
}


/* Creates the function application just parsed. */
static const Application* make_application() {
  size_t n = term_parameters.size();
  if (domain->functions().arity(appl_function) < n) {
    yyerror("too many parameters passed to function `"
	    + domain->functions().name(appl_function) + "'");
  } else if (domain->functions().arity(appl_function) > n) {
    yyerror("too few parameters passed to function `"
	    + domain->functions().name(appl_function) + "'");
  }
  parsing_application = false;
  return &Application::make_application(appl_function, term_parameters);
}


/* Creates a subtraction. */
static const Expression* make_subtraction(const Expression& term,
					  const Expression* opt_term) {
  if (opt_term != NULL) {
    return new Subtraction(term, *opt_term);
  } else {
    return new Subtraction(*new Value(0), term);
  }
}


/* Creates an atom or fluent for the given name to be used in an
   equality formula. */
static void make_eq_name(const std::string* name) {
  std::pair<Function, bool> f = domain->functions().find_function(*name);
  if (f.second) {
    prepare_application(name);
    eq_expr = make_application();
  } else {
    /* Assume this is a term. */
    eq_term = make_term(name);
    eq_expr = NULL;
  }
}


/* Creates an equality formula. */
static const StateFormula* make_equality() {
  if (!requirements->equality) {
    yywarning("assuming `:equality' requirement");
    requirements->equality = true;
  }
  if (first_eq_expr != NULL && eq_expr != NULL) {
    return new Comparison(Comparison::EQ_CMP, *first_eq_expr, *eq_expr);
  } else if (first_eq_expr == NULL && eq_expr == NULL) {
    const TermTable& terms =
      (problem != NULL) ? problem->terms() : domain->terms();
    if (domain->types().subtype(terms.type(first_eq_term), terms.type(eq_term))
	|| domain->types().subtype(terms.type(eq_term),
				   terms.type(first_eq_term))) {
      return new Equality(first_eq_term, eq_term);
    } else {
      return &StateFormula::FALSE;
    }
  } else {
    yyerror("comparison of term and numeric expression");
    return &StateFormula::FALSE;
  }
}


/* Creates a negated formula. */
static const StateFormula* make_negation(const StateFormula& negand) {
  if (typeid(negand) == typeid(Atom)) {
    if (!requirements->negative_preconditions) {
      yywarning("assuming `:negative-preconditions' requirement");
      requirements->negative_preconditions = true;
    }
  } else if (typeid(negand) != typeid(Equality)
	     && typeid(negand) != typeid(Comparison)) {
    require_disjunction();
  }
  return &Negation::make_negation(negand);
}


/* Creates an implication. */
static const StateFormula* make_implication(const StateFormula& f1,
					    const StateFormula& f2) {
  require_disjunction();
  Disjunction* disj = new Disjunction();
  disj->add_disjunct(Negation::make_negation(f1));
  disj->add_disjunct(f2);
  return disj;
}


/* Prepares for the parsing of an existentially quantified formula. */
static void prepare_exists() {
  if (!requirements->existential_preconditions) {
    yywarning("assuming `:existential-preconditions' requirement");
    requirements->existential_preconditions = true;
  }
  context.push_frame();
  quantified.push_back(NULL_TERM);
}


/* Prepares for the parsing of a universally quantified formula. */
static void prepare_forall() {
  if (!requirements->universal_preconditions) {
    yywarning("assuming `:universal-preconditions' requirement");
    requirements->universal_preconditions = true;
  }
  context.push_frame();
  quantified.push_back(NULL_TERM);
}


/* Creates an existentially quantified formula. */
static const StateFormula* make_exists(const StateFormula& body) {
  context.pop_frame();
  size_t m = quantified.size() - 1;
  size_t n = m;
  while (is_variable(quantified[n])) {
    n--;
  }
  if (n < m) {
    Exists* exists = new Exists();
    for (size_t i = n + 1; i <= m; i++) {
      exists->add_parameter(quantified[i]);
    }
    exists->set_body(body);
    quantified.resize(n);
    return exists;
  } else {
    quantified.pop_back();
    return &body;
  }
}


/* Creates a universally quantified formula. */
static const StateFormula* make_forall(const StateFormula& body) {
  context.pop_frame();
  size_t m = quantified.size() - 1;
  size_t n = m;
  while (is_variable(quantified[n])) {
    n--;
  }
  if (n < m) {
    Forall* forall = new Forall();
    for (size_t i = n + 1; i <= m; i++) {
      forall->add_parameter(quantified[i]);
    }
    forall->set_body(body);
    quantified.resize(n);
    return forall;
  } else {
    quantified.pop_back();
    return &body;
  }
}


/* Sets the goal reward for the current problem. */
void set_goal_reward(const Expression& goal_reward) {
  if (!requirements->rewards) {
    yyerror("goal reward only allowed with the `:rewards' requirement");
  } else {
    const Application& reward_appl =
      Application::make_application(reward_function, TermList());
    const Assignment* reward_assignment =
      new Assignment(Assignment::INCREASE_OP, reward_appl, goal_reward);
    problem->set_goal_reward(*reward_assignment);
  }
}


/* Sets the default metric for the current problem. */
static void set_default_metric() {
  if (requirements->rewards) {
    const Application& reward_appl =
      Application::make_application(reward_function, TermList());
    problem->set_metric(reward_appl);
  }
}
