function [err,z_opt] = err_calc(A,r)

norm_aj = sum(A.*A); 
z_opt = (A'*r)'./norm_aj; 

err = sum((A*diag(z_opt) - r*ones(1,length(z_opt))).^2); 
