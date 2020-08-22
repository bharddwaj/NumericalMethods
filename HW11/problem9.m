actual = @(t)t^2*(exp(t)-exp(1));
f = @(t,y)(2/t)*y+t^2*exp(t);
fprime = @(t,y)(2/t)*f(t,y)+2*y*log(t)+(t^2+2*t)*exp(t);

n = 10;
h = 0.1;

w = zeros(n,0);
actual_values = zeros(n,0);
t = zeros(n);
w(1) = 0;
t(1) = 1; %should be the same value as a
for i=1:n
    t(i+1) = t(1) + i*h;
    w(i+1) = w(i) + h*((1+h/2)*f(t(i+1),w(i)));
    actual_values(i) = actual(t(i+1));
end
disp(w);
disp("that was w")
disp(actual_values);