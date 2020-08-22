function [prev] = eval_poly_helper(n,coefs,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if(n == length(coefs) - 1)
        prev = x*(coefs(n)+x*coefs(length(coefs)));
    else
        
     
    prev = x*(coefs(n) + eval_poly_helper(n+1,coefs,x));
        
        
    end
        
end

