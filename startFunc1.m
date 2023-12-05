function f = startFunc1(t) %Название
global deltaX deltaY
syms t
% omega = 314;
omega = 1;
f(1) = 33*10^-6*cos(omega*t-1.88496)/deltaX;
f(2) = diff(f(1));
f(3) = diff(f(2));
f(4) = 12*10^-6*cos(omega*t-3.29867)/deltaY;
f(5) = diff(f(4));
f(6) = diff(f(5));
f(7) = 67*10^-6*cos(omega*t-1.51844)/deltaX;
f(8) = 74*10^-6*cos(omega*t-3.12414)/deltaY;