%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              Run Proximal gradient descent code 
%
%                                  Sumit Mukherjee 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
clear; 

%%                             Initialization 



n = 500; 
p = 100; 

b = [zeros(1,10),1.25*ones(1,10),zeros(1,10),linspace(-2,-1.5,10),zeros(1,p-40)]'; 

b0 = 3.4; 
sig = .25; 

X = rand([n,p]); 
y = b0 + X*b + sig*rand(n,1); 

lambda = 0.1;
st = 1; 

nIter = 1000; 

%%                           Run proximal gradient descent 

y = y-mean(y); 

beta = zeros(p,1); 

Cst = zeros(1,nIter); 

for i = 1:nIter 
    Cst(i) = CalCostProximal(X,y,beta); 
    beta = UpdateBetaProximal(X,y,st,beta,lambda)
    
end


%%                     Plot 

figure(1) 
plot(1:length(Cst),Cst,'LineWidth',3); 
xlabel('Iteration No.'); ylabel('Cost'); 
saveas(1,'Prox_st_1.jpg'); 
