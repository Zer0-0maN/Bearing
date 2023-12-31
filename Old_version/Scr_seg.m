clear all
global deltaX deltaY
% Задание констант 
deltaX=0.0002912; deltaY = 0.00005824;
I(1) = 2.546; I(2) = 0;
I(3) = 0; I(4) = 5.26;
I(5) = 2.23; I(6) = 0;
I(7) = 0; I(8) = 4.293;
E = 3.638; sigma = 1.667;
%Определение границы устойчивости
Z = border(I,E,sigma);
%Определение границы расчета
T1 = 0.008;
%Задание начальных параметров
zero = startFunc_segment(0);
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Решение уравнение
func = @(t, y) func_segment(t, y, Z);
[t,h]=ode45(func,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
%Свойство печати
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',12,'DefaultTextFontName','Times New Roman'); 
%График для оси Х
x = h(:,1);
xd = h(:,7);
tiledlayout(2,1)
graf1 = nexttile;
plot(graf1,t,x,'r-',t,xd,'b-')
title(graf1,'В плоскости Х')  
ylabel(graf1,'Перемещение')
xlabel(graf1,'Время')
legend(graf1,'Цапфа','Диск')
grid on;
%График для оси Y
y = h(:,4);
yd = h(:,8);
graf2 = nexttile;
plot(graf2,t,y,'r-',t,yd,'b-');
title(graf2,'В плоскости Y')  
ylabel(graf2,'Перемещение')
xlabel(graf2,'Время')
legend(graf2,'Цапфа','Диск')
grid on;
%Имя графика
set(gcf,'Name', 'Сегментный подшипник');
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);