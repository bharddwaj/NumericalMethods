function [bool] = isPrime(x)
%UNTITLED2 Summary of this function goes here
%returns True if the number is prime and False if the number isn't prime.
bool = true;
for i = 2:sqrt(x)
    if mod(x,i) == 0
        bool = false;
        
    end
end

end

