# Planning
## Input:
- S - initial state
- A - possible actions
- G - goal state

### Output:
- P - Sequence of actions (plan)

### Properties:
- actions in the plan are unknown
- time and resources are not assumed

### Description:
- deciding which actions are necessary to achieve the goal
- topic of artificial intelligence
- complexity is usually worse than NP-c (in general it’s undecidable)

# Scheduling
## Input:
- A - a set of partially ordered activities
- R - available resources

## Output:
- S - allocation of activities to time and resources (schedule)

## Properties:
- activities are known in advance
- limited time and resources

## Description:
- deciding how to process the actions using given restricted resources and time
- topic of operations research
- complexity is typically NP-c

# Literature
## Planning:
- Automated Planning: Theory and Practice (M. Ghallab, D. Nau, P. Traverso)

## Scheduling:
- Handbook of Scheduling (J. Leung)
- Scheduling Algorithms (P. Brucker)
- Constraint-based Scheduling (P. Baptiste, C. Le Pape, W. Nauijten)

# Preliminaries
## Search techniques
### Properties:
- soundness - the output of the algorithm is a problem solution
- completeness - if there is anz solution then the algorithm finds it
- admissibility - the algorithm guarantees finding an optimal solution

### State-space search
- find a state (path to a state)
- s0(init state)
- g (goal condition)
- O (function of ascendants)
- f (objective function)
- *Types:*
  - BFS
    - sound and complete
    - time O(bd)
    - space O(bd)
    - if f is not decreasing, then solution is optimal
    - if space is finite, algorithm is admissible
    - if f converges, the alg is admissible even with infinite space
  - DFS
    - backtrack upon failure
    - sound and complete (unless infinite branches)
    - time depends
    - space O(n)
  - Branch and bound
    - DFS with f
    - Explore all branches, remember best
    - Some branches do not need to be explored if they cannot lead to better result
  - Greedy search
    - Like DFS but no backtracks
    - No guarantee of optimality
    - Used for finding best first solution
    
### Problem-reduction search
  - find a reduction of a task to primitive tasks
  - AND-OR graphs (reduction into possible sets of subproblems in a graph (tree)
    - decompose the problem and find solutions of subproblems
  - *Types:*
    - non-deterministic
    - naive
    
## Basics of constraints satisfaction
### Modeling
 - N variables

### Search and inference (propagation)
 - backtracking (assign values and return upon failure)
 - infer consequences of decisions via maintaining consistency of constraints

### Declarative problem description
 - variables with domains describe decision points of the problem with possible options for the decisions
 - constraints restricting combinations of values describe arbitrary relations over variables

## Logic and SAT
 - A formal system consisting of three constituents
 
### Language
 - a set of possible statements called formulas
 - P (set of properties) - defined inductively starting from an enumerable set of atomic propositions
 
#### Conjunctive Normal Form (CNF)
 - Formula is a conjunction of clauses
 - Clause is a disjunction of literals
 - Literal is a propositional variable or its negation
 - *Model* of propositional formula is an assignment of truth values to the propositional variables for which the formula evaluates to true
 - A *Satisfiability problem* is the problem of determining whether a formula has a model
   - can be solved using DFS with *unit propagation*
     - unit propagation determines the truth values of literals in unit clauses
     
### Semantics
 - assigns a meaning to each statement
 
### Proof theory
- rules to transform statements or derive new ones

