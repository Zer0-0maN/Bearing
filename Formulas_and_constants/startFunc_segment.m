function f = startFunc_segment(enum) %Для сегментных подшипников
global deltaX deltaY
if enum == 0 % без дисбаланса
    f(1) = 0;
    f(2) = 0;
    f(3) = 0;
    f(4) = 0;
    f(5) = 0;
    f(6) = 0;
    f(7) = 0;
    f(8) = 0;
end
if enum == 1 % Для ротора с дисбалансом 
    t = 0;
    omega = 314;
    % omega = 1;
    f(1) = 27*10^-6*cos(omega*t-2.14675)/deltaX;
    f(2) = diff(f(1));
    f(3) = diff(f(2));
    f(4) = 15*10^-6*cos(omega*t-3.75246)/deltaY;
    f(5) = diff(f(4));
    f(6) = diff(f(5));
    f(7) = 172*10^-6*cos(omega*t-1.53589)/deltaX;
    f(8) = 177*10^-6*cos(omega*t-3.12414)/deltaY;
end