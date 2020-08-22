% Copyright (C) 2019 Upendra Prasad
% Author: Upendra Prasad <upendraprasad@Upendras-MBP.fios-router.home>
% Created: 2019-02-08

function [root] = bisection (f, a,b,epsilon, delta, maxIter)
u = f(a);
v = f(b);
if sign(u)==sign(v)
    disp("Please provide a and b to have different sign for f.");
    return;
end
e = b-a; % Find the interval length

for i=1:maxIter 
    e=e/2; % Interval halving
    p=a+e;  % Bisection step by correction into existing value
    w=f(p);
    
    % Check for convergence
    if abs(w) < epsilon && abs(e) < delta  %R Let us require the two tolerances met
        disp("SUCCESS.")
        break;
    end
    if i==maxIter-1
        disp("Warning: Maximum number of iterations reached. Check for possible discontinuity.")
    end
    
    % Reassignment in the absence of convergence
    if(sign(u)==sign(w))
      a = p;
    else 
      b = p;
    end
    % disp(p) ## If you want to see all the iterates
end

root = p;
end
