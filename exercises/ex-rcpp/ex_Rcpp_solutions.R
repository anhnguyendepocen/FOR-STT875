## ----global_options-----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## -----------------------------------------------------------------------------
# TODO 15.1: Rewrite all() as allC()
library(Rcpp)
cppFunction("bool allC(NumericVector x) {
  int n = x.size();
  for(int i = 0; i < n; i++){
    if(!x[i]) return false;
  }
  return true;
}")

# Example run 1
all(c(T,T,F,T,T,T,F,F,F))

# Example run 2
all(c(T,T,T,T,T,T))


## -----------------------------------------------------------------------------
# TODO 15.2: Rewrite range() as rangeC()
library(Rcpp)
cppFunction("NumericVector rangeC(NumericVector x) {
  int n = x.size();
  double min = 0;
  double max = 0;

  for(int i = 0; i < n; i++){
    if(i == 0) {
      min = x[i];
      max = x[i];
    } else {
      if(x[i] < min) {
        min = x[i];
      } else if(x[i] > max) {
        max = x[i];
      }
    }
  }
  NumericVector out(2);
  out[0] = min;
  out[1] = max;
  return out;
}")

# Example run 1
range(c(-0.654, 0.121, 0.088, 0.976, -0.325))

# Example run 2
range(c(1,1,1,1,1,1,1,1))

# Example run 3
range(c(9991, 847, 63, 345, 561))


## -----------------------------------------------------------------------------
library(microbenchmark)

x <- runif(10000) # generate points from uniform distribution
microbenchmark(range(x), rangeC(x))


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

library(Rcpp)
cppFunction("

NumericMatrix distC(NumericMatrix x) {
  
  int n = x.nrow();
  int p = x.ncol();

  NumericMatrix out(n,n);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++){
      for (int k = 0; k < p; k++) {
        out(i,j) = out(i,j) + pow(x(i,k) - x(j,k), 2);
      }
      out(i,j) = sqrt(out(i,j));
    }
  }

  return(out); 
}

")

x <- as.matrix(cbind(1:3, 1:3))
distC(x)



## -----------------------------------------------------------------------------
# TODO 15.5: Give the timings of the two functions using microbenchmark()

library(microbenchmark)

x <- as.matrix(cbind(runif(100),runif(100),runif(100)))
microbenchmark(distR(x),distC(x))

