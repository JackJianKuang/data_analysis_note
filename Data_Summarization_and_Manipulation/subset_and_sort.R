# Subsetting and Sorting
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
#   var1 var2 var3
# 4    3   NA   11
# 1    1    8   15
# 5    5   NA   12
# 3    2    9   14
# 2    4   10   13

# ---------------------------- subset -----------------------------------
## Dealing with missing values
X[X$var2 > 8,]
#       var1 var2 var3
# NA     NA   NA   NA
# NA.1   NA   NA   NA
# 3       2    9   14
# 2       4   10   13
X[which(X$var2 > 8),]
#   var1 var2 var3
# 3    2    9   14
# 2    4   10   13

# ------------------------------- sort ------------------------------------
## Sorting
sort(X$var1)
# [1] 1 2 3 4 5
sort(X$var1, decreasing = TRUE)
# [1] 5 4 3 2 1
sort(X$var2, na.last = TRUE)
# [1]  8  9 10 NA NA

## Ordering
X[order(X$var1),]
#   var1 var2 var3
# 1    1    8   15
# 3    2    9   14
# 4    3   NA   11
# 2    4   10   13
# 5    5   NA   12
X[order(X$var1, X$var3),]

## Ordering with plyr
library(plyr)
arrange(X, var1)
#   var1 var2 var3
# 1    1    8   15
# 2    2    9   14
# 3    3   NA   11
# 4    4   10   13
# 5    5   NA   12
arrange(X, desc(var1))
#   var1 var2 var3
# 1    5   NA   12
# 2    4   10   13
# 3    3   NA   11
# 4    2    9   14
# 5    1    8   15