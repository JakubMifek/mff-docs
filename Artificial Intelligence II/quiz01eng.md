## Artificial Intelligence II
### Quiz &num;01 (uncertainty and probability theory)
___
#### Can a purely logical agent work with uncertanity? If yes, how?

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

#### Describe observed, hidden, and query random variables.

#### What is a conditional probability?

#### Describe product and chain rules.

#### How is normalization exploited when computing conditional probabilities?

#### Describe Bayes’ rule.

#### What is a naïve Bayes model? In particular, why is it called naïve?

#### How is the Bayes’ rule exploited when representing the full joint probability distribution?

#### What is the difference between causal and diagnostic direction?
