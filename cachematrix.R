## This function demonstrates R lexical scoping and
## the ability to cache results in an environment

## makeCacheMatrix create a list of 4 functions:
## - cache the matrix
## - get the matrix
## - solve and cache the matrix
## - retrieve solved matrix
## that are used by cacheSolve 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## In conjunction with makeCacheMatrix use function
## solve to find the inverse matrix of square matrix
## If already solved retrieve cached inverse matrix

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
