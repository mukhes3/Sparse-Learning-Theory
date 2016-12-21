%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                                Run ADMM 
%
%                                  Sumit Mukherjee 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
clear; 

%%                             Initialization 


n = 1000; 
p = 100; 

b = [zeros(1,10),1.25*ones(1,10),zeros(1,10),linspace(-2,-1.5,10),zeros(1,p-40)]'; 

B = 1; 

b0 = 0; 
sig = 0.1; 

X = rand([n,p]); 
y = b0 + X*b + sig*rand(n,1); 
y = y-mean(y); 

beta = zeros(p,B); 
mu = 100*rand(p,B);
theta = mean(beta,2); 
rho = .1; 
lambda = 1; 

nIter = 100; 

%%                           Run ADMM 
N = length(y); 

b_size = N/B; 

CostRec = zeros(1,nIter); 

for i = 1:nIter
    for j = 1:B
        X_temp = X((j-1)*b_size+1:j*b_size,:); 
        y_temp = y((j-1)*b_size+1:j*b_size); 
        
        beta(:,j) = UpdateBetaADMM(X_temp,y_temp,rho,theta,mu(:,j)); 
    end
    
    beta_m = mean(beta,2); 
    mu_m = mean(mu,2); 
    theta = UpdateThetaADMM(beta_m,mu_m,lambda,B,rho); 
    
    for j = 1:B
        
        mu(:,j) = UpdateMuADMM(mu(:,j),beta(:,j),theta,rho);  
    end
    
    
    
    CostRec(i) = CalCostADMM(X,y,beta,B);
end

figure(1)
plot(1:nIter,CostRec,'LineWidth',3);
xlabel('Iteration no'); ylabel('Cost'); 
saveas(1,strcat('CostVsIter_B',int2str(B),'.jpg')); 

