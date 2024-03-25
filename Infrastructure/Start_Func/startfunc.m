function f = startfunc(enumRotor,t,enum)
    [I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
    if typeEnum == 0 % Для эллиптического подшипника 
        f = startfunc_elliptic(t,enum,deltaX,deltaY);
    elseif typeEnum == 1 % Для сегментного подшипника 
        f = startfunc_segment(t,enum,deltaX,deltaY);
    end
end

