% ## Perform gaussian elimination.
% ## In place of changing elements of A to zero. Use them to save entries of L
% ## Returns the permutation vector and matrix A after transformation.

function [x] = matrixSolver (A,b)
  [A, Pt,L,U] = matrixFactorization(A);
  disp(size(L));
  disp(size(U));
  P = transpose(Pt);
  disp(size(P));
  disp(size(inv(L)));
  disp(size(inv(U)));
  z = inv(L)*P*b;
  disp(size(z));
  x = inv(U)*z;
  end
