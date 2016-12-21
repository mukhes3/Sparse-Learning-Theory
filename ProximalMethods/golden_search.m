function x_opt = golden_search(f_handle,x_min,x_max, eps, Zj, rj, lambda)

temp_cost = 0; 
x_temp = 0; 

% x_max 
% x_min
% 
% feval(f_handle,x_max,Zj,rj,lambda) 
% feval(f_handle,x_min,Zj,rj,lambda)
% 
% Zj
% rj

while(1) 

    
    diff = x_max - x_min; 
    a = x_min + rand*diff;  
    b = a + rand*(x_max-a);   
    
    f_a = feval(f_handle,a,Zj,rj,lambda);  
    f_b = feval(f_handle,b,Zj,rj,lambda); 
    
%       bla = input('enter'); 
    if f_b < 0 && f_a <=0
        x_max = b; 
        x_min = x_min; 
         
    end
    
    if f_b>=0 && f_a>=0
        x_max = x_max; 
        x_min = a; 
    end
    
    if f_b <= 0 && f_a >=0 
        x_max = b; 
        x_min = a; 
    end
    
    x_mid = (x_max + x_min)/2; 
    temp_cost = feval(f_handle,x_mid,Zj,rj,lambda); 
    
    

    
    if abs(temp_cost)<eps
        break; 
    end


    
end

% temp_cost
x_opt  = x_mid; 

end
        