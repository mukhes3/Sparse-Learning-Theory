function [x_final,Supp_final] = OTM_func(A,b,k)

[N,p] = size(A); 

x_i = zeros(p,1); 
r_i = b - A*x_i; 
Supp = []; 



for i = 1:k
    [err,z_opt] = err_calc(A,r_i); 
%     err
    err(Supp) = Inf; 
    [err_min, In] = min(err) ; 
    Supp = [Supp,In]; 
    A_s = A(:,Supp); 
    x_i(Supp) = inv(A_s'*A_s)*A_s'*b; 
    r_i = b - A*x_i; 
end

x_final = x_i; 
Supp_final = Supp; 
