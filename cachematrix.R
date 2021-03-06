## functions that cache inverse matrix
## creates matrix

makeCacheMatrix <- function( m = matrix() ) {
  

  i <- NULL
  

  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  
  get <- function() {
  
    m
  }
  
  
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  
  getInverse <- function() {
    
    i
  }
  
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## uses the inverse function to calculate cache

cacheSolve <- function(x, ...) {
  

  m <- x$getInverse()
  

  if( !is.null(m) ) {
    message("cached data")
    return(m)
  }

  data <- x$get()
  
  
  m <- solve(data) %*% data
  
  
  x$setInverse(m)
  
  ## MATRIX NEW
  m
}
