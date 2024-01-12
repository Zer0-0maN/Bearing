function f = impulse(Power,maxT)
    syms t
    f(t) = Power * 0.092 * sin(t*pi/maxT);
    f(t) = f(t) - Power * 0.106 * sin(2*t*pi/maxT);
    f(t) = f(t) + Power * 0.029 * sin(3*t*pi/maxT);
    f(t) = f(t) + Power * 0.071 * sin(4*t*pi/maxT);
    f(t) = f(t) - Power * 0.109 * sin(5*t*pi/maxT);
    f(t) = f(t) + Power * 0.054 * sin(6*t*pi/maxT);
    f(t) = f(t) + Power * 0.044 * sin(7*t*pi/maxT);
    f(t) = f(t) - Power * 0.102 * sin(8*t*pi/maxT);
    f(t) = f(t) + Power * 0.072 * sin(9*t*pi/maxT);
    f(t) = f(t) + Power * 0.016 * sin(10*t*pi/maxT);
    f(t) = f(t) - Power * 0.086 * sin(11*t*pi/maxT);
    f(t) = f(t) + Power * 0.081 * sin(12*t*pi/maxT);
    % константа 13-ой кратности мала
    f(t) = f(t) - Power * 0.065 * sin(14*t*pi/maxT);
    f(t) = f(t) + Power * 0.08 * sin(15*t*pi/maxT);
    f(t) = f(t) - Power * 0.028 * sin(16*t*pi/maxT);
    f(t) = f(t) - Power * 0.041 * sin(17*t*pi/maxT);
    f(t) = f(t) + Power * 0.071 * sin(18*t*pi/maxT);
    f(t) = f(t) - Power * 0.04 * sin(19*t*pi/maxT);
    f(t) = f(t) - Power * 0.02 * sin(20*t*pi/maxT);
    f(t) = f(t) + Power * 0.056 * sin(21*t*pi/maxT);
    f(t) = f(t) - Power * 0.042 * sin(22*t*pi/maxT);
    % константа 23-ой кратности мала
    f(t) = f(t) + Power * 0.038 * sin(24*t*pi/maxT);
    f(t) = f(t) - Power * 0.037 * sin(25*t*pi/maxT);
    f(t) = f(t) + Power * 0.008 * sin(26*t*pi/maxT);
    f(t) = f(t) + Power * 0.022 * sin(27*t*pi/maxT);
    f(t) = f(t) - Power * 0.028 * sin(28*t*pi/maxT);
    f(t) = f(t) + Power * 0.011 * sin(29*t*pi/maxT);
    f(t) = f(t) + Power * 0.009 * sin(30*t*pi/maxT);
    f(t) = f(t) - Power * 0.016 * sin(31*t*pi/maxT);
    f(t) = f(t) + Power * 0.008 * sin(32*t*pi/maxT);
end