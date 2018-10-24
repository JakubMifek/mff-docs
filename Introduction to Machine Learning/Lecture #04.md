# Linear and logistic regression

[ Presentation ]()

We will be working with data about cars:

| property | description |
| --:      | :--         |
| mpg | miles per galon |
| origin | country of the manufacturer |
<< Missing information >>

## Linear regression
Is a class of regression algorithms assuming that there is at least a linear dependence between a target attribute and features.

We approximate a goal function using a hypotesis function *f* that has a linear form:

*f(x; Theta) = Theta_0 + Theta_1 x_1 + ... + Theta_m x_m*

Theta is a vector of regression parameters.
We think of them as weights that determine how each feature affects the prediction.

y is a vector of n samples. Theta is a vector of m+1 features. x is an instance of length m+1.

We call LR **Simple linear regression* if m = 1.

### Categorical feature with k values
 - replace it with k-1 dummy variables DA^1, DA^2, ... DA^(k-1)

**Example**
 - run simple llinear regression *mpg* ~ *origin*
 
We have to define a **Loss function**: Residual Sum of Squares RSS(Theta) = sum_i=1^n (y_i - y^^_i)^2.
Where y_i is golden standard and y^^_i is our approximation.

Using the loss function we can find optimal approximation using the optimization.

<< Missing information >>

### Gradient Descent Algorithm
(Metoda největšího spádu)

**Assume**:
 - Theta_0 = 0
 - Theta_1 \= 0

We search for minimum of loss function of a line that goes through the origin.