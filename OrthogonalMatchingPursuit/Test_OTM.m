% This program tries to emulate figure 2 of the paper by Donoho et. al.
% 2009

clear; close all; clc; 

%generate random matrix
A = random('norm',zeros(100,200),ones(100,200)); 


NoMax=70; 
NoRuns=100; 
count = zeros(1,length(2:NoMax)); 

for i = 2:NoMax 
    for j = 1:NoRuns
        [x_orig, Supp_orig] = GenOMTvec(200,i); 
        b = A*x_orig; 
        [x_est,Supp] = OTM_func(A,b,i); 
        if norm(sort(Supp)-sort(Supp_orig))==0
            count(i-1) = count(i-1)+1; 
        end
    end
end

p_corr = count/NoRuns; 


%plotting figure
figure(1)
plot([2:NoMax],p_corr); 
xlabel('Cardinality of Solution'); 
ylabel('Probability of success'); 
saveas(1,'Fig2_remade_donoho'); 
saveas(1,'Fig2_remade_donoho.jpg'); 
