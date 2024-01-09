function graph = Moving_graph(enum,T1) %Название
global deltaX deltaY
deltaX=0.0002912; deltaY = 0.00005824;
sigma = 1.667;
% Задание констант 
[I,E] = Constant(enum);
%Определение границы устойчивости
Z = border(I,E,sigma);
%Задание начальных параметров
if enum == 0 % Для эллиптического подшипника 
    zero = startFunc_elliptic(0);
end
if enum == 1 % Для сегментного подшипника 
    zero = startFunc_segment(0);
end
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Решение уравнение
if enum == 0 % Для эллиптического подшипника 
    func = @(t, y) func_elliptic(t, y, Z);
end
if enum == 1 % Для сегментного подшипника 
    func = @(t, y) func_segment(t, y, Z);
end
[t,h]=ode45(func,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
T = t./314;
%Свойство печати
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',12,'DefaultTextFontName','Times New Roman'); 
%График для оси Х
x = h(:,1);
xd = h(:,7);
tiledlayout(2,1)
graf1 = nexttile;
plot(graf1,T,x,'r-',T,xd,'b-')
title(graf1,'В плоскости Х')  
ylabel(graf1,'Перемещение')
xlabel(graf1,'Время')
legend(graf1,'Цапфа','Диск')
grid on;
%График для оси Y
y = h(:,4);
yd = h(:,8);
graf2 = nexttile;
plot(graf2,T,y,'r-',T,yd,'b-');
title(graf2,'В плоскости Y')  
ylabel(graf2,'Перемещение')
xlabel(graf2,'Время')
legend(graf2,'Цапфа','Диск')
grid on;
%Имя графика
if enum == 0 % Для эллиптического подшипника 
    set(gcf,'Name', 'Эллиптический подшипник');
end
if enum == 1 % Для сегментного подшипника 
    set(gcf,'Name', 'Сегментный подшипник');
end
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);