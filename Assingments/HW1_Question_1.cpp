// [[Rcpp::depends(RcppArmadillo)]]

#include <fstream>
#include <iostream>
#include <RcppArmadillo.h>

using namespace Rcpp;

// [[Rcpp::export]]
List Question_1(const arma::mat A, const arma::mat Z) {
  
  arma::mat D = trans(Z)*trans(A)*A*Z;
  
  return List::create(Named("D") = D);
}







