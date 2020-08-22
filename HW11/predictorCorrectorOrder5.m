function [] = predictorCorrectorOrder5(f, a, b, alpha, h)
%Adams 5th Order Predictor-Corrector
format long;
n = (b-a)/h;
K = zeros(4,1);
t = zeros(n+2,1);
w = zeros(n+2,1);
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

for i = 6:n+1
    t(i) = a + (i-1)*h; %because matlab starts at 1 as opposed to 0 we are 1 index off
    w(i) = w(i-1) + h*( 1901*f(t(i-1),w(i-1)) - 2774*f(t(i-2), w(i-2)) + 2616*f(t(i-3), w(i-3)) -1274*f(t(i-4),w(i-4)) + 251*f(t(i-5), w(i-5)) )/720; %prediction wi
    w(i) = w(i-1) + h*( 251*f(t(i),w(i)) + 646*f(t(i-1),w(i-1)) - 264*f(t(i-2),w(i-2)) + 106*f(t(i-3),w(i-3)) - 19*f(t(i-4),w(i-4)) )/720;
%     disp("(" + t(i) + ", " + w(i) + ")");
    fprintf("(");
    fprintf('%.5f',t(i));
    fprintf(", ");
    fprintf('%.15f',w(i));
    fprintf(")");
    fprintf("\n");
end
end

% f = @(t,y)-5*y+5*t^2 + 2*t , 0, 1, 1/3, 0.1
% correctorOrder5 = @(t)t^2 + (1/3)*exp(-5*t)