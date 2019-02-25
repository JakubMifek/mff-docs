# Artificial Intelligence 2
## Quiz #02 (Bayesian networks)
___
### What is the relation between a Bayesian network and full joint probability distribution?
  - BN represents the ful join probability distribution
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

### Why does the CPT for one Boolean parent and a Boolean variable contain just two numbers (see the burglary example and CPT for MaryCalls).

### In the burglary detection example, calculate the probability of burglary for all four possible cases of phone calls from Mary and John.

### What is a Markov blanket? How is it used (in which inference method)?

### Is there a single Bayesian network representing the given full joint probability distribution?

### Describe a method to construct a Bayesian network.

### How can a “good” Bayesian network be recognized (and constructed)?

### What is inference in a Bayesian network?
  - deducing posterior probability of some variable(s) `X` from the query given the values 

### Describe the enumeration method of inference. What is its major disadvantage (inefficiency)?
  - `P(b | j,m) = \alpha \sum_e \sum_a P(b) P(e) P(a | b,e) P(j | a) P(m | a)`
  - the structure of computation can be described using a tree structure

### What is the relation between inference by enumeration and variable elimination methods?

### How does variable ordering influence the variable elimination method (from the soundness and efficiency views)?

### How do we get the factors from the Bayesian network? Demonstrate the basic operations with factors.

### Sketch the core idea of the Monte Carlo method. What is a sample?

### What is a direct sampling method? Why cannot it be used directly to do any inference?

### What is rejection sampling? What is its major disadvantage?

### What is the weight in likelihood weighting? How is the weight used? What is the major disadvantage of likelihood weighting?

### What is the major difference between the Markov Chain Monte Carlo method and rejection sampling and likelihood weighting?

### Justify that MCMC works.
