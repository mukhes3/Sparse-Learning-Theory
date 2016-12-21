function th_opt = Calc_opt_thj(Zj,th,lambda,rj)

[~,a] = size(Zj); 
if norm(Zj'*rj)>= lambda
    th_opt = inv(Zj'*Zj + lambda/th)*Zj'*rj ;
else
    th_opt = zeros(a,1); 
end