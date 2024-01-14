function Moving_graph(typeEnum,T1,imbalanceBool,...
    forceXEnum,forceYEnum,powerX,powerY) 
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
    func = @(t, y) func_elliptic(t, y, Z,...
        forceXEnum,forceYEnum,powerX,powerY);
end
if typeEnum == 1 % Для сегментного подшипника 
    func = @(t, y) func_segment(t, y, Z,...
        forceXEnum,forceYEnum,powerX,powerY);
end
[t,h]=ode45(func,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
%Построить график
createGraph(h(:,1),h(:,7),h(:,4),h(:,8),t,'Время',typeEnum);
