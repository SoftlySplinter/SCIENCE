# SEM6120 - Introduction to Intelligent Systems

This module introduces the key ideas in Artificial Intelligence and ensures all students are at roughly the same level before moving on to the specialist modules.

## Introduction

*General introduction to Artificial Intelligence (AI), including discussion of what AI is, its history, definitions, and philosophical debates on the issue (the Turing test and the Chinese room). Ethical issues (3 hours).*

### Staff

- **[Richard Jensen](mailto:rkj@aber.ac.uk)**
- [Adrian Shaw](ais@aber.ac.uk)

### Learning Outcomes

1. Describe and use the basic principles of Artificial Intelligence and Machine Learning.
2. Be able to reflect on project needs.
3. Practically apply AI and ML principles to meet those needs.
4. Present the material they have learned in an informed, clear manner.
5. Demonstrate understanding and insight into the material that they are presenting.

### Assessment

- Presentation **20%** *01/10/2013-18/10/2013*
- Report **20%** *01/10/2013-25/10/2013
- Essay **60%** (coding + report) *10/10/2013-01/11/2013*

*Tips: if you disagree with a paper, you should comment on why, this will be a good thing :)*

### Commitment

* 26h seminars
* 6h practicals
* The rest of the time is spent on background reading and assignments.

### Booklist

* **Artificial Intelligence: A Modern Approach** Russell, S. and Norvig, P.
* **Artificial Intelligence: Structures and Strategies for Complex Problem Solving.** - Luger G.
* **Artificial Intelligence Illuminated** - Coppin B.

### What is Artificial Intelligence?

* Understand intelligent entities; learning more about ourselves?
* Building intelligent entites; creating things which exhibit "intelligence".

Two ways of looking at this:

* Scientific goal
* Engineering goal

Many definitions, all potentially valid.

Problem: what is intelligence and how do we prove a system is intelligent.

### Strong versus Weak AI

* Strong AI can actually think intelligently.
* Weak AI can possibly act intelligently.

### Turing Test

Human interrogator talks to another system (human or AI), if the interrogator cannot tell the difference then the argument is we must acknowledge it is able to think like a human.

Has not yet been passed.

### The Chinese Room

Behaving intelligently may not be enough.

Computers are just a symbol manipulation device and therefore cannot have mental states.

### Ethics and AI

We have investigated whether we *can* develop AI, but not whether we *should*.

Problems of AI:

* Job losses
* Too much/little leisure
* Privacy rights
* Accountability
* End of the human race?
  * Harm in the wrong hands

### Branches of AI

* Logical AI
* Search
* Pattern recognition
* Representation
* Inference
* Common-sense knowledge and reasoning
* Learning from experience
* Planning
* Epistemology
* Ontology
* Heuristics
* Genetic Programming


## Search

*Why search is important in AI and how to go about it. This includes both informed and uninformed strategies. Evolutionary search (6 hours)*.

### Defining the Problem

Many AI problems can be framed in terms of a search problem.

Representation is very important.

The search strategy is the way in which searching is performed:

* Uninformed
* Informed (Heuristic)

Can't always evaluate all the search space. Massive search space (e.g. Chess) or even infinite.

### Terminology

#### Search State
Summarises the state of search.

May not lead to a solution.

*e.g. Representation of a chess board.*

#### Initial State
The first search state.

#### Solution
A special example of a search state. It solves the problem.

#### Goal State
The state trying to be reached.

#### State Space
All possible search states.

#### Successor Function
Ways to move around in the state space (action/operators).

#### Goal Function
To check if the goal has been reached.

#### Cost Function
Measures the path cost.

### Search Trees

Visualise the progression of a particular algorithm.

Shouldn't evaluate every possibility of the state space.

Initial state is the root, goal is a leaf.

Don't store the whole search tree. Requires a lot of space. Can discard explored nodes.

Store the frontier of search (i.e. nodes in search tree with some unexplored children).

### Evaluation

#### Time Complexity
In big O notation. Number of nodes generated during a search (worst case).

#### Space complexity
In big O notation. Maximum number of nodes stored in memory.

#### Optimality
Is it guaranteed to find the optimal solution?

#### Completeness
If there is a solution, will it be found?

#### Branching Factor `b`
Maximum number of successors of any node

#### Depth of shallowest goal `d`

#### Maximum length of any path in the state space `m`

### Breadth First Search

Branching factor `b` and depth of solution `d`.

* Time complexity: `O(b^d)`
* Space complexity: `O(b^d)`
* Optimal (given step costs are identical)
* Complete (provided `b` is finite)


### Depth First Search

Branching factor `b`, depth of solution `d` and maximum depth `m`.

* Time complexity: `O(b^m)`
* Space complexity: `O(bm)`
* Not optimal
* Not complete (complete if no loops)

### Depth Limited Search

A Depth First Search with a limited maximum depth.

Depth limit `l`.

* Time Complexity: `O(b^l)`
* Space Complexity: `O(bl)`
* Complete if `l >= d`
* Not optimal

### Uniform Cost Search

A form of Breadth First Search, using a Priority Queue.

Node with the lowest total path cost is expanded.

If all the cost steps are equal, it is exactly the same as BFS.


Complete and Optimal if no negative path costs.

### Iterative Deepening

A depth-limited search where the limit is increased iteratively.

Avoids the space complexity of BFS.

* Time Complexity: `O(b^d)`
* Space Complexity: `O(bd)`
* Optimal
* Complete

## Knowledge Representation

*Ways of representing knowledge in a computer-understandable way. Semantic networks, rules. Examples of the importance of KR (4 hours).*

## Neural Networks and subsymbolic learning

*We can find solutions using search, but how can we remember solutions, learn from them and adapt them to new situations? This will cover perceptrons, single-layer and multi-layer networks (5 hours).*

### Symbolic Learning

When we use some sort of rule-based system, we generally have to understand the rules. This means we understand the conclusions it draws, because it can tell us.

When a system learns from such rules, it processes in a way which can be understood.

### Subsymbolic Learning

Don't really understand, or have control over, the way in which solutions are found.

ANNs, GAs, GP and sometimes statistical methods.

Might be related to the randomness factor.

### Artificial Neural Networks

*(A: time to not understand backprop again)*

Inputs (variables) -> network -> Outputs (results).

X and Y matrices of the statistical models are analogous to the training inputs and outputs of ANNs.

### Backpropagation

Most common learning rule for ANNs.

Connections between nodes given random initial weights.

We therefore get a value at the output node(s) which happens when these random weights are applied to the data at the input.

### Epoch

An iteration, that is, finding the error then adjusting weighting, is called an epoch.

There may be many thousands of epochs in one training.

### Overfitting

Need to be able to *generalise* the model to unseen data.

Too much training will lead to a lack of generalisation.

### Kohonen Neural Networks

Self-organising neural networks.

Random initialisation of a grid, see which nodes best match the input and change nodes around it.

### Genetic Algorithms

Encode solutions in Chromosomes.

Mutate and crossover chromosomes.

Evaluate the new population and select the best.

### Genetic Programming

A branch of genetic algorithms which uses programming statements as genes.

Easy to do in LISP.

## Propositional and First-Order Logic

*The backbone of knowledge representation (4 hours).*

### Types of Knowledge

* Declarative - Facts
* Procedural
* Meta - knowledge about knowledge
* Heuristic - rules of thumb

### Representing Knowledge: Object-attribute-value

Encoding a fact in three pieces of information; the object, it's attributes and the values of these attributes.

The facts a human knows are not obvious to a computer; needs to be encoded.

e.g.: `Tree(species, oak)`

The encoding doesn't matter, so long as its uniform to the system.

Can include an uncertainty factors is a number which can be taken into account by the system when making decisions.

The final conclusion of any program where uncertainty was used in the input is likely to also have an uncertainty factor (if you're not sure of the facts, can can the result be certain?)

Encoding uncertainty might be encoded something like this: `Tree(species, oak, 0.8)` (the certainty that the tree is an oak tree is 80%).

Again encoding doesn't matter, so long as its uniform to the system.

### Rules

A knowledge base may have rules associated.

`IF` premises `THEN` conclusion. There may be more than one premises and may contain logical function

* `AND`, `OR` and `NOT` for example

If a premise evaluates to `TRUE` the rule *fires*.

e.g. 

`IF tree(species, oak) THEN tree(type, deciduous)`

Rules may contradict another rule. Different strategies can be applied to choose the most specific or most relevant rules.

### Meta Rules

<pre>
IF
    tree is conifer
THEN
    load conifer data
ELSE
    load deciduous data
</pre>

### Logic

We can represent knowledge using logic. There are two types: *propositional* and *predicate* (or first-order logic or predicate calculus)

### Propositional Logic

In propositional logic formulas are constructed using variables, `TRUE` and `FALSE` constants and connectors:

* `AND` (`∧`)
* `OR` (`∨`)
* `NOT` (`¬`)
* `IMPLIES` (`→`)

### Predicate Logic

Prolog is based on this.

A predicate is like a function that returns `TRUE` or `FALSE`

`Tree(a)` is true if `a` is oak, false if `a` is daffodil.

### Implication

`Oak(a) → Tree(a)`

If the first clause is satisfied, the second clause is also satisfied.

### Assertions

The symbol `∀` can be read as "for all".

`∀a(Oak(a) → Tree(a)`

### Existence

The symbol `∃` can be read as "exists"

`∃a(Beech(a) ∧ ¬Green(a))`

### The Atomic Formula

`beech(a)` is known as an atomic formula.

Can have multiple parameters.

### Human Reasoning

We use two standard rules:

* Deductive
  1. Modus Ponens - if we know `P→Q` then if `P` is true, `Q` must also be true
  2. Modus Tollens - if we know `P→Q` then if `Q` is false, `P` must also be false
* Inductive
  * Difficult for machines
  * Observations:
    * Oak trees have green leaves
    * Pine trees have green leaves
  * Induce
    * All trees have green leaves
  * Unfortunately, that's not true, but it is useful.

### Non-monotonic

Classic monotonic reasoning cannot contain contradictions

Put formally:

`X ⊆ Y → Deriv(X) ⊆ Deriv(Y)` where `Deriv(X)` is a set of facts derived from `X`

### Temporal Reasoning

Reasoning changes over time. Can introduce this into machines by introducing a concept of time.

### Machine Inference

Machine inference is used to deduce new facts from a knowledge base which is held in working memory.

`Knowledge Base -> Inference Engine -> Working memory`

Can be very complex

### Deducing New Facts

Two principal methods

1. Forwards chaining - based on modus ponens.
2. Backwards chaining - based on modus tollens.

### Forward Chaining

Modens Ponens:

`student(S) ∧ studies(S, ai) → studies(S, prolog)`
`student(T) ∧ studies(S, expsys) → studies(T, ai)`
`student(joe)`
`studies(joe, expsys)`

Therefore we can deduce:

`studies(joe, prolog)`

Proof:

`student(joe) ∧ studies(joe, expsys) → studies(joe, ai)`
`student(joe) ∧ studies(joe, ai) → studies(joe, prolog)`

Q.E.D.

Forwards chaining can fire any rules which match the knowledge held in its working memory. This can potentially come up with a huge amount of new knowledge, most of which is probably completely irrelevant.

### Backwards chaining

Backwards chaining sets out to prove a piece of information.

The information will either be true or false, but doesn't generate unwanted results.

Use the *resolution* proof method for now.

Say we have:

`A1 ∨ A2 ∨ ... ∨ An ∨ B` and ` ¬B ∨ C1 ∨ C2 ∨ ... ∨ Cm`

Resolvent of clauses is:

`A1 ∨ .. ∨ An ∨ C1 ∨ ... ∨ Cm`

### Resolution

Now take the two clauses:

`A1 ∨ A2 ∨ ... ∨ An ∨ B` and `D ∨ C1 ∨ C2 ∨ ... ∨ Cm`

If there is some subset where `B` and `D` are negations of each other `Theta`

If we have two clauses `Clause1` and `Clause2`, and these both have a resolvant `R`, then if `Clause1` and `Clause2` are both satisfiable, so must `R` be.

The idea: take a clause, containing a goal we want to prove, and negate that goal. If we then resole this with other clauses, over and over and we get to the empty clause (which is never satisfiable), we have proved our goal.

### Clause form

We can express any predicate calculus statement in clause form.

This enables us to work with OR and NOT rather than any other clause.

`p → q ≡ ¬p ∨ q`

`A ∧ B ≡ ¬(¬A ∨ ¬B)`

### Example of Resolution

Use a previous example in clause form:

1. `¬student(S) ∨ ¬studies(S, ai) ∨ studies(S, prolog)`
2. `¬student(T) ∨ ¬studies(T, expsys) ∨ studies(T, ai)`
3. `student(joe)`
4. `studies(joe, expsys)`

Solution to `studies(S, prolog)` means we must negate it:

`¬studies(S, prolog)`

Resolve the clause 1:

`¬student(S) ∨ ¬studies(S, ai)`

Resolve with clause (2) (`S=T`)

`¬student(S) ∨ ¬studies(S, expsys)`

Resolve with clause (4) (`S = joe`):

`¬student(joe)`

Resolve with clause (3):

`Ø`

Therefore `studies(joe, prolog)` is true.

Q.E.D.

### Horn Clauses

The same thing, but expressed differently. This is how Prolog does it.

A horn clause is a series of disjuncts (ORs)

We can take:

`A ∨ ¬B ∨ ¬C`

and write it:

`A ← B ∧ C`

If `B` and `C` then `A`

All the same thing:

1. `studies(S, prolog) ← student(S) and studies(S, ai)`
2. `studies(T, ai) ← student(T and studies(T, expsys)`
3. `student(joe) ←`
4. `studies(joe, expsys) ←`

### Resolving Horn Clauses

All the negatives are one side of the `←` sign.

`← studies(S, prolog)`
`studies(S, prolog) ← student(S) ∧ studies(S, ai)`

`← student(S) ∧ studies(S, ai)`
`studies(T, ai) ← student(T) ∧ studies(T, expsys)`

`S = T`

`← student(S) ∧ studies(S, expsys)`
`student(joe) ←`

`S = joe`

`← studies(joe, expsys)`
`studies(joe, expsys) ←`

`←`

Q.E.D.

### Prolog Example

[Prolog Tutorial](http://users.aber.ac.uk/ais/Prolog/)

### Prolog

**Pro**gramming with **log**ic.

Uses backwards chaining through horn clauses.

## Programming for Intelligent Systems

*Practical introduction to programming for Intelligent Systems, used to illustrate search, KR and first-order logic (3 hours).*

## Rule-based Systems

*How can human expertise be automated? How to build an expert system - system concepts and architectures. Rule-based systems: design, operation, reasoning, backward and forward chaining (3 hours).*

## Knowledge Acquisition

*Knowledge Acquisition and its importance in KR and RBS (2 hours).*

## Statistical Methods

*Multivariate analysis and statistical methods for solving problems.*

### Multivariate Analysis

Analysis of high-dimensional data. Often not possible to identify or quantify an object from one dimension.

Two methods:

1. Statistical
2. AI methods

### Statistical Models

Always produces the same result from a given set of data.

Will always find the best result within the constraints of their abilities.

### X Values

All the factors which might affect the outcome so that the analysis can find some form of *correlation*.

### Y Values

The set of objects and associated variables.

### Realigning Axes.

Usually statistics are in high-dimensional space. No way of visualising this data.

In a 3D space, can fit a plane to any 3 points to make the problem a 2D one.

Can approximate the plane to more than 3 points and fit the best plane using root mean square error. This is done using regression, but does mean there will be **error** in the model.

Can do this with a 3D plane, but the idea is to keep the model as simple as possible.

### Principal Component Analysis

The line through multi-dimensional space which describes the most variation in the data (the one with the widest space) is the First Principal Component.

The following Principal Components are always perpendicular and are ordered by the amount of variation from the data and have less importance.

Can analyse the principal components to see which of the original X values contributed most.

Principal components help understand the data better.

### Principal Components Regression

The main principal components help to explain what factors had most bearing on the results.

They form a model that could be used for predicting results.

Using a PCA model to predict is known as Principal Components Regression (PRC).

Closely related is PCL.

### Principal of Parsimony

Fewer variables, if they produce a model just as good in testing, should be preferred.