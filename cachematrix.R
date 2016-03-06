## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverse_matrix <- NULL
  set <- function(y) {
    x <<- y
    inverse_matrix <<- NULL
  }
  get <- function() x
  set_inverse <- function(inv) inverse_matrix <<- inv 
  get_inverse <- function() inverse_matrix

  list(get=get, set=set, 
       get_inverse=get_inverse, set_inverse=set_inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$get_inverse()
  if(!is.null(inv)) {
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$set_inverse(inv)
  inv
}



set.seed(11230)
test_mat <- matrix(as.integer(100*rnorm(1600)),40,40)

cm <- makeCacheMatrix(test_mat)
