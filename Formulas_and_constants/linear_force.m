function result = linear_force(t, T1, Power, maxT)    
    T2 = T1 + 6.28;
    if t < T1
        result = 0;
    elseif t >= T1 && t <= T2
        result = (Power / (T2 - T1)) * (t - T1);
    else
        result = Power;
    end
end
