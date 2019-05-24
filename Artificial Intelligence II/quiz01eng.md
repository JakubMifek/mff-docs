## Artificial Intelligence II
### Quiz &num;01 (uncertainty and probability theory)
___
#### Can a purely logical agent work with uncertanity? If yes, how?
Yes. It represents all possible world states for the agent no matter how unlikely.

#### What is a sample space? Describe its properties.
Sample space is a set of elementary phenomena. It contains all possible states which may occur. Each elementary phenomenon has assigned its probability *P(&#969;)*. *&sum;P(&#969;) = &#937;*

#### Assume that we have two undistinguishable dice and we roll them. How many possible worlds will we get? What are their probabilities? What if the dice are distinguishable?
15 worlds based on the sum of dices:
- 2 (*P(2) = 1/36*)
- 3 (*P(3) = 2/36*)
- 4 (*P(4) = 3/36*)
- 5 (*P(5) = 4/36*)
- 6 (*P(6) = 5/36*)
- 7 (*P(7) = 6/36*)
- 8 (*P(8) = 5/36*)
- 9 (*P(9) = 4/36*)
- 10 (*P(10) = 3/36*)
- 11 (*P(11) = 2/36*)
- 12 (*P(12) = 1/36*)

If they are distinguishable, state space contains all tuples, each with a probability of *1/36*.

#### Is there any relation between random variables and possible worlds?
Random variables describe properties of a world. Each variable can acquire any value of its domain (we consider discrete domains). The world (or elementary phenomenon) is described by the set of all contained random variables and their acquired values.

#### What is a full joint probability distribution?
A table indexed by values of random variables containing probabilities of elementary phenomena.

<table>
  <tr> <th/>                  <th colspan=2>     toothache     </th> <th colspan=2>  &not;toothache   </th> </tr>
  <tr> <th/>                  <th> catch </th> <th> &not;catch </th> <th> catch </th> <th> &not;catch </th> </tr>
  <tr> <th> cavity      </th> <td> .108  </td> <td>    .012    </td> <td> .072  </td> <td>    .008    </td> </tr>
  <tr> <th> &not;cavity </th> <td> .016  </td> <td>    .064    </td> <td> .144  </td> <td>    .576    </td> </tr>
</table>

#### What does inference do in probabilistic models?
Probability of a claim is given by the sum of probabilities of worlds where the claim stands. *P(Y) = &sum;<sub>z&in;Z</sub>P(Y, z)*

#### Describe observed, hidden, and query random variables.
*P(Y | E=e) = &alpha; P(Y, E=e) = &alpha;&sum;<sub>h</sub>P(Y,E=e,H=h)*.

*Y* are query random variables.  
*E* are observed random variables.  
*H* are hidden random variables.  

#### What is a conditional probability?
Conditional probability asks about probability of an event when we already have some information.  
*P(A | B) = P(A &and; B)/P(B)*  

#### Describe product and chain rules.
Product rule: *P(A &and; B) = P(A | B) P(B)*

Chain rule: *P(A, B, C, D) = P(A | B, C, D) P(B, C, D) = P(A | B, C, D) P(B | C, D) P(C, D) = ...*

#### How is normalization exploited when computing conditional probabilities?
When computing conditional probabilities e.g. *P(A | B), P(&not;A | B)*, we do not need to know *P(B)*, since the sub of *P(A | B) + P(&not;A | B)* equals to *1*.

When computing *P(A | B)* we do not need to evaluate *P(B)* (which might be complicated) but can use *normalization constant &alpha;*:  
*P(A | B) = &alpha; P(A &and; B) = &alpha; <P(A &and; B); P(&not;A &and; B)>\[0]*  

*P(cavity | toothache) = &alpha; P(cavity &and; toothache) = &alpha; <0.12; 0.08> = <0.6; 0.4> ... &alpha; = 5*

#### Describe Bayes’ rule.
Recall *P(A &and; B) = P(A | B) P(B) = P(B | A) P(A)*.

Bayes’ rule: *P(A | B) = P(B | A) P(A) / P(B)*

With normalization: *P(A | B) = &alpha; P(B | A) P(A)*

#### What is a naïve Bayes model? In particular, why is it called naïve?
If probabilities of all random variables are independent, we can write:  
*P(C, E<sub>1</sub>, ..., E<sub>n</sub>) = P(C) &prod;<sub>i</sub>P(E<sub>i</sub> | C)*  

It is called naïve Bayes model since it is often used even when the probabilities are not indepenedent.

#### How is the Bayes’ rule exploited when representing the full joint probability distribution?
If all the effects are conditionally independent given the cause variable, we get:

*P(Cause, Effect_1, ..., Effect_n)  = P(Cause) * \Pi_i P(Effect_i | Cause)*

#### What is the difference between causal and diagnostic direction?
Causal dirrection is the probability of effect if we know the cause.  
Diagnostic dirrection is the opposite. We know effects and want to know what most likely causes the effects.  

*P(E | C)* vs. *P(C | E)*
