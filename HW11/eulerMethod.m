function [] = eulerMethod(f, a, b, alpha, h) 
%approximate the solution to the initial value problem

n = (b-a)/h + 1;
t = a;
w = alpha;
disp("(" + t + ", " + w + ")");

for i=1:n-1
    w = w + h*f(t,w);
    t = a + i*h;
    disp("(" + t + ", " + w + ")");
end

end

