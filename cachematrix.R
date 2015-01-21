### makeCacheMatrix list
## Description
# makeCacheMatrix list
#
## Usage
# makeCacheMatrix(x)
# 
## Arguments
# x   matrix object to be inverse.
#
## Details
# This function creates a special "matrix" object that can cache its inverse.
#
## Sources
# Refer to: https://class.coursera.org/rprog-010/human_grading/view/courses/973491/assessments/3/submissions
# Refer to cacheSolve()
#
## References
# Refer to Lexical Scoping (i.e. scoping rules) of R
# 
## Examples
# tst_matrix4x4 <- matrix(c(1,1,1,1,1,2,1,4,1,1,1,2,1,2,0,3), nrow=4, ncol=4)
# cachematrix4x4 <- makeCacheMatrix(tst_matrix4x4)
# cacheSolve(cachematrix4x4) # Call once (without cache)...
# cacheSolve(cachematrix4x4) # Call twice (with cache)...
#
makeCacheMatrix <- function(x = matrix()) {
  
  # attributes
  # inverseMatrix: inverse matrix data cached, filled after performed once
  inverseMatrix <- NULL
  
  # getter/setter
  # setter for original matrix data
  set <- function(y) {
    x <<- y
    # assuming data has changed regardless, re-initializing the inversed matrix
    inverseMatrix <<- NULL
  }
  # getter for original matrix data
  get <- function() {
    x
  }
  # setter for the inverse matrix
  setinverse <- function(inverseMtrx) {
    inverseMatrix <<- inverseMtrx
  }
  # getter for the inverse matrix
  getinverse <- function() {
    inverseMatrix
  }
  
  # return list of methods (i.e. exposing the methods)
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

### Solve a System of Equations
## Description
# Return a matrix that is the inverse of 'x'
#
## Usage
# cacheSolve(x, ...)
# 
## Arguments
# x   a square invertible matrix "augmented" object (see makeCacheMatrix function)
#     Note: It is assumed that the matrix supplied is always invertible.
# ... further arguments passed to or from other methods.
#
## Details
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated (and the matrix has not changed), then the cachesolve
# retrieve the inverse from the cache.
#
## Sources
# Refer to: https://class.coursera.org/rprog-010/human_grading/view/courses/973491/assessments/3/submissions
# Refer to makeCacheMatrix
# 
## References
# Refer to R:Solve a System of Equations, part of 'base' package.
# 
## Examples
# tst_matrix4x4 <- matrix(c(1,1,1,1,1,2,1,4,1,1,1,2,1,2,0,3), nrow=4, ncol=4)
# cachematrix4x4 <- makeCacheMatrix(tst_matrix4x4)
# cacheSolve(cachematrix4x4) # Call once (without cache)...
# cacheSolve(cachematrix4x4) # Call twice (with cache)...
#
cacheSolve <- function(x, ...) {
  # Retreive cached inverse
  inverse_matrix <- x$getinverse()
  
  # if available, return it from cache
  if(!is.null(inverse_matrix)) {
    message("getting cached data")
    return(inverse_matrix) # stop further processing
  }
  
  # Otherwise:
  # retrieve original inversible matrix
  data <- x$get()
  # computes inverse matrix
  inverse_matrix <- solve(data, ...) 
  # cache inverse matrix for further use
  x$setinverse(inverse_matrix)
  # return inverse matrix
  inverse_matrix
}
