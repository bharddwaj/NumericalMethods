function integral = recursive_adaptive_simpson(f, a, b, tolerance, level,max_level)
%Adaptive simpson algorithm for approximating an integral
h = (b- a)/2;
approximation = h*(f(a) + 4*f(a+h) + f(b))/3;

%FD = f(a + h/2);
%FE = f(a + 3*h/2);
S1 = h*(f(a) + 4*f(a + h/2) + f(a+h))/6;
S2 = h*(f(a+h) + 4*f(a + 3*h/2) + f(b))/6;
if abs(S1+S2-approximation) < tolerance
    integral = S1+S2;
    
elseif level >= max_level
    disp("procedure failed")
else
    m = (a+b)/2;
    integral = recursive_adaptive_simpson(f, a, m, tolerance, level+1,max_level) + recursive_adaptive_simpson(f, m, b, tolerance, level+1,max_level);
    
end


end

