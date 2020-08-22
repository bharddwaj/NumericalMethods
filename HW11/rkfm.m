function [t,w,h] = rkfm(f,a,b,alpha,TOL,hmax,hmin)
%Runge-Kutta-Fehlberg Methods (Algorithm 5.3)
%Output : t,w,h,where w approximates y(t) and the step size h was used or a message that the minimum step size was exceeded.
K = zeros(6,1);
t = a;
w = alpha;
h = hmax;
FLAG = 1;
disp("(" + t + ", " + w + ")");
format long;
while FLAG == 1
    
    K(1) = h*f(t,w);
    K(2) = h*f(t + (1/4)*h, w + K(1)*(1/4));
    K(3) = h*f(t + (3/8)*h , w + (3/32)*K(1)+ (9/32)*K(2));
    K(4) = h*f(t + (12/13)*h, w + (1932/2197)*K(1) - (7200/2197)*K(2) +(7296/2197)*K(3));
    K(5) = h*f(t + h, w + (439/216)*K(1) - 8*K(2) + (3680/513)*K(3) - (845/4104)*K(4));
    K(6) = h*f(t + .5*h, w - (8/27)*K(1) + 2*K(2) - (3544/2565)*K(3) + (1859/4104)*K(4) - (11/40)*K(5));
    %disp(K);
    R = (1/h) * abs( (1/360)*K(1) - (128/4275)*K(3) - (2197/75240)*K(4) + (1/50)*K(5) + (2/55)*K(6) );
    
    if R <= TOL
        t = t + h;
        w = w + (25/216)*K(1) + (1408/2565)*K(3) + (2197/4104)*K(4) - (1/5)*K(5);
        
%         disp("(" + t + ", " + w + ", " + h + ")");
        fprintf("(");
        fprintf('%.15f',t);
        fprintf(", ");
        fprintf('%.15f',w);
        fprintf(", ");
        fprintf('%.15f',h);
        fprintf(")");
        fprintf("\n");
    end
    
    gamma = 0.84*(TOL/R)^.25;
    if gamma <= .1
        h = 0.1*h;
    elseif gamma >= 4
        h = 4*h;
    else
        h = gamma*h;    
    end
    
    if h > hmax
        h = hmax;
    end
    
    if t >= b
        FLAG = 0;
    elseif t+h > b
        h = b-t;
    elseif h < hmin
        FLAG = 0;
        disp("Minimum h exceeded.")
    end
end
end
% 3d y' = @(t,y)(t + 2*t^3)*y^3 - t*y, 0 ,2, 1/3, 10^-6, .5, 0.05
% actual = @(t)(3 + 2*t^2 + 6*exp(t^2))^-.5
