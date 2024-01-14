function f = func_segment(t,x,Z,impulseX,powerX,impulseY,powerY) 

    function fPulseX = FPx(t)
        if impulseX == 0
            fPulseX = 0;
        elseif impulseX == 1
            fPulseX = impulse_force(t,200,powerX,300);
        elseif impulseX == 2
            fPulseX = linear_force(t,200,powerX,300);
        end
    end
    
    function fPulseY = FPy(t)
        if impulseY == 0
            fPulseY = 0;
        elseif impulseY == 1
            fPulseY = impulse_force(t,200,powerY,300);
        elseif impulseY == 2
            fPulseY = linear_force(t,200,powerY,300);
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