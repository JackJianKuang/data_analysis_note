## llply takes a list input, applies a function to each element, and returns a list, making it a drop-in replacement for lapply:
library(plyr)
prime_factors <- list(
    two   = 2,
    three = 3,
    four  = c(2, 2),
    five  = 5,
    six   = c(2, 3),
    seven = 7,
    eight = c(2, 2, 2),
    nine  = c(3, 3),
    ten   = c(2, 5)
)
llply(prime_factors, unique)
# $two
# [1] 2
# 
# $three
# [1] 3
# 
# $four
# [1] 2
# 
# $five
# [1] 5
# 
# $six
# [1] 2 3
# 
# $seven
# [1] 7
# 
# $eight
# [1] 2
# 
# $nine
# [1] 3
# 
# $ten
# [1] 2 5

## laply takes a list and returns an array, mimicking sapply. In the case of an empty input, it does the smart thing and returns an empty logical vector (unlike sapply, which returns an empty list):
laply(prime_factors, length)
# [1] 1 1 2 1 2 1 3 2 2
laply(list(), length)
# logical(0)

## raply replaces replicate (not rapply!), but there are also rlply and rdply functions that let you return the result in list or data frame form, and an r_ply function that discards the result (useful for drawing plots):
raply(5, runif(1)) # array output
# [1] 0.7136039 0.3052370 0.2973350 0.8755687 0.3037667
rlply(5, runif(1)) # list output
# [[1]]
# [1] 0.4926111
# 
# [[2]]
# [1] 0.5063895
# 
# [[3]]
# [1] 0.9002451
# 
# [[4]]
# [1] 0.5756798
# 
# [[5]]
# [1] 0.7770997
rdply(5, runif(1)) # data frame output
#   .n        V1
# 1  1 0.9487216
# 2  2 0.8809101
# 3  3 0.9152835
# 4  4 0.1232710
# 5  5 0.2378347
r_ply(5, runif(1)) # discarded output
# NULL

## ddply, which takes data frames as inputs and outputs and can be used as a replacement for tapply.
(frogger_scores <- data.frame(
    player = rep(c("Tom", "Dick", "Harry"), times = c(2, 5, 3)),
    score  = round(rlnorm(10, 8), -1)
))
#    player score
# 1     Tom  4550
# 2     Tom  3750
# 3    Dick  8560
# 4    Dick  7030
# 5    Dick   930
# 6    Dick  7670
# 7    Dick  1160
# 8   Harry  1070
# 9   Harry   780
# 10  Harry  1100
frogger_scores$level <- floor(log(frogger_scores$score))
### There are several different ways of calling ddply. All methods take a data frame, the name of the column(s) to split by, and the function to apply to each piece. The column is passed without quotes, but wrapped in a call to the . function.
### For the function, you can either use colwise to tell ddply to call the function on every column (that you didn't mention in the second argument), or use summarize and specify manipulations of specific columns:
ddply(
    frogger_scores,
    .(player),
    colwise(mean) # call mean on every column except player
)
#   player     score    level
# 1   Dick 5070.0000 7.600000
# 2  Harry  983.3333 6.333333
# 3    Tom 4150.0000 8.000000
ddply(
    frogger_scores,
    .(player),
    summarize,
    mean_score = mean(score), # call mean on score
    max_level = max(level) # call max on level
)
#   player mean_score max_level
# 1   Dick  5070.0000         9
# 2  Harry   983.3333         7
# 3    Tom  4150.0000         8
