#-------------------------- mapply ----------------------------------
# mapply is a multivariate apply of sorts which applies a function in parallel over a set of arguments.
str(mapply)
# > str(mapply)
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) 
#   - FUN is a function to apply
#   - ... contains arguments to apply over
#   - MoreArgs is a list of other arguments to FUN.
#   - SIMPLIFY indicates whether the result should be simplified

# The following is tedious to type 
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
# Instead we can do 
mapply(rep, 1:4, 4:1)
# [[1]]
# [1] 1 1 1 1
# 
# [[2]]
# [1] 2 2 2
# 
# [[3]]
# [1] 3 3
# 
# [[4]]
# [1] 4

# Vectorizing a Function
noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}
noise(5, 1, 2)
# [1]  1.2604220 -0.6371177  0.3201096  3.6370421 -3.8762520
noise(1:5, 1:5, 2) # the answer is not what we expected
# [1] -1.0784799  0.6619034  3.4412352  7.0220504  5.9112026
mapply(noise, 1:5, 1:5, 2) # this is what we expected
# [[1]]
# [1] 1.531629
# 
# [[2]]
# [1] 0.9209401 4.3102329
# 
# [[3]]
# [1] 2.712378 5.278563 2.395423
# 
# [[4]]
# [1] 2.938426 4.755006 3.174862 4.446496
# 
# [[5]]
# [1] 7.794691 2.951598 3.811777 5.312750 5.198518
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2)) # same result
