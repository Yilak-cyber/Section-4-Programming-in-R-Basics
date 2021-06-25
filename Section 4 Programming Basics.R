# Section 4 Programming Basics
# Conditional expressions are one of the basic features of programming.
# They are used for flow control.
# The most common conditional expression is the if-else statement. 
# an example showing the general structure of an if-else statement

# ..........4.2 Conditionals.............
# ..........if-else statement.............
# Example 1
a <- 2

if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

# Example 2
# an example that tells us which states, if any, have a murder rate less than 0.5
library(dslabs)
View(murders)
data(murders)
murder_rate <- murders$total / murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind]) 
} else{
  print("No state has murder rate that low")
}

# changing the condition to < 0.25 changes the result
if(murder_rate[ind] < 0.25){
  print(murders$state[ind]) 
} else{
  print("No state has a murder rate that low.")
}
library(dplyr)
murders <- mutate(murders, rate = total / population * 100000)

# ..........ifelse() function.............
# the ifelse() function works similarly to an if-else conditional
a <- 5
ifelse(a > 0, 1/a, NA)

# the ifelse() function is particularly useful on vectors
a <- c(0,1,2,-4,5)
result <- ifelse(a > 0, 1/a, NA)
result
#Example 2
# we can create an object named short_name using ifelse conditional expression
# which shows either state name or the state abbreviation based on the numbers of 
# characters in the state name
state_name<-murders$state
short_name<-ifelse((nchar(murders$state)<6),state_name,murders$abb)
# if we use the mutate function of dplyr package, we can create a coloumn called 
# short_name in murders dataset 
library(dplyr)
View(murders)
murders <- mutate(murders, short_name=ifelse((nchar(murders$state)<6),state_name,murders$abb))
View(murders)
# the ifelse() function is also helpful for replacing missing values
# Here is an example of how this function can be readily used 
     # to replace all the missing values in a vector with zeros:
data(na_example)
na_example
# head(na_example)
no_nas <- ifelse(is.na(na_example), 0, na_example) 
no_nas
is.na(na_example)
is.na(no_nas)
sum(is.na(no_nas))
sum(is.na(na_example))
.....#any() and all() functions......

# the any() and all() functions evaluate logical vectors
z <- c(TRUE, TRUE, FALSE)
any(z)
all(z)
# The any function takes a vector of logicals and returns TRUE 
      #if any of the entries is TRUE. 
# The all function takes a vector of logicals and returns TRUE 
      # if all of the entries are TRUE. Here is an example:

# 4.3 Functions
avg<-function(x){
  s<-sum(x)
  n<-length(x)
  s/n
}
x<-1:100
avg(x)
# 50.5
#Now average is a function that computes the mean.
# So we can show that it gives you the same answer as mean(),
# using the identical function.
mean(x)
identical(mean(x),avg(x))
# TRUE
# For example, we can define a function that
# computes either the arithmetic or geometric average depending
# on a user-defined variable like this.

avg<-function(x,arithmetic=TRUE){
  n<-length(x)
  ifelse(arithmetic, sum(x)/n,prod(x)^(1/n))
}
g<-1:100
avg(g,arithmetic=TRUE)
avg(g,arithmetic=FALSE)

#For Loops
compute_s_n<-function(n){
  x<-1:n
  sum(x)
}
compute_s_n(100)
#5050
for(i in 1:5){
  print(i)
}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
m<-25
# create an empty vector 
s_n<-vector(length = m)
for (n in 1:m) {
  s_n[n]<-compute_s_n(n)
}
# we can create a dataframe containing each value of  the sequence 
# and the sum of the sequence for each value in the sequence
vec<-1:m
df<-data.frame(vec,s_n)
View(df)
#We can also overlay the two results using the function lines.
n <- 1:m
plot(n, s_n)
lines(n,n*(n+1)/2)
if_else()
