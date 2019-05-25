# Artificial Intelligence 2
## Quiz #02 (Bayesian networks)
___
### What is the relation between a Bayesian network and full joint probability distribution?
  - BN represents the full joint probability distribution
  - *`P(X_1, ..., X_n) = \Pi_i P(x_i | parents(X_i))`*
    - *`P(X | Parents(X))`* correspond to conditional probability defined by the underlying full join probability distribution

### Define Bayesian network. What is a conditional probability table? Can there be undirected cycles in a Bayesian network?
***Bayesian network (belief network, probabilistic networks, ...)***
  - a directed acyclic graph (DAG)
    - nodes correspond to random variabes
    - predecessors of nodes are called parents
    - each node `X` has a conditional probability distribution *`P(X | Parents(X))`*
 
***Conditional probability table***
  - describes the conditional probability distributions (recall that we can keep probability only for values *true*)

***Undirected cycles***
  - Yes, but not directed which is the case for edges in BN

### What is difference between causal network and Bayesian network?
  - causal network leads to smaller networks and easier-to-fill CPTs
  - causal networks are BN build upon causal relationship between nodes

### Does the arc in a Bayesian network always describe causal direction?
No. There can be arcs directed the other way, but causal direction is usually the preferred one. Other direction usually leads to more complicated BN.

### Why does the CPT for one Boolean parent and a Boolean variable contain just two numbers (see the burglary example and CPT for MaryCalls).
We keep only `true` probabilities. The `false` probability can be computed by substracting from 1.

### In the burglary detection example, calculate the probability of burglary for all four possible cases of phone calls from Mary and John.
`P(b | j,m)= αΣeΣaP(b) P(e) P(a|b,e)  P(j|a)  P(m|a)= αP(b) ΣeP(e) ΣaP(a|b,e)  P(j|a)  P(m|a)`
T T ~28%

### What is a Markov blanket? How is it used (in which inference method)?
"A node is conditionally independent of all other nodes given its parents, children, and children‘s parents."
Markov Chain Monte Carlo (MCMC)

### Is there a single Bayesian network representing the given full joint probability distribution?
There are many. But some are more compact than others. Their shape depends on the ordering of random variables at creation.

### Describe a method to construct a Bayesian network.
 1. Determine the set of random variables that are required to model the domain and order them
   a. Any order will do
   b. Based on order we yield resulting network
   c. Usually causes precede effects
 2. Choose variables Xi in a given order from 1 to n
 3. Find minimal set of parents from previous random variables
 4. From each parent insert a link to Xi
 5. Write down the CPT for P(Xi | parents(Xi))

### How can a “good” Bayesian network be recognized (and constructed)?
Good BN require low amount of arcs. We could try all orderings and pick the best one. But causes-precede-effects is usually optimal or very close.

### What is inference in a Bayesian network?
  - deducing posterior probability of some variable(s) `X` from the query given the values 

### Describe the enumeration method of inference. What is its major disadvantage (inefficiency)?
  - `P(b | j,m) = \alpha \sum_e \sum_a P(b) P(e) P(a | b,e) P(j | a) P(m | a)`
  - the structure of computation can be described using a tree structure
  
  - some parts of computation are repeated
  
### What is the relation between inference by enumeration and variable elimination methods?
  - Enumeration repeats the same parts of the computation -> we can remember the result and reuse it later
  - `P(b | j,m) = \alpha \sum_e \sum_a P(b) P(e) P(a | b,e) P(j | a) P(m | a) = \alpha f_1(b) \sum_e f_2(e) \sum_a f_3(a,b,e) f_4(a) f_5(a)`

### How does variable ordering influence the variable elimination method (from the soundness and efficiency views)?
Variable elimination method does not depend on variable ordering soudness-wise. But the ordering can have an effect on efficiency. The efficiency depends on largest constructed factor (representation of joint probability used in the computation) and the size of the largest needed factor depends on the decision which variable to eliminate. Therefore, choosing a variable which minimizes the size of next computed factor is often used as a heuristic.

### How do we get the factors from the Bayesian network? Demonstrate the basic operations with factors.
Factors are matrices corresponding to CPTs. We can sum out a variable from two matrices (`f(A=T,B,C) + f(A=F,B,C) = f(B,C)`) or create factors which are unions of other factors - this is done using multiplication (`f(X1,...,Xj,Y1,...,Yk,Z1,...Zl)  = f(X1,...,Xj,Y1,...,Yk)  . f(Y1,...,Yk,Z1,...Zl)`).

### Sketch the core idea of the Monte Carlo method. What is a sample?
  - approximate inference methods (to avoind NP-hardness)
  - generate many samples
  - use statistics to estimate the quantity
  - more samples = more accuracy
  - sample is a random assignment of all random variables with respect to their probabilities

### What is a direct sampling method? Why cannot it be used directly to do any inference?
  - nodes (varibales) are taken in topological order
  - the probability distribution is NOT conditioned on the values already assigned to parents
  - generate a sample value based on CPTs
  - remove samples that do not correspond to the observed environment by rejection sampling
  - because it generates samples that are not true for already observed variables

### What is rejection sampling? What is its major disadvantage?
  - rejecting too many samples

### What is the weight in likelihood weighting? How is the weight used? What is the major disadvantage of likelihood weighting?
  - weight is a coefficient that normalizes CPT probabilities after alternation of CPT values with respect to already observed variables
  - the weight is a multiplication constant used when computing P(X | e) where e stands for evidence
  - ?we work with small numbers?

### What is the major difference between the Markov Chain Monte Carlo method and rejection sampling and likelihood weighting?
  - instead of generating new samples, we modify already known sample
  - modification is done using probabilities from Markov blanket

### Justify that MCMC works.
  - last [slide](http://ktiml.mff.cuni.cz/~bartak/ui2/lectures/lecture02eng.pdf)
