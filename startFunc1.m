function f = startFunc1(t) %Название
global deltaX deltaY
syms t
f(1) = 33*10^-6*cos(314*t-1.88496)/deltaX;
f(2) = diff(f(1));
f(3) = diff(f(2));
f(4) = 12*10^-6*cos(314*t-3.29867)/deltaY;
f(5) = diff(f(4));
f(6) = diff(f(5));
f(7) = 67*10^-6*cos(314*t-1.51844)/deltaX;
f(8) = 74*10^-6*cos(314*t-3.12414)/deltaY;