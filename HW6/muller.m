% Muller's method
% Input: f is a given as an inline function such as f = @(x)x^2;
function [p,k] = muller(f, p0, p1, p2, tol, maxIter)


    for k=1:maxIter
        % Function values at the three given points
        f0 = f(p0); 
        f1 = f(p1); 
        f2 = f(p2);
        fprintf("Iteration %d: p2='%f%+fj' and f(p2)=%0.8f.\n",k,real(p2),imag(p2), abs(f2))
      
        % Use three point to find a parabola and its zero
        %USING A NESTED FUNCTION
        p3 = find_p3(); 
        if abs(p3 - p2) < tol
            return;
        end             
        % For next iteration, reassign
        p0 = p1;
        p1 = p2;
        p2 = p3;      

    end
    disp('Method did not converge  within tolerance as maximum number of iteration reached.');
    
    
    function [p] = find_p3()
       % A unique parabola passes through three non-linear points
       % P(x) = a(x-p2)^2 + b(x-p2) + c
       % We can solve for the unknowns a, b, c of this parabola
        
        c = f2;
        denom = (p0-p2)*(p1-p2)*(p0-p1); % Denominator for b and a
        
        % HW Question: 
        % Fill up the expression for b, a and p
        b = ((p0-p2)^2*(f1-f2) - (p1-p2)^2*(f0-f2)) / denom;
        a = ((p1-p2)*(f0-f2)-(p0-p2)*(f1-f2)) / denom;
        
        p = p2 - (2*c)/(b+(b/abs(b))*sqrt(b^2-4*a*c));
    end
end
