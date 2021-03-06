% Implements Newton-Raphson method
% Input: f is an given as an anonymous function such as f = @(x)x^2;
function [p,k] = modifiedNewton(f, p_0, tol, maxIter)
    epsilon = 10^(-14);
    df = @(f,x) (f(x+epsilon) - f(x))/epsilon; % Approx derivative. Not a stable method
    df2 = @(f,x) (f(x+epsilon)- 2*f(x) +f(x-epsilon))/epsilon*epsilon;
    
    crnt = p_0; % Current Iterant
    for k=1:maxIter
        firstDerivative = df(f, crnt);
        p = crnt - f(crnt)*firstDerivative/((firstDerivative*firstDerivative) - f(crnt)*df2(f,crnt));  % Find next iteration by Newton-Raphson
        if abs(p - crnt) < tol
            return;
        end
        crnt = p;
    end
    disp('Newton method did not converge  within tolerance as maximum number of iteration reached.');
end