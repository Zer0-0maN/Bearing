function f = func_elliptic(t,x,Z,impulseX,impulseY) %Название

function fPulseX = FPx(t)
    if impulseX == 0
        fPulseX = 0;
    else
        fPulseX = impulse(t,1,impulseX);
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
    -1.737*x(3)+2.47*x(6)-0.36*x(2)-0.051*Z*x(2)-2.524*Z*x(5)+...
    +0.256*(-1)*x(1)-0.355*Z*x(1)+0.882*x(4)-2.436*Z*x(4)+...
    +0.057*cos(omega*t)-0.001*sin(omega*t)-0.0003*FPy(omega*t)+...
    +0.017*FPx(omega*t);
    x(5);x(6);
    -0.106*x(3)-1.018*x(6)+0.053*Z*x(2)-0.36*x(5)+0.051*Z*x(5)+...
    +0.097*Z*x(1)-0.045*x(1)-0.313*x(4)-0.078*Z*x(4)-0.001*cos(omega*t)+...
    +0.008*sin(omega*t) - 0.0003*FPx(omega*t) + 0.0024*FPy(omega*t);
    1.71*x(1)-2.286*x(4)+0.977*x(2)+0.123*x(5);
    0.931*x(1)+6.638*x(4)+0.119*x(2)+6.811*x(5)];
end