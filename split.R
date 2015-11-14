#-------------------------------- split ---------------------------------
# split takes a vector or other objects and splits it into groups determined by a factor or list of factors
str(split)
# function (x, f, drop = FALSE, ...)  
#   - x is a vector (or list) or data frame
#   - f is a factor (or coerced to one) or list of factors
#   - drop indicates whether empty factors levels should be dropped
#   - always return a list

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10) # Generate Factor Levels
split(x, f)
# $`1`
# [1] -0.05895166  1.32518260  0.40874975  0.63710553 -0.37385553
# [6] -0.65446041 -1.34867831  0.55040553  0.91723386  0.69723544
# 
# $`2`
# [1] 0.62782153 0.04635477 0.59092884 0.04255053 0.31338173 0.38000525
# [7] 0.15887178 0.97641771 0.09350013 0.73847884
# 
# $`3`
# [1]  2.53496884 -0.89598313  1.98438826  0.72846700  0.49648211
# [6]  1.27402647  0.74407424  2.12148843  2.48861442  0.05703286

# a common idiom is split followed by lapply
lapply(split(x,f), mean)
# $`1`
# [1] 0.2099967
# 
# $`2`
# [1] 0.3968311
# 
# $`3`
# [1] 1.153356

# splitting a data.frame
library(datasets)
head(airquality)
#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6
s <- split(airquality, airquality$Month) # Month is not factor, but can be converted to factor
lapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
# $`5`
# Ozone  Solar.R     Wind 
#   NA       NA 11.62258 
# 
# $`6`
# Ozone   Solar.R      Wind 
#   NA 190.16667  10.26667 
# 
# $`7`
# Ozone    Solar.R       Wind 
#   NA 216.483871   8.941935 
# 
# $`8`
# Ozone  Solar.R     Wind 
#   NA       NA 8.793548 
# 
# $`9`
# Ozone  Solar.R     Wind 
#   NA 167.4333  10.1800 

sapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
#               5         6          7        8        9
# Ozone         NA        NA         NA       NA       NA
# Solar.R       NA 190.16667 216.483871       NA 167.4333
# Wind    11.62258  10.26667   8.941935 8.793548  10.1800
sapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
#                 5         6          7          8         9
# Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
# Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
# Wind     11.62258  10.26667   8.941935   8.793548  10.18000

# Splitting on More than One Level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
# [1] 1 1 1 1 1 2 2 2 2 2
# Levels: 1 2
f2
# [1] 1 1 2 2 3 3 4 4 5 5
# Levels: 1 2 3 4 5
interaction(f1, f2)
# [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
# Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

# interaction can create empty levels
str(split(x, list(f1, f2)))
# $ 1.1: num [1:2] 0.606 0.668
# $ 2.1: num(0) 
# $ 1.2: num [1:2] 1.673 0.175
# $ 2.2: num(0) 
# $ 1.3: num -1.2
# $ 2.3: num -0.431
# $ 1.4: num(0) 
# $ 2.4: num [1:2] 1.288 0.477
# $ 1.5: num(0) 
# $ 2.5: num [1:2] 1.49 1.41

# empty levels can be dropped
str(split(x, list(f1, f2), drop = TRUE))
# $ 1.1: num [1:2] 0.606 0.668
# $ 1.2: num [1:2] 1.673 0.175
# $ 1.3: num -1.2
# $ 2.3: num -0.431
# $ 2.4: num [1:2] 1.288 0.477
# $ 2.5: num [1:2] 1.49 1.41