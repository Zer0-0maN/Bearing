function graph = Moving_graph(typeEnum,T1,imbalanceBool,impulseBool) %Название
% [Test_block]
% typeEnum = 0; %0 для эллиптического подшипника; 1 для сегментного;
% T1 = 300;
% imbalanceBool = 0; %0 без дисбаланса; 1 с дисбалансом ротора;
% impulseBool = 0; %0 нет возумещения; 1 есть возумещение;
global deltaX deltaY
deltaX=0.0002912; deltaY = 0.00005824;
sigma = 314;
% Задание констант 
[I,E] = Constant(typeEnum);
%Определение границы устойчивости
Z = border(I,E,sigma) / 2;
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
%Решение уравнение
if typeEnum == 0 % Для эллиптического подшипника 
    func = @(t, y) func_elliptic(t, y, Z, impulseBool,impulseBool);
end
if typeEnum == 1 % Для сегментного подшипника 
    func = @(t, y) func_segment(t, y, Z, impulseBool,impulseBool);
end
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
if typeEnum == 0 % Для эллиптического подшипника 
    set(gcf,'Name', 'Эллиптический подшипник');
end
if typeEnum == 1 % Для сегментного подшипника 
    set(gcf,'Name', 'Сегментный подшипник');
end
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);