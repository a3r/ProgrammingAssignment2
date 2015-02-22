## These package allows to inverse matrices and cache the results

## This function creates an object which stores a matrix and an inverse 
## matrix cache (if already computed) as well as their accessor functions

makeCacheMatrix <- function(mat = matrix()) {
        inv <- NULL
        get <- function() mat
        set <- function(newMat = matrix()) { mat <<- newMat; inv <<- NULL }
        getinv <- function() inv
        setinv <- function(newInv) inv <<- newInv
        list(get=get, set=set, getinv=getinv, setinv=setinv)
}


## This function checks if there already is a cached inverse matrix and returns/calculates and returns it

cacheSolve <- function(x) {
        if (is.null(x$getinv())) {
                x$setinv(solve(x$get()))
        } else {
                message("Returning cached value")
        }
        x$getinv()
}
