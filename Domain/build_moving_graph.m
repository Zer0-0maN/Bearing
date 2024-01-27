function build_moving_graph(enumRotor,T1,imbalanceBool,...
    forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT) %Название

% Задание констант 
[I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
%Определение границы устойчивости
Z = border(I,E,sigma) / 2;
%Задание начальных параметров
if typeEnum == 0 % Для эллиптического подшипника 
    zero = startfunc_elliptic(0,imbalanceBool,deltaX,deltaY);
    func = @(t, y) func_elliptic(t, y, Z,...
        forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT);
end
if typeEnum == 1 % Для сегментного подшипника 
    zero = startfunc_segment(0,imbalanceBool,deltaX,deltaY);
    func = @(t, y) func_segment(t, y, Z,...
        forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT);
end
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Решение уравнение
[t,h]=ode45(func,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
%Построить график
create_graph(h(:,1),h(:,7),h(:,4),h(:,8),t,'Время',typeEnum);
