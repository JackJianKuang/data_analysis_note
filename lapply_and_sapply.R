# ---------------------------------- lapply ----------------------------------------
# lapply takes three arguments: 
#   (1) a list X, if X is not a list, it will be coerced to a list using as.list;
#   (2) a function (or the name of a function) FUN;
#   (3) other arguments via its ... argument.

# function (X, FUN, ...) 
# {
#   FUN <- match.fun(FUN)
#   if (!is.vector(X) || is.object(X)) 
#     X <- as.list(X)
#   .Internal(lapply(X, FUN))
# }
# <bytecode: 0x00000000094c4d18>
# <environment: namespace:base>

# The actual looping is done internally in C code.

# lapply always returns a list, regardless of the input.
x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean)
# $a
# [1] 2.5
# 
# $b
# [1] 0.1911687
# 
# $c
# [1] 0.7362729
# 
# $d
# [1] 4.898547

# pass the arguments of function through ...
x <- 1:4
lapply(x, runif, min = 0, max = 10)
# [[1]]
# [1] 1.159675
# 
# [[2]]
# [1] 9.126721 1.873669
# 
# [[3]]
# [1] 9.918564 1.946478 6.730242
# 
# [[4]]
# [1] 7.7124369 7.9475427 8.4434465 0.8022042

# lapply and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
# an anonymous function for extracting the first column of each matrix.
lapply(x, function(elt) elt[,1])
# $a
# [1] 1 2
# 
# $b
# [1] 1 2 3

# ------------------------------- sapply ---------------------------------------------
# sapply will try to simplify the result of lapply if possible
#   - If the result is a list where every element is length 1,then a vector is returned
#   - If the result is a list where every element is a vector of the same length (>1), a matrix is returned
#   - If it can't figure things out, a list is returned
x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(x, mean)
# a         b         c         d 
# 2.5000000 0.1911687 0.7362729 4.8985473 
mean(x)
# Warning message:
# In mean.default(x) : argument is not numeric or logical: returning NA