clear all
global deltaX deltaY
% Задание констант
deltaX=0.0002912; deltaY = 0.00005824;
I(1) = 2.546; I(2) = 0;
I(3) = 0; I(4) = 5.26;
I(5) = 2.23; I(6) = 0;
I(7) = 0; I(8) = 4.293;
E = 3.638; sigma = 1.667;
%Определение шага границы устойчивости и числа точек
z = 0.001;
k = 1000; 
%Определение границы расчета
T1 = 0.325;
T2 = 3*T1/4;
%Задание начальных параметров
zero = startFunc_segment(0);
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
    f = @(t, y) func_segment(t, y, z*(i-1));
    [t,h]=ode45(f,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
    [t2,h2]=ode45(f,[0,T2],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
    Z(i) = z*(i-1);
    x_el(i) = max(abs(h(:, 1)))/10000;
    y_el(i) = max(abs(h2(:, 4)))/1000;
    x_el_d(i) = max(abs(h(:, 7)))/10000;
    y_el_d(i) = max(abs(h2(:, 8)))/1000;
end
%Свойство печати
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',12,'DefaultTextFontName','Times New Roman'); 
%График для оси Х
tiledlayout(2,1)
graf1 = nexttile;
plot(graf1,Z,x_el,'r-',Z,x_el_d,'b-')
title(graf1,'В плоскости Х')  
ylabel(graf1,'Перемещение')
xlabel(graf1,'Значение a/c')
legend(graf1,'Цапфа','Диск')
grid on;
%График для оси Y
graf2 = nexttile;
plot(graf2,Z,y_el,'r-',Z,y_el_d,'b-')
title(graf2,'В плоскости Y')  
ylabel(graf2,'Перемещение')
xlabel(graf2,'Значение a/c')
legend(graf2,'Цапфа','Диск')
grid on;
%Имя графика
set(gcf,'Name', 'Сегментный подшипник');
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);

