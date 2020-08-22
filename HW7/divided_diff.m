function [c] = divided_diff(x,y)
%divided_diff 
%takes in two arrays x and y
%returns array c
a=zeros(length(y));
a(:,1) = y;
for i=2:length(x)
    for j=2:i
        a(i,j) = (a(i,j-1)-a(i-1,j-1))/(x(i)-x(i-j+1));
    end
end
c = diag(a);
end

