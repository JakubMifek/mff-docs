# Intro
[Presentation](https://ufal.mff.cuni.cz/~holub/2018/docs/lec.Formal-Intro-to-ML.2018-10-03.posted.pdf)

Can be used for example for **SPAM recognition**.
Text is classified into two categories (binary classification) - *SPAM* or *not SPAM*

There are several types of recognition:
 - ***rule-based recognition*** - we define many rules
 - machine-learning recognition
 - ***supervised machine-learning recognition*** - we gather many samples and let the program learn how to recognize SPAM

Another use-case is **Digit recognition**.
In digit from picture recognition we don't have just two categories but 11 - `{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, -}`.

**Word-sense disambiguation**
We try to assign the correct sense of a word in a sentence. E.g.: word *line* can mean:
 - CORD
 - DIVISION
 - FORMATION
 - PHONE
 - PRODUCT
 - TEXT

And we ignored verb usage of word *line*.

## Supervised machine-learning
Computer learns "essential knowledge" from a (large) set of exmaples.
Then we extract *feature vector* from real world objects and using a *prediction function* we predict true value.

## Loss function
Loss function measures the cost of predicting *ÿ* when the true value is *y*.

| Loss function |  Formula  |
|      ---:     |   :---    |
| Squared loss  | (ÿ - y)^2 |
| Zero-one loss | 1(ÿ /= y) |
