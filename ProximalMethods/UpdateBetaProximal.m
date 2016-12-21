function b_new = UpdateBetaProximal(X,y,st,b,lambda)

th = st*lambda; 
N = length(y); 
temp = b + (st/N)*X'*(y - X*b); 
b_new = wthresh(temp,'s',th); 
