## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The function will output the inverse the given matrix.
## Initially it will cache the inverse. The same cache will be used in cache solve function.
## when the function is run again, the cache will be flushed out and inverse will be calculated again.
makeCacheMatrix <- function(x = numeric()) {
  cache <- NULL
  setMatrix <- function(y) {
    x <<- y
    cache <<- NULL
  }
  getMatrix <- function()  x
  
  cacheInverse <- function(solve)   cache <<- solve
  
  getInverse <- function()    cache
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function
## Check the inverse matrix and if is not null, then return the inverse matrix
## Calculate the inverse of matrix if it is null.

cacheSolve <- function(y, ...) {
  inverse <- y$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  inverse
}
