function [] = adam_bashforth5(f, a, b, alpha, h) 
%adam bashforth five step explicit method

n = (b-a)/h;
K = zeros(4,1);
t = zeros(n+1,1);
w = zeros(n+1,1);
t(1) = a;
w(1) = alpha;
disp("(" + t(1) + ", " + w(1) + ")");



for i=2:5
    K(1) = h*f(t(i-1),w(i-1));
    K(2) = h*f(t(i-1) + h/2,w(i-1) + K(1)/2);
    K(3) = h*f(t(i-1) + h/2,w(i-1) + K(2)/2);
    K(4) = h*f(t(i-1) + h,w(i-1) + K(3));
    
    w(i) = w(i-1) + (K(1) + 2*K(2) + 2*K(3) + K(4))/6;
    t(i) = a + (i-1)*h;
%     disp("(" + t(i) + ", " + w(i) + ")");
    fprintf("(");
    fprintf('%.5f',t(i));
    fprintf(", ");
    fprintf('%.15f',w(i));
    fprintf(")");
    fprintf("\n");
end
% disp(n);
for i = 6:n+1 % i = 5:n
   %w(i+1) = w(i) + (h/720)*( 1901*f(t(i),w(i)) - 2774*f(t(i-1), w(i-1)) + 2616*f(t(i-2), w(i-2)) -1274*f(t(i-3),w(i-3)) + 251*f(t(i-4), w(i-4)) );
   w(i) = w(i-1) + h*( 1901*f(t(i-1),w(i-1)) - 2774*f(t(i-2), w(i-2)) + 2616*f(t(i-3), w(i-3)) -1274*f(t(i-4),w(i-4)) + 251*f(t(i-5), w(i-5)) )/720;
%     disp("(" + t(i) + ", " + w(i) + ")");
   t(i) = a + (i-1)*h;
   fprintf("(");
   fprintf('%.5f',t(i));
   fprintf(", ");
   fprintf('%.15f',w(i));
   fprintf(")");
   fprintf("\n");
end



end

% f = @(t,y)1+y/t + (y/t)^2 , 1, 1.5, 0 ,0.1
% adamActual = @(t)t*tan(log(t))