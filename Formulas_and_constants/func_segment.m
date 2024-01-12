function f = func_segment(t,x,Z,impulseX,impulseY) %Название

    function fPulseX = FPx(t)
    if impulseX == 0
        fPulseX = 0;
    else
        fPulseX = impulse(t,1,impulseBoolX);
    end
end

function fPulseY = FPy(t)
    if impulseY == 0
        fPulseY = 0;
    else
        fPulseY = impulse(t,1,impulseY);
    end
end

%omega = 314;
omega = 1.667;

f = [x(2);x(3);
    -1.436*x(3)-0.36*x(2)-0.693*Z*x(5)-0.411*x(1)-0.955*Z*x(4)+...
    +0.126*cos(omega*t) + 0.08*FPx(omega*t);
    x(5);x(6);
    -1.408*x(6)+0.191*Z*x(2)-0.369*x(5)-0.451*x(4)+1.131*Z*x(1)+...
    0.067*sin(omega*t) + 0.043*FPy(omega*t);
    4.86*x(1)+3.407*x(2);
    9.036*x(4)+6.56*x(5)];
end