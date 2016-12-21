function [OutMat, Supp] = GenOMTvec(p,m)

temp = zeros(p,1); 

Vec = datasample([1:p],m,'Replace',false); 


temp(Vec(1:ceil(m/2)))=1; 
temp(Vec(ceil(m/2)+1:end))=-1;

OutMat = temp; 
Supp = Vec; 
