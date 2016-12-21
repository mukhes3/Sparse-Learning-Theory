%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              Run Group Lasso code 
%
%                                  Sumit Mukherjee 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
clear; 

%%                             Initialization 



n = 50; 
p = 100; 

b = [zeros(1,10),1.25*ones(1,10),zeros(1,10),linspace(-2,-1.5,10),zeros(1,p-40)]'; 

b0 = 3.4; 
sig = .25; 

X = rand([n,p]); 
y = b0 + X*b + sig*rand(n,1); 

eps = 1e-12; 

iterMax = 10; 

lambda = 0.1;
%%                           Solving group lasso 

y = y - mean(y); 

th = zeros(10,p/10); 

f_handle = @(x,Zj,rj,lambda) CalCost(x,Zj,rj,lambda) ; 

f_cost = zeros(1,iterMax); 

for i = 1:iterMax 
    for j = 1:p/10
        thj = th(:,j);
        Zj = X(:,(j-1)*10+1:j*10);
        r = y; 
        for k = 1:p/10
            Zk = X(:,(k-1)*10+1:k*10);
            thk = th(:,k); 
            r = r - Zk*thk; 
        end
        
        rj = r + Zj*thj; 
        [U,D,V] = svd(Zj); 
        r_s = U'*rj; 
        
        phi = golden_search(f_handle,1e-3,norm(r_s)^2, eps, Zj, rj, lambda); 
        th(:,j) = Calc_opt_thj(Zj,abs(phi),lambda,rj); 
    end
        
    f_cost(i) = CalcCostGroup(y,X,th,0); 
end

%%                  plot cost function vs IterNo 

figure(1) 
plot(1:length(f_cost),f_cost,'LineWidth',3);
xlabel('Iteration no.'); ylabel('Loss'); 
saveas(1,'LossVSiteration_l_0_1.jpg'); 

%%                  Show how cost varies with Lambda 

l = logspace(-2,2,5); 
f_cost = zeros(1,length(l)); 

for I = 1:length(l)
   th = zeros(10,p/10); 



for i = 1:iterMax 
    for j = 1:p/10
        thj = th(:,j);
        Zj = X(:,(j-1)*10+1:j*10);
        r = y; 
        for k = 1:p/10
            Zk = X(:,(k-1)*10+1:k*10);
            thk = th(:,k); 
            r = r - Zk*thk; 
        end
        
        rj = r + Zj*thj; 
        [U,D,V] = svd(Zj); 
        r_s = U'*rj; 
        
        phi = golden_search(f_handle,1e-3,norm(r_s)^2, eps, Zj, rj, l(I)); 
        th(:,j) = Calc_opt_thj(Zj,abs(phi),l(I),rj); 
    end
        
end 
f_cost(I) = CalcCostGroup(y,X,th,l(I)); 
end

figure(2)
semilogx(l,f_cost,'LineWidth',3); 
xlabel('\lambda'); ylabel('Loss');
saveas(2,'LossVsLambda.jpg'); 
