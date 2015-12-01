# Using system.time()
## returns an object of class proc_time
* user time: time charged to the CPU(s) for this expression
* elapsed time: "wall clock" time, developer experienced
    - Elapsed time may be greater than user time if the CPU spends a lot of time waiting around
    - Elapsed time may be smaller than the user time if your machine has multiple cores/processors (and is capable of using them)
	* Multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
	* Parallel processing via the parallel package  

# The R Profiler
* The Rprof() function starts the profiler in R
    - R must be complied with profiler support (but this is usually the case)
* The summaryRprof() function summarizes the output from Rprof() (otehrwise it's not readable)
* DO NOT use system.time() and Rprof() together or you will be sad    

## Rprof()
* Rprof() keeps track of the function call stack at regularly sampled intervals and tabulates how much time is spend in each function
* Default sampling interval is 0.02 seconds
* NOTE: If your code runs very quickly, the profiler is not useful, but then you probably don't need it in that case

## Using summaryRprof()
* The summaryRprof() function tabulates the R profiler output and calculates how much time is spend in which function
* There are two methods for normalizing the data
* "by.total" divides the time spend in each function by the total run time 
* "by.self" does the same but first subtracts out time spent in functions above in the call stack