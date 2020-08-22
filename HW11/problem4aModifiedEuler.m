f = @(t,y)(2 - 2*t*y)/(t^2+1);
a = 0;
b = 1;
alpha = 1;
h = 0.1;
actual = @(t)(2*t+1)/(t^2+1);

n = (b-a)/h + 1;
w = zeros(n+1,1);
K = zeros(2,1);
t = zeros(n+1,1);

t(1) = a;
w(1) = alpha;
disp("(" + t(1) + ", " + w(1) + ")");

for i=2:n
    K(1) = h*f(t(i-1),w(i-1));
    K(2) = h*f(t(i-1) + h, w(i-1) + K(1));

    w(i) = w(i-1) + .5*(K(1)+K(2));
    t(i) = t(i-1) + .1;
    disp("(" + t(i) + ", " + w(i) + ")");
end
disp("Now for the actual");
for i=2:n

   disp("(" + t(i)+ ", " + actual(t(i)) + ")");
end