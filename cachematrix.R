## these functions are ment to speed-up processes 
## where matrix inverse needs to be calculated many times
## for a single matrix.



## This function returns matrix with caching ability.
## Once inverse matrix is calculated it will be stored 
## in cache. It also stores functions
## used to storing/retriving the mentioned inverse matrix. 


makeCacheMatrix <- function(x = matrix()) {
  cashedInvers <- NULL
  
  getmatrix <- function() x
  setinvers <- function(solution) cashedInvers <<- solution
  getinvers <- function() cashedInvers
  list(getmatrix = getmatrix,
       setinvers = setinvers,
       getinvers = getinvers)
}



## This function returns invers of the matrix taken from cache.
## if cache is empty, this function will calculate the invers 
## matrix, store it in cashe and return it as well.

cacheSolve <- function(x, ...) {
  solution <- x$getinvers()
  if(!is.null(solution)) {
    message("getting cached data")
    return(solution)
  }
  MATRIX <- x$getmatrix()
  solution <- solve(MATRIX, ...)
  x$setinvers(solution)    ##inv nazwalem sobie solution
  solution
}
