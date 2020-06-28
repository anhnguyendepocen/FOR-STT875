## ----global_options-----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## -----------------------------------------------------------------------------
richhtml <- readLines("http://www.finley-lab.com/files/data/Forbes100.html")


## -----------------------------------------------------------------------------
## TODO 14.1: How many lines? How many total characters?
length(richhtml)
sum(nchar(richhtml))


## -----------------------------------------------------------------------------
SandS <- scan("http://www.finley-lab.com/files/data/austen.txt", what = "character", sep = "\n")


## -----------------------------------------------------------------------------
## TODO 14.2: Add code that finds the elements corresponding to "CHAPTER 1" and "THE END", you can use one line of code for each query
which(SandS == "CHAPTER 1")
which(SandS == "THE END")

grep('CHAPTER 1',SandS,fixed = TRUE)[1]
grep('THE END',SandS, fixed = TRUE)


## -----------------------------------------------------------------------------
## TODO 14.3: remove the extraneous beginning and ending text and reassign vector from "CHAPTER 1"" to "THE END"" back to SandS
SandS <- SandS[which(SandS == "CHAPTER 1"):which(SandS == "THE END")]
head(SandS)
tail(SandS)
length(SandS)


## -----------------------------------------------------------------------------
#SandS <- paste(SandS, collapse = " ")
#length(SandS)


## -----------------------------------------------------------------------------
#cat(SandS, file = "Sense and Sensibility.txt")


## -----------------------------------------------------------------------------
is.prime <- function(num) {
   if (num == 2) {
      TRUE
   } else if (any(num %% 2:(sqrt(num)) == 0)) {
      FALSE
   } else { 
      TRUE
   }
}
is.prime(2)
is.prime(3)
is.prime(4)
is.prime(101)
is.prime(115)


## -----------------------------------------------------------------------------
##TODO 14.4: Write the print_primes function here, and demonstrate its use with arguments 10 and 29
print_primes <- function(n){
  for(i in 2:n){
    if(is.prime(i)) {print(i)}
  }
}

print_primes2 <-function(n){
    for (i in 2:n)
        if (is.prime(i) & i<=n){
        print(i)
    }
}

print_primes(19)
print_primes(29)
print_primes2(19)
print_primes2(29)


## -----------------------------------------------------------------------------
##TODO 14.5: Rewrite print_primes here and demonstrate its use with arguments 10 and 29

print_primes2<-function(n){

for(n in 2:n){
if(is.prime(n)=="TRUE"){
  print(paste("Prime Number",2,"is",n))}
}
}

print_primes <- function(n){
  position <- 1
  for(i in 2:n){
    if(is.prime(i)) {
      print(paste("Prime Number", position, "is", i))
      position <- position+1
    }
  }
}
print_primes(10)
print_primes2(10)


## -----------------------------------------------------------------------------
##TODO 14.6: If needed, rewrite print_primes here to give output without quotes and the preceeding [1]
print_primes <- function(n){
  position <- 1
  for(i in 2:n){
    if(is.prime(i)) {
      cat(paste("Prime Number", position, "is", i, "\n"))
      position <- position+1
    }
  }
}
print_primes(10)


## -----------------------------------------------------------------------------
x <- c("abcdefg", "123456789", "cats and dogs", "Michigan")
x


## -----------------------------------------------------------------------------
##TODO 14.7: extract characters as described above
substr(x, 3, 5)


## -----------------------------------------------------------------------------
##TODO 14.8: trim x as described above
strtrim(x, c(4,4,7,5))

