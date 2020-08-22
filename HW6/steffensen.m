function [p] = steffensen(f,p_0,tol,maxIter)
%Steffensen Method 
%approximating the root
for k=1:maxIter
    p_1 = f(p_0);
    p_2 = f(p_1);
    p = p_0 - (p_1 - p_0)^2/(p_2-2*p_1+p_0);
    
    if abs(p - p_0) < tol
        return
    end
    
    p_0 = p;
end
end

