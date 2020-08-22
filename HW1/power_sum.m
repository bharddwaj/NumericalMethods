function [sum,nums] = power_sum(N,k)
%power_sum Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
nums = ones(N,1);
for i = 1:N
    nums(i) = i^k;
    sum = sum + nums(i);
end
end

