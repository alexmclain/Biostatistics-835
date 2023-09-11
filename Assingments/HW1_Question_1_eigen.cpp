// [[Rcpp::depends(RcppArmadillo, RcppEigen)]]

#include <RcppArmadillo.h>
#include <RcppEigen.h>


// [[Rcpp::export]]
SEXP Question_1_eigen(const Eigen::Map<Eigen::MatrixXd> A, const Eigen::Map<Eigen::MatrixXd> Z){
  
  Eigen::MatrixXd D = Z.transpose() * A.transpose() * A * Z;
  
  return Rcpp::wrap(D);
}


