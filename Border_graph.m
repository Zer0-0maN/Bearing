function Border_graph(typeEnum,T1,imbalanceBool,forceXEnum,powerX,...
                forceYEnum,powerY) %Название
global deltaX deltaY
deltaX=0.0002912; deltaY = 0.00005824;
%Определение шага границы устойчивости и числа точек
z = 0.01;
k = 40; 
%Задание начальных параметров
if typeEnum == 0 % Для эллиптического подшипника 
    zero = startFunc_elliptic(0,imbalanceBool);
end
if typeEnum == 1 % Для сегментного подшипника 
    zero = startFunc_segment(0,imbalanceBool);
end
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Создание переменных
x_el = zeros(1,k);
y_el = zeros(1,k);
x_el_d = zeros(1,k);
y_el_d = zeros(1,k);
Z = zeros(1,k);
%Решение уравнение с шагом z
for i = 1:k
    %Решение уравнение
    if typeEnum == 0 % Для эллиптического подшипника 
        func = @(t, y) func_elliptic(t, y, z*(i-1), forceXEnum,powerX,...
                forceYEnum,powerY);
    end
    if typeEnum == 1 % Для сегментного подшипника 
        func = @(t, y) func_segment(t, y, z*(i-1), forceXEnum,powerX,...
                forceYEnum,powerY);
    end
    [t,h]=ode45(func,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
    Z(i) = z*(i-1);
    x_el(i) = max(abs(h(:, 1)));
    y_el(i) = max(abs(h(:, 4)));
    x_el_d(i) = max(abs(h(:, 7)));
    y_el_d(i) = max(abs(h(:, 8)));
end

%Построить график
createGraph(x_el,x_el_d,y_el,y_el_d,Z,'Значение a/c',typeEnum);
