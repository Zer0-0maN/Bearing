function f = startFunc2(t) %Название
global deltaX deltaY
syms t
f(1) = 27*10^-6*cos(314*t-2.14675)/deltaX;
f(2) = diff(f(1));
f(3) = diff(f(2));
f(4) = 15*10^-6*cos(314*t-3.75246)/deltaY;
f(5) = diff(f(4));
f(6) = diff(f(5));
f(7) = 172*10^-6*cos(314*t-1.53589)/deltaX;
f(8) = 177*10^-6*cos(314*t-3.12414)/deltaY;