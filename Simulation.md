## Generating Random Numbers
Functions for probability distributions in R
* rnorm : generate random Normal variates with a given mean and standard deviation
* dnorm : evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
* pnorm : evaluate the cumulative distribution function for a Normal distribution
* rpois : generate random Piosson variates with a given rate

Each probability distribution in R has 
- r*** function (for "random"), 
- d*** function (for "density"), 
- p*** (for "probability"), and 
- q*** (for "quantile").

If Φ is the cumulative distribution funciton for a standard Normal distribution, then pnorm(q) = Φ(q) and qnorm(p) = Φ^-1(p).

## Summary
* Drawing samples from specific probability distributions can be done with r* functions
* Standard distributions are built in: Normal, Poission, Binomial, Exponential, Gamma, etc.
* The sample function can be used to draw random samples from arbitrary vectors
* Setting the random number generator seed via set.seed is critical for reproducibility