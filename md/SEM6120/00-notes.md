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

## Knowledge Representation

*Ways of representing knowledge in a computer-understandable way. Semantic networks, rules. Examples of the importance of KR (4 hours).*

## Neural Networks and subsymbolic learning

*We can find solutions using search, but how can we remember solutions, learn from them and adapt them to new situations? This will cover perceptrons, single-layer and multi-layer networks (5 hours).*

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

## Programming for Intelligent Systems

*Practical introduction to programming for Intelligent Systems, used to illustrate search, KR and first-order logic (3 hours).*

## Rule-based Systems

*How can human expertise be automated? How to build an expert system - system concepts and architectures. Rule-based systems: design, operation, reasoning, backward and forward chaining (3 hours).*

## Knowledge Acquisition

*Knowledge Acquisition and its importance in KR and RBS (2 hours).*