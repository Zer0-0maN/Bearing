function f = startfunc_segment(t,enum,deltaX,deltaY) %Для сегментных подшипников
syms t
if enum == 0  % Для ротора без дисбаланса 
    f = zeros(1, 8);
end
if enum == 1 % Для ротора с дисбалансом 
    %omega = 314;
    omega = 1.667;
    f(1) = 27*10^-6*cos(omega*t-2.14675)/deltaX;
    f(2) = diff(f(1));
    f(3) = diff(f(2));
    f(4) = 15*10^-6*cos(omega*t-3.75246)/deltaY;
    f(5) = diff(f(4));
    f(6) = diff(f(5));
    f(7) = 172*10^-6*cos(omega*t-1.53589)/deltaX;
    f(8) = 177*10^-6*cos(omega*t-3.12414)/deltaY;
end