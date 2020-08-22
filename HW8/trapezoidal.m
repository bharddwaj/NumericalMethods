function definiteIntegral = trapezoidal(f, a, b, n)
% composite trapezoidal rule for approximating an integral
    h=(b-a)/n; 
    sum=0;
    % need only consider the n-1 remaining sub-intervals
    for j=1:n-1
        sum = sum + f(a + j*h);
    end
    definiteIntegral = h/2*(f(a)+2*sum+f(b));
end