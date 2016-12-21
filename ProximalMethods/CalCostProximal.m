function Cost = CalCostProximal(X,y,b)
N = length(y); 
Cost = (.5/N)*norm(y - X*b)^2 ; 