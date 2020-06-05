## ----global_options, echo=FALSE------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)

## ------------------------------------------------------------------------
1*(1-0.5)^(-1/(3.5-1))
6e8 * (1-0.5)^(-1/(2.34-1))
1e6 * (1-0.92)^(-1/(2.5-1))

## ---- echo=TRUE----------------------------------------------------------
qpareto.1 <- function(p, alpha, x0) {
q <- x0*((1-p)^(-1/(alpha-1)))
return(q)
}

## ------------------------------------------------------------------------
qpareto.1(p = 0.5, alpha = 3.5, x0 = 1)
qpareto.1(p = 0.5, alpha = 2.34, x0 = 6e8)
qpareto.1(p = 0.92, alpha = 2.5, x0 = 1e6)

## ----echo=TRUE-----------------------------------------------------------
qpareto.2 <- function(p, alpha, x0, lower.tail=TRUE) {
if(lower.tail==FALSE) {
p <- 1-p
}
q <- qpareto.1(p, alpha, x0)
return(q)
}

## ------------------------------------------------------------------------
qpareto.2(p = 0.5, alpha = 3.5, x0 = 1)
qpareto.2(p = 0.08, alpha = 2.5, x0 = 1e6, lower.tail = FALSE)

## ---- error=TRUE---------------------------------------------------------
ff <- function(p, y, z){
stopifnot(p > 0, p < 1, y < z)
return(c(p, y, z))
}

ff(p = 0.5, y = 3, z = 5)
ff(p = -1, y = 3, z = 5)
ff(p = -1, y = 3, z = 2)
ff(p = 2, y = 3, z = 5)
ff(p = 0.5, y = 3, z = 2)

## ---- error = TRUE-------------------------------------------------------
ff(p = -1, y = 3, z = 5)

## ---- echo=TRUE----------------------------------------------------------
qpareto <- function(p, alpha, x0, lower.tail=TRUE) {
stopifnot(p >= 0, p <= 1, alpha> 1, x0 > 0)
if(lower.tail==FALSE) {
p <- 1-p
}
q <- qpareto.1(p, alpha, x0)
return(q)
}

## ---- error=TRUE---------------------------------------------------------
qpareto(p = 0.5, alpha = 3.5, x0 = 1)
qpareto(p = 0.08, alpha = 2.5, x0 = 1e6, lower.tail = FALSE)
qpareto(p = 1.08, alpha = 2.5, x0 = 1e6, lower.tail = FALSE)
qpareto(p = 0.5, alpha = 0.5, x0 = -4)
qpareto(p = 0.5, alpha = 2, x0 = -4)

## ----echo=TRUE-----------------------------------------------------------
normal.mle <- function(x) {
stopifnot(is.numeric(x), length(x) >=2)
n <- length(x)
mean_hat <- mean(x)
var_hat  <- var(x)*(n-1)/n
out <- list(mean_hat=mean_hat, var_hat=var_hat)
return(out)
}

## ---- error=TRUE---------------------------------------------------------
normal.mle(c(1, 2, 1, 4))
normal.mle(c("a", "b"))
normal.mle(1)

