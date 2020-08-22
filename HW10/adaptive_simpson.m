function integral = adaptive_simpson(f, a, b, tolerance, max_level)
%Adaptive simpson algorithm for approximating an integral
    v = zeros(8);
    approximation = 0;
    a_vec = zeros(max_level);
    h_vec = zeros(max_level);
    FA_vec = zeros(max_level);
    FB_vec = zeros(max_level);
    FC_vec = zeros(max_level);
    S_vec = zeros(max_level);
    L_vec = zeros(max_level);
    TOL_vec = zeros(max_level);
    i = 1;
    TOL_vec(i) = 10*tolerance;
    a_vec(i) = a;
    h_vec(i) = (b- a)/2;
    FA_vec(i) = f(a);
    FC_vec(i) = f (a + h_vec(i));
    FB_vec(i) = f(b);
    S_vec(i) = h_vec(i)*(FA_vec(i) + 4*FC_vec(i) + FB_vec(i))/3; %simspon method approximation for the whole interval
    disp(S_vec(i))
    L_vec(i) = 1;
    while i>0
        FD = f(a_vec(i) + h_vec(i)/2);
        FE = f(a_vec(i) + 3*h_vec(i)/2);
        %Approximations from Simpson's method for halves of subintervals
        S1 = h_vec(i)*(FA_vec(i) + 4*FD + FC_vec(i))/6;
        S2 = h_vec(i)*(FC_vec(i) + 4*FE + FB_vec(i))/6;
        disp(S1)
        disp(S2)
        v(1) = a_vec(i);
        v(2) = FA_vec(i);
        v(3) = FC_vec(i);
        v(4) = FB_vec(i);
        v(5) = h_vec(i);
        v(6) = TOL_vec(i);
        v(7) = S_vec(i);
        v(8) = L_vec(i);

        i = i -1; %Delete the level
        if abs(S1 + S2 - v(7)) < v(6)
            approximation = approximation + (S1 + S2);
%             break;
        elseif v(8) >= max_level
            disp("Level Exceeded"); %procedure fails
            break
        else

            i = i+1; %Data for the right half of the subinterval
                a_vec(i) = v(1) + v(5);
                FA_vec(i) = v(3);
                FC_vec(i) = FE;
                FB_vec(i) = v(4);
                h_vec(i) = v(5)/2;
                TOL_vec(i) = v(6)/2;
                S_vec(i) = S2;
                L_vec(i) = v(8) + 1;
            
            i = i + 1; %Data for the left half of the subinterval
                a_vec(i) = v(1);
                FA_vec(i) = v(2);
                FC_vec(i) = FD;
                FB_vec(i) = v(3);
                h_vec(i) = h_vec(i-1);
                TOL_vec(i) = TOL_vec(i-1);
                S_vec(i) = S1;
                L_vec(i) = L_vec(i-1);

        end

    end
    integral = approximation;

end

