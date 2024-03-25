function f = startfunc_segment(t,enum,deltaX,deltaY) %Для сегментных подшипников
syms t
omega = 1.667;
if enum == 0  % Для ротора без дисбаланса 
    f = zeros(1, 8);
end
if enum == 1 % Для ротора с дисбалансом 
    f(1) = 27*10^-6*cos(omega*t-2.14675)/deltaX;
    f(2) = diff(f(1),t);
    f(3) = diff(f(2),t);
    f(4) = 15*10^-6*cos(omega*t-3.75246)/deltaY;
    f(5) = diff(f(4),t);
    f(6) = diff(f(5),t);
    f(7) = 172*10^-6*cos(omega*t-1.53589)/deltaX;
    f(8) = 177*10^-6*cos(omega*t-3.12414)/deltaY;
end