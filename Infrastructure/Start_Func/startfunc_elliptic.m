function f = startfunc_elliptic(t,enum,deltaX,deltaY) % Для эллиптического подшипника 
syms t
omega = 1.667;
if enum == 0  % Для ротора без дисбаланса 
    f = zeros(1, 8);
end
if enum == 1        % Для ротора с дисбалансом 
    f(1) = 33*10^-6*cos(omega*t-1.88496)/deltaX;
    f(2) = diff(f(1),t);
    f(3) = diff(f(2),t);
    f(4) = 12*10^-6*cos(omega*t-3.29867)/deltaY;
    f(5) = diff(f(4),t);
    f(6) = diff(f(5),t);
    f(7) = 67*10^-6*cos(omega*t-1.51844)/deltaX;
    f(8) = 74*10^-6*cos(omega*t-3.12414)/deltaY;
end