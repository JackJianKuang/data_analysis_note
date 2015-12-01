find.package("devtools") # check if you have installed 'devtools' package
# Error in find.package("devtools") : there is no package called 'devtools'
install.packages("devtools")
library(devtools)
find_rtools()
# [1] TRUE