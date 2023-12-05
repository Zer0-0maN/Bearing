clear all
global deltaX deltaY
% % Задание констант для func 1
% deltaX=0.0002912; deltaY = 0.00005824;
% I(1) = 7.626; I(2) = -24.562;
% I(3) = 10; I(4) = 60.588;
% I(5) = 10.488; I(6) = 1.323;
% I(7) = 1.284; I(8) = 73.156;
% E = 59.69; sigma = 1.667;
% Задание констант для func 2
deltaX=0.0002912; deltaY = 0.00005824;
I(1) = 2.546; I(2) = 0;
I(3) = 0; I(4) = 5.26;
I(5) = 2.23; I(6) = 0;
I(7) = 0; I(8) = 4.293;
E = 3.638; sigma = 1.667;
%Определение шага границы устойчивости и числа точек
z = 0.01;
k = 1000; 
%Определение границы расчета
T1 = 2/50;
%Задание начальных параметров
zero = startFunc2(0);
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Создание переменных
x_el = zeros(1,k);
y_el = zeros(1,k);
% x_el_d = zeros(1,k);
% y_el_d = zeros(1,k);
Z = zeros(1,k);
%Решение уравнение с шагом z
for i = 1:k
f = @(t, y) func2(t, y, z*(i-1));
[t,h]=ode45(f,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
Z(i) = z*(i-1);
x_el(i) = h(end,1);
y_el(i) = h(end,4);
% x_el_d(i) = h(end,7);
% y_el_d(i) = h(end,8);
end
%Построение графиков
figure;
hold on;
grid on;
plot(Z,x_el,'r-');
plot(Z,y_el,'b-');
% plot(Z,x_el_d,'g-');
% plot(Z,y_el_d,'k-');
hold off;




% test0 = h0(:,1);
% f1 = @(t, y) func1(t, y, 0.04);
% [t1,h1]=ode45(f1,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
% test1 = h1(:,1);
% f2 = @(t, y) func1(t, y, 0.08);
% [t2,h2]=ode45(f2,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
% test2 = h2(:,1);
% f3 = @(t, y) func1(t, y, 0.1);
% [t3,h3]=ode45(f3,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
% test3 = h3(:,1);
% figure;
% hold on;
% grid on;
% plot(t0,test0,'r-');
% plot(t1,test1,'b-');
% plot(t2,test2,'g-');
% plot(t3,test3,'k-');
% hold off;

