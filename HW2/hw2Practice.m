% MATLAB PRACTICE (Submit the code online)

% Create two matrices A = [1 2 3; 4  2 5; -1 3 0]; B = [2 4 1; 3 2 0; 1 5 2];
% Show following transpose property: (AB)' = B'A'.
% Show the following inverse properties: inverse of AB = inv(B) inv(A).
% Show the following determinant properties: det(AB) = det(A) det(B).
% Let p = [3 1 2]; What is the output of A(p,:) and A(:,p)?
% Let  M = eye(3); M(3,2) = 10; What is M*A?

A = [1 2 3; 4  2 5; -1 3 0]; 
B = [2 4 1; 3 2 0; 1 5 2];
disp((A*B)' == B'*A'); %every element is the same
disp(inv(A*B));
disp(inv(B)*inv(A)); %looking at the two matrices you can see they are the same

disp(det(A*B));
disp(det(A) * det(B)); %same determinant value of -51

p = [3 1 2];
disp(A(p,:)); 
disp(A(:,p));

M = eye(3) %identity matrix
M(3,2) = 10;
disp(M);
disp(M*A); % 10 times the second row added to the third row

function [retval] = fibonacci (n)
if (n<0)
     fprintf("Give nonnegative integer please.")
end

if n==0 || n==1
    retval = 1;
else
    retval = fibonacci(n-1)+fibonacci(n-2);
end
end


