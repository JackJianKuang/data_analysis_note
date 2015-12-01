# creates a special "vector", which is really a list containing a function 
makeVector <- function(x = numeric()) {
  m <- NULL # mean
  # 1.set the value of the vector
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  # 2.get the value of the vector
  get <- function() x
  # 3.set the value of the mean
  setmean <- function(mean) m <<- mean
  # 4.get the value of the mean
  getmean <- function() m
  # return a list contains functions
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

# calculates the mean of the special "vector" created with the above function.
cachemean <- function(x, ...) {
  m <- x$getmean() # it first checks to see if the mean has already been calculated.
  if(!is.null(m)) { # If so, it gets the mean from the cache and skips the computation. 
    message("getting cached data")
    return(m)
  }
  # Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

# example
list_myvector <- makeVector(c(1,2,3))
