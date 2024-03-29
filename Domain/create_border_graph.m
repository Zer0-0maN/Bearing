function create_border_graph(enumRotor,imbalanceBool,force_info_X,...
                force_info_Y,time_info) %Название

%Задание констант
[I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
%Определение шага границы устойчивости и числа точек
Zmax = border(enumRotor)*3/2;
n = 100; %число точек
z = Zmax/n;
%Задание начальных параметров
f_numeric = double(subs(startfunc(typeEnum,0,imbalanceBool),0));

x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Создание переменных
x_el = zeros(1,n);
y_el = zeros(1,n);
x_el_d = zeros(1,n);
y_el_d = zeros(1,n);
Z = zeros(1,n);
%Решение уравнение с шагом z
for i = 1:n
    %Решение уравнение
    if typeEnum == 0 % Для эллиптического подшипника 
        func = @(t, y) func_elliptic(t, y, z*(i-1), force_info_X,...
                force_info_Y,time_info,imbalanceBool);
    end
    if typeEnum == 1 % Для сегментного подшипника 
        func = @(t, y) func_segment(t, y, z*(i-1), force_info_X,...
                force_info_Y,time_info,imbalanceBool);
    end
    [t,h]=ode45(func,[0,time_info.Tmax],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
    Z(i) = z*(i-1);
    x_el(i) = max(abs(h(:, 1)));
    y_el(i) = max(abs(h(:, 4)));
    x_el_d(i) = max(abs(h(:, 7)));
    y_el_d(i) = max(abs(h(:, 8)));
end

%Построить график
build_graph(x_el,x_el_d,y_el,y_el_d,Z,'Значение a/c',typeEnum);
