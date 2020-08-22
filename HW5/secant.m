% Implements secant method
% Input: f is an given as an anonymous function such as f = @(x)x^2;
function [p,k] = secant(f, p_0,p_1, tol, maxIter)
    %epsilon = 10^(-14);
    %df = @(f,x) (f(x+epsilon) - f(x))/epsilon; % Approx derivative. Not a stable method
    q_0 = f(p_0);
    q_1 = f(p_1);
    
    %crnt = p_0; % Current Iterant
    for k=2:maxIter
        %p = crnt - f(crnt)/df(f, crnt);  % Find next iteration by Newton-Raphson
        p = p_1 - q_1*(p_1 - p_0)/(q_1-q_0);
        if abs(p - p_1) < tol
            return;
        end
        p_0 = p_1;
        q_0 = q_1;
        p_1 = p;
        q_1 = f(p);
    end
    disp('secant method did not converge  within tolerance as maximum number of iteration reached.');
end
