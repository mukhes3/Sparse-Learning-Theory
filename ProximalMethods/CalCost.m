function Cost = CalCost(x,Zj,rj,lambda)

[U,D,V] = svd(Zj); 

f = norm(inv(lambda + x*D'*D)*D'*U'*rj)^2; 

Cost = f-1; 