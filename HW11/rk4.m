function  []= rk4(f, a, b, alpha, h) 
%Runge kutta method order 4
% output: approximation w to y at the (A + 1) values of t.

%h = (b-a)/n;
n = (b-a)/h;
K = zeros(4,1);
w = zeros(n+1,1);
t = zeros(n+1,1);
t(1) = a;
w(1) = alpha;
disp("(" + t(1) + ", " + w(1) + ")");

for i=1:n
    K(1) = h*f(t(i),w(i));
    
    K(2) = h*f(t(i) + h/2,w(i) + K(1)/2);
  
    K(3) = h*f(t(i) + h/2,w(i) + K(2)/2);
  
    K(4) = h*f(t(i) + h,w(i) + K(3));

    
    w(i+1) = w(i) + (K(1) + 2*K(2) + 2*K(3) + K(4))/6;
    t(i+1) = a + i*h;
%     disp("(" + t(i+1) + ", " + w(i+1) + ")");
    fprintf("(");
    fprintf('%.5f',t(i+1));
    fprintf(", ");
    fprintf('%.15f',w(i+1));
    fprintf(")");
    fprintf("\n");
end

end

% 16d: f =@(t,y)-t*y+ 4*t/y ; a = 0 b = 1 ; alpha = 1; h = 0.1

