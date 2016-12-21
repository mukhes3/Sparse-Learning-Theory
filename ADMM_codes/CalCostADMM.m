function Cost = CalCostADMM(X,y,b,B)
N = length(y);
b_size = N/B; 
temp = 0; 
for i = 1:B
    X_temp = X((i-1)*b_size+1:i*b_size,:);
    y_temp = y((i-1)*b_size+1:i*b_size);
    
    temp = temp + (.5/b_size)*norm(y_temp - X_temp*b(:,i))^2 ;
end

Cost = temp; 