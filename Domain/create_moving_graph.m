function create_moving_graph(enumRotor,T1,imbalanceBool,...
    forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT) %Название

% Задание констант 
[I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
%Определение границы устойчивости
Z = border(enumRotor) / 2;
%Задание начальных параметров
f_numeric = double(subs(startfunc(enumRotor,0,imbalanceBool),0));

if typeEnum == 0 % Для эллиптического подшипника 
    func = @(t, y) func_elliptic(t, y, Z,...
        forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT,imbalanceBool);
elseif typeEnum == 1 % Для сегментного подшипника 
    func = @(t, y) func_segment(t, y, Z,...
        forceXEnum,powerX,forceYEnum,powerY,tForce,deltaT,imbalanceBool);
end

%Решение уравнение
[t,h]=ode45(func,[0,T1],[f_numeric(1),f_numeric(2),f_numeric(3), ...
    f_numeric(4),f_numeric(5),f_numeric(6),f_numeric(7),f_numeric(8)]);
%Построить график
build_graph(h(:,1),h(:,7),h(:,4),h(:,8),t,'Время',typeEnum);
