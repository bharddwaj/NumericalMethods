f = @(t,y)(2 - 2*t*y)/(t^2+1);
a = 0;
b = 1;
alpha = 1;
h = 0.1;
actual = @(t)(2*t+1)/(t^2+1);

n = (b-a)/h + 1;
w = zeros(n+1,1);
t = zeros(n+1,1);

w(1) = alpha;
t(1) = a;
disp("(" + t(1) + ", " + w(1) + ")");
for i=2:n
    w(i) = w(i-1) + h*f(t(i-1) + h/2, w(i-1) + (h/2)*f(t(i-1),w(i-1)) );
    t(i) = t(i-1) + h;
     disp("(" + t(i) + ", " + w(i) + ")");
end

disp("Now for the actual");
for i=2:n

   disp("(" + t(i)+ ", " + actual(t(i)) + ")");
end