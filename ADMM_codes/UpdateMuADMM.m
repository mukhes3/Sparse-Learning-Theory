function mu_new = UpdateMuADMM(mu,beta,theta,rho)

mu_new = mu  + rho*(beta - theta); 
