function sum = Riemann(f,a,b,n,shift=0)
    delta=(b-a)/n;
    if shift >1 || shift < 0
        disp("Shift must be between 0 and 1 where 0 is for left sum and 1 is for right sum.")
        return;
    end
    xk = a + shift*delta;
    sum=0;
    % need only consider the n-1 remaining sub-intervals
    for k=0:n-1
        sum = sum + f(xk);
        xk += delta;
    end
    sum=sum*delta;
    disp(sum);
end