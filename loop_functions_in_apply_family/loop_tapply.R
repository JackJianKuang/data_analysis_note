# ------------------------- tapply --------------------------------
# tapply is used to apply a function over subsets of a vector. 
str(tapply)
# function (X, INDEX, FUN = NULL, ..., simplify = TRUE)
#   - X is a vector
#   - INDEX is a factor or a list of factors (or else they are coerced to factors)
#   - FUN is a function to be applied
#   - ... contains other arguments to be passed FUN
#   - simplify, should we simplify the result?

# take group means
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
f
# [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
# Levels: 1 2 3
tapply(x, f, mean)
#         1          2          3 
# -0.3333878  0.4669172  0.7832150 

# take group means without simplification
tapply(x, f, mean, simplify = FALSE)
# $`1`
# [1] -0.3333878
# 
# $`2`
# [1] 0.4669172
# 
# $`3`
# [1] 0.783215

# find group ranges
tapply(x, f, range)
# $`1`
# [1] -1.3436330  0.9794716
# 
# $`2`
# [1] 0.09783078 0.89354489
# 
# $`3`
# [1] -0.3214685  2.3203521