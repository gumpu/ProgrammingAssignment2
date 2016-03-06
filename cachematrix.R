## This file contains function that can be used
## to make repeatedly computing the inverse of a
## given matrix more efficient by caching the result.


## This is a constructor for a cached matrix.
## It adds a couple of functions to a standard
## matrix to make it possible to cache the result
## of computing the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
    inverse_matrix <- NULL
    set <- function(y) {
        x <<- y
        # Matrix has changed, mark the
        # cached inverse as obsolete so it
        # will be recomputed
        inverse_matrix <<- NULL
    }
    get <- function() x
    set_inverse <- function(inv) inverse_matrix <<- inv
    get_inverse <- function() inverse_matrix

    list(get=get, set=set, 
         get_inverse=get_inverse, set_inverse=set_inverse)
}


## This is a cached version of solve()
## It computes the inverse of a matrix but caches the results thus
## saving valuable computing time when called multiple times.
## Parameters:
## x - a CacheMatrix
## .. - any arguments you want to pass to solve()

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$get_inverse()
    if(!is.null(inv)) {
        # We know the answer already.
        return(inv)
    }
    # Have to compute it.
    data <- x$get()
    inv <- solve(data, ...)
    x$set_inverse(inv)
    inv
}


