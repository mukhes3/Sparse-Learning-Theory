function b_new = UpdateBetaADMM(X,y,rho,theta,mu)

b_new = inv(X'*X + rho)*(X'*y + rho*(theta-mu)); 
