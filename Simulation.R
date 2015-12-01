# Generating Random Numbers
## Setting the random number seed with set.seed ensures reproducibility
set.seed(1)
rnorm(5)
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
rnorm(5)
# [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
set.seed(1)
rnorm(5)
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

## Generating Poisson data
### Poisson data is integer
rpois(10, 1)
# [1] 0 0 1 1 2 1 1 4 1 2
rpois(10, 2)
# [1] 4 1 2 0 1 1 0 1 4 1
rpois(10, 20)
# [1] 19 19 24 23 22 24 23 20 11 22

ppois(2, 2) # Cumulative distribution
# [1] 0.6766764 # Pr(x <= 2)
ppois(4, 2)
# [1] 0.947347  # Pr(x <= 4)
ppois(6, 2)
# [1] 0.9954662 # Pr(x <= 6)


# Generating Random Numbers From a Linear Model

## Suppose we want to simulate from the following linear model
## y = β0 + β1x + ε
## where ε ∼ N(0, 2^2). Assume x ~ N(0, 1^2), β0 = 0.5 and β1 = 2.
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2) # e is random noise
y <- 0.5 + 2 * x + e
summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 
plot(x, y)

## What if x is binary?
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -3.4940 -0.1409  1.5770  1.4320  2.8400  6.9410
plot(x, y)

## Suppose we want to simulate from a Poisson model where
## Y ~ Poisson(μ)
## log μ = β0 + β1x
## and β0 = 0.5 andd β1 = 0.3. We need to use the rpois function for this
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    1.00    1.00    1.55    2.00    6.00 
plot(x, y)


# Random Sampling
set.seed(1)
sample(1:10, 4)
# [1] 7 1 4 8
sample(1:10, 4)
# [1] 4 9 2 6
sample(letters, 5)
# [1] "b" "k" "d" "e" "s"
sample(1:10) ## permutation
# [1]  8  3  4  1  9  5  6  2  7 10
sample(1:10, replace = TRUE) ## sample w/replacement
# [1] 10  9 10  9  8  3  8 10  3  4