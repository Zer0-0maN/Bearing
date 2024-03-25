function f = startfunc(enumRotor,t,imbalanceBool)
    [I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
    if typeEnum == 0 % Для эллиптического подшипника 
        f = startfunc_elliptic(t,imbalanceBool,deltaX,deltaY);
    elseif typeEnum == 1 % Для сегментного подшипника 
        f = startfunc_segment(t,imbalanceBool,deltaX,deltaY);
    end
end

