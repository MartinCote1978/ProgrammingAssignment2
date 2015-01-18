### Unit test cachematrix.R

source("cachematrix.R")

tst_matrixempty <- matrix()

# Matrix 2x2
tst_matrix2x2 <- matrix(1:4, nrow=2, ncol=2)

# Matrix 3x3
tst_matrix3x3 <- matrix(c(1,0,5,2,1,6,3,4,0), nrow=3, ncol=3)

# Matrix 4x4
tst_matrix4x4 <- matrix(c(1,1,1,1,1,2,1,4,1,1,1,2,1,2,0,3), nrow=4, ncol=4)

## Test empty matrix
cachematrixempty <- makeCacheMatrix(tst_matrixempty)
# Call once (without cache)...
cacheSolve(cachematrixempty)
# Call twice (with cache)...
cacheSolve(cachematrixempty)
# Call third (with cache)...
cacheSolve(cachematrixempty)

## Test 2x2 matrix
cachematrix2x2 <- makeCacheMatrix(tst_matrix2x2)
# Call once (without cache)...
cacheSolve(cachematrix2x2)
# Call twice (with cache)...
cacheSolve(cachematrix2x2)
# Call third (with cache)...
cacheSolve(cachematrix2x2)

## Test 3x3 matrix
cachematrix3x3 <- makeCacheMatrix(tst_matrix3x3)
# Call once (without cache)...
cacheSolve(cachematrix3x3)
# Call twice (with cache)...
cacheSolve(cachematrix3x3)
# Call third (with cache)...
cacheSolve(cachematrix3x3)

## Test changing data on 3x3 matrix...
tst_matrix3x3 <- matrix(c(2,0,0,0,1,0,2,2,2), nrow=3, ncol=3)
# Call cacheSolve without "notifying" the method
cacheSolve(cachematrix3x3) # TODO: error; same matrix as before.  Are we supposed to support that scenario?


## Test 4x4 matrix
cachematrix4x4 <- makeCacheMatrix(tst_matrix4x4)
# Call once (without cache)...
cacheSolve(cachematrix4x4)
# Call twice (with cache)...
cacheSolve(cachematrix4x4)
# Call third (with cache)...
cacheSolve(cachematrix4x4)
