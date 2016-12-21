function cost = CalcCostGroup(y,X,th,lambda)

[gLen,noGroups] = size(th); 
tempVal = 0;
penCost = 0; 

for i = 1:noGroups
    Zj = X(:,(i-1)*gLen+1:i*gLen); 
    tempVal = tempVal + Zj*th(:,i);  
    penCost = penCost +  lambda*norm(th(:,i));
end


cost = norm(y-tempVal)^2 + penCost; 
    