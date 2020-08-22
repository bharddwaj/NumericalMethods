function [trace] = trace_1D_mat(v)
%trace_1D_mat Summary of this function goes here
% takes a one-dimensional array of length N^2  for a square matrix 
% (in a row-vectorized form) as an input
% returns the trace of the matrix.
trace = 0;
n = length(v)^.5;
i = 1;
while i <= length(v)
    trace = trace + v(i);
    i = i + n + 1;

end
end

