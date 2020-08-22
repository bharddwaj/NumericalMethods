


f = @(t)t^6*sin(1/t);
a = 0;
b = 1;
n = 6;
%composite simspons rule method for approximating an integral
%copied from the one in hw 7 wiith a slight modification to do the
%piecewise problem
h = (b-a)/n;
x0 = 0+f(b);
x1 = 0;
x2 = 0;

for i=1:n-1
    if mod(i,2) == 0 %if i is even
        x2 = x2 + f(a+i*h);
    else
        x1 = x1 + f(a+i*h);
    end
    
end

definiteIntegral = h*(x0+2*x2+4*x1)/3;

disp(definiteIntegral)

