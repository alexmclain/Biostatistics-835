

### For 5b
### Say you have a function called df(lamda,X) which will calculate 
### the degrees of freedom (df) for a particular lambda and a 
### predictor matrix X (see notes). 

### Then, we can use the following to determine how far the df resulting
### from a particular lambda is from the desired k
L <- function(lambda,k,X) { 
  (df(lambda,X) - k)^2
}

### To find the value of lambda that gives a df = k we can use 
### the optimize function.
### For example, the lambda that gives a df = 8, would be:

L_opt <- optimize(L,c(0,10000000),X=X,k=8)
lambda_8 <- L_opt$minimum

### Then I can use lambda_8 to get the beta estimates via the 
### formula for the ridge regression coefficients.

### For 5c
### We can do a similar thing. Say the function s_lam(lambda,X,Y,t0)
### Gives the s value for a particular lambda, X, Y, and t0 (sum of 
### the absolute value of the beta estimates from a least squares
### model). Note, s_lam(lambda,X,Y,t0) would need to use glmnet to 
### get the beta estimates from a lasso with lambda.

### Then, we can use the following to determine how far the s resulting
### from a particular lambda is from the desired s
L <- function(lambda,s,X,Y,t0) {
  (s_lam(lambda,X,Y,t0) - s)^2
}

### To find the value of lambda that gives a s = p we can use 
### the optimize function.
### For example, the lambda that gives a s = 0.15, would be:

L_opt <- optimize(L,c(0,1),X=X,Y=Y,s=0.15,t0=t0)
lambda_015 <- L_opt$minimum

### Then we can refit in glmnet with lambda_015 to get the estimates.

