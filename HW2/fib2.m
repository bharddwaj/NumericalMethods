function [retval] = fib2(n)
%fib2 Iterative Code for Fibonacci code
%   Detailed explanation goes here
if (n<0)
     fprintf("Give nonnegative integer please.")
elseif n == 1 || n == 2
    retval = 1;
else
    %retval = 1/sqrt(5)*((1+sqrt(5)/2)^n - (1-sqrt(5)/2)^n);
    % ^this equation from the book wasn't really workings
  prev = 1; %previous fibonacci value
  retval = 1;
  for i =3:n
    temp = retval;
    retval = prev + temp;
    prev = temp;
  end   
         
end
end

