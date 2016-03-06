set.seed(11230)
test_mat <- matrix(as.integer(100*rnorm(6400)),80,80)

cm <- makeCacheMatrix(test_mat)
cacheSolve(cm)

