## ----global_options-----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## -----------------------------------------------------------------------------
# TODO 15.1: Rewrite all() as allC()

# Example run 1
all(c(T,T,F,T,T,T,F,F,F))

# Example run 2
all(c(T,T,T,T,T,T))


## -----------------------------------------------------------------------------
# TODO 15.2: Rewrite range() as rangeC()

# Example run 1
range(c(-0.654, 0.121, 0.088, 0.976, -0.325))

# Example run 2
range(c(1,1,1,1,1,1,1,1))

# Example run 3
range(c(9991, 847, 63, 345, 561))


## -----------------------------------------------------------------------------
# library(microbenchmark)

# x <- runif(10000) # generate points from uniform distribution
# microbenchmark(range(x), rangeC(x))


## -----------------------------------------------------------------------------
## TODO 15.3: What do you notice about the running times of the two programs?

# Answer here...


## -----------------------------------------------------------------------------
distR <- function(x){
 
  n <- nrow(x)
  p <- ncol(x)
  out <- matrix(0, n, n)
  
  for(i in 1:n){
    for(j in 1:n){
      for(k in 1:p){
        out[i,j] <- out[i,j] + (x[i,k] - x[j,k])^2
      }
      out[i,j] <- sqrt(out[i,j])
    } 
  }
  
  out
}

##Example run
x <- cbind(1:3, 1:3)
distR(x)


## -----------------------------------------------------------------------------
# TODO 15.4: Rewrite distR() using a Rcpp cppFunction() function, distC()



## -----------------------------------------------------------------------------
# TODO 15.5: Give the timings of the two functions using microbenchmark()


