## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## test commit


makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    
    #create a function to define vector x and reset m (matrix)
    x <<- y
    m <<- NULL
  }
  get <- function() x  # function that returns vector x
  setmatrix <- function(solve) m <<- solve # solve the matrix and return the result
  getmatrix <- function() m #returns the solution
  #list of functions that are stored in makeCaceMatrix
  list(set = set, get = get,  
       setmatrix = setmatrix,
       getmatrix = getmatrix)
  
  

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
  
  ## Return a matrix that is the inverse of 'x'
  
  
  # calls the function in makeCacheMatrix to return 
  #the inverse of the matrix if already calcualted
  m <- x$getmatrix() 
  
  # check if matrix alredy exists with the solution
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  
  #return the matrix if not already solved
  mtrx <- x$get()
  #re-solve the matrix
  m <- solve(mtrx, ...)
  #set the solution so we don't have to calculate again.
  x$setmatrix(m)
  #return the solution
  m
}
