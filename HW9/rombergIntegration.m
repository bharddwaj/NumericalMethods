function final_R = rombergIntegration(f,a,b,n,epsilon)
%Romberg Integration approximation of the integral
%given endpoints a and b and integer n >0  and function f
%output an array 
h = b-a;
R = zeros(n);
final_R = zeros(n);
final_R(1,1) = h/2*(f(a) + f(b));
i = 2;
%for i=2:n originally had this for when I did the book implementation with
%the n as a parameter
% n = 2;
trap_sum = 0;
%while abs(R(n-1,n-1)-R(n,n)) > epsilon %stopping criteria
for i=2:n
    
    for k=1:2^(i-2)
        trap_sum = trap_sum+ f(a+(k-0.5)*h);
    end
    R(2,1) = .5*R(1,1) + .5*h*trap_sum;
    trap_sum = 0;
    for j=2:i
        R(2,j) = R(2,j-1) + (R(2,j-1) - R(1,j-1))/(4^(j-1) - 1);
%         final_R(i,j) = R(2,j);
    end
    final_R(i,:) = R(2,:);
    h=h/2;
    if(abs(R(1,i)-R(2,i)) < epsilon)
        break
    end
    for j=1:i
        R(1,j) = R(2,j);
    end
   
%     n = n+1;
%     i = i+1;
end


end

