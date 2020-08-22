function [outputArg] = first_n_primes(N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
count = 0;
num = 2;
outputArg = "";
while count ~= N
    if isPrime(num)
        count = count + 1
        outputArg = num + "," + outputArg;  
    end
    num = num + 1;
    
    


end
end

