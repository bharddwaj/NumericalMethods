function [output] = eval_poly(coefs, x)
% eval_polySummary of this function goes here
%   Detailed explanation goes here
n = 2;
%output = eval_poly_helper(coefs(1),2,coefs,x);
output = coefs(1);
output = output + x*(coefs(n) + eval_poly_helper(n+1,coefs,x));
        
        
end

