
typeEnum = 1; %0 для эллиптического подшипника; 1 для сегментного;
imbalanceBool = 1; %0 без дисбаланса; 1 с дисбалансом ротора;

forceEnum = 1; %линейное; 

Power = 8.35/10;
Timpulse = 31.416;
deltaT = 4.7124;
Tmax = 157.08;
sigma = 1.664;

% Задание констант 
[I,E,deltaX,deltaY] = constant(typeEnum);
%Определение границы устойчивости
Zborder = border(I,E,sigma);
%Задание начальных параметров
zero = startfunc_segment(0,imbalanceBool,deltaX,deltaY);
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Решение уравнение
func = @(t, y) func_segment(t, y, Zborder/2,...
        forceEnum,Power,forceEnum,Power,Timpulse,deltaT);

[t,h]=ode45(func,[0,Tmax],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
%Построить график
%createGraph(h(:,1),h(:,7),h(:,4),h(:,8),t,'Время',typeEnum);

deltaTime = 0.359;
number = 425;
curcle = 32;

%Определение шага границы устойчивости и числа точек
z = 0.005;
k = fix(Zborder/z); 
%Задание начальных параметров
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Создание переменных
x_el = zeros(1,k);
y_el = zeros(1,k);
x_el_d = zeros(1,k);
y_el_d = zeros(1,k);
x = zeros(1,k);
y = zeros(1,k);
xd = zeros(1,k);
yd = zeros(1,k);
Z = zeros(1,k);
%Решение уравнение с шагом z
for i = 1:k
    func = @(t, y) func_segment(t, y, z*(i-1), forceEnum,Power,...
            forceEnum,Power,Timpulse,deltaT);

    [t,h]=ode45(func,[0,Tmax],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
    Z(i) = z*(i-1)/Zborder;
    x_el_max(i) = max(abs(h(:, 1)));
    x_el_first(i) = abs(h(16, 1));
    x(i) = log(x_el_max(i)/x_el_first(i))/16;
    y_el_max(i) = max(abs(h(:, 4)));
    y_el_first(i) = abs(h(16, 4));
    y(i) = log(y_el_max(i)/y_el_first(i))/16;
    x_el_max_d(i) = max(abs(h(:, 7)));
    x_el_first_d(i) = abs(h(16, 7));
    xd(i) = log(x_el_max_d(i)/x_el_first_d(i))/16;
    y_el_max_d(i) = max(abs(h(:, 8)));
    y_el_first_d(i) = abs(h(16, 8));
    yd(i) = log(y_el_max_d(i)/y_el_first_d(i))/16;
end

%Свойство печати
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');    
tiledlayout(2,1)
%График для оси X
graf1 = nexttile;
plot(graf1,Z,x,'r-',Z,xd,'b-')
title(graf1,'В плоскости Х')  
ylabel(graf1,{'Логарифмический декремент','затухающих колебаний'})
xlabel(graf1,'Степень удаленности от границы устойчивости α')
legend(graf1,'Цапфа','Диск')
grid on;
%График для оси Y
graf2 = nexttile;
plot(graf2,Z,y,'r-',Z,yd,'b-');
title(graf2,'В плоскости Y')  
ylabel(graf2,{'Логарифмический декремент','затухающих колебаний'})
xlabel(graf2,'Степень удаленности от границы устойчивости α')
legend(graf2,'Цапфа','Диск')
grid on;
%Имя графика
set(gcf,'Name', 'Сегментный подшипник');
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);

