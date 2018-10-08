# Quiz #02: Local Search
<sub>http://ktiml.mff.cuni.cz/~bartak/podminky/lectures/CSP-lecture02eng.pdf</sub>

### What is the problem of *generate-and-test* method?
Exploring too many "visibly" wrong assignments (no brain) - the generator does not exploit fully the result of testing.

### Why is *local search* called “local”?
Local search changes the *generate-and-test* method:
  - only small (***local***) changes are allowed
  - the next assignment should be "better" than the currrent one (better means that more constraints are satisfied)
  - assignments are not necessarily generated systematically - we lost completeness but gained more effeciency
  - beware the local maxima

### How is the *evaluation function* defined in constraint satisfaction?
Evaluation is a value of objective function of the problem (objective function maps current state to a real value that we minimize or maximize).

### Define *plateau*.
Plateau is a non-strict local minimum area on evaluation-states space.

### What is the difference between *strict* and *non-strict* local optima?
Strict is surrounded by worse evaluations. Non-strinct has the same evaluation on at least one side.

### How does *hill-climbing leave a local optimum*?
With ***restart*** - The program starts again at random position and tries to find better evaluation.

### How does *min-conflicts method leave a local optimum*?
By adding some *noise* to the algorithm.

#### Random walk
 - a state from the neighbourhood is selected randomly
 - such a way will hardly find a solution - so there's a guide that distributes probability of selecting a state based on a heuristic

### What is the *size of neighborhood* for hill climbing? And for min-conflicts method?
| method |   size  |
|   ---: | :---    |
|     HC | n*(d-1) |
|     MC | (d-1)   |

### Is *random walk a complete algorithm* for solving CSPs?
Yes. All states will be visited if we give the algorithm enough time and do not set a probability of a state to 0.

### What is the role of *tabu list*?
To *avoid cycles* in searches (local minimum is a special case of cycling).
We *remember already visited cycles* and do not visit them again.
Often we remember only few last states so that we are not consuming too much memory.

***Tabu list*** = a list of forbidden states. Tabu list has a fix length *k*.
A state can be represented by a selected attribute.

### What is an *aspiration criterion*?
Criterion for re-enabling of states that are tabu.
Its purpose is to allow to go in promising directions even if the state in the direction is tabu.

### What are the roles of *intensification and diversification in local search*?
***Intensification*** helps to select next assignment from the neighbourhood.
***Diversification*** helps to escape the local optimum.

### Describe the possible methods for *escaping from local optimum*.
 - restart
 - random selection of next assignment
 - tabu list

### What is the role of *clause weighting in GSAT*?
Some clauses remain unsatisfied even after several iterations of GSAT.
That means that those clauses are *harder* to satisfy and so we increase their weight in clause selecting function.
The algorithm can learn the weight itself.

### How does *GENET escape from local optima*?
GENET = binary CSP as a NN.
We modify the space of state evaluation by modifying the evaluation function.
This is done by modifying weights of connections using guided local search.

### What is the role of *temperature in simulated annealing*?
It denotes the probability of accepting "wrong" state.
With higher temperature the search is more random.
Using low temperatures the search cannot escape local optimum.
