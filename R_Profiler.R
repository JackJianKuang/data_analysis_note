# Using system.time()

## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# user  system elapsed 
# 0.33    0.13    1.29
## user time is just for readLines
## elapsed time has to add network time (read file online)

## Elapsed time < user time
hilbert <- function(n) {
    i <- 1:n
    1 / outer(i-1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))
# user  system elapsed 
# 2.58    0.00    2.59 
## the underline linear algebra function split the calculation cross two (CPU) cores

# R Profiler 
