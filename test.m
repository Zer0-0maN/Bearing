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

%Определение границы расчета
T1 = 0.00628;
%Задание начальных параметров
zero = startFunc2(0);
f_numeric = double(subs(zero,0));
x0 = f_numeric(1); dtx0 = f_numeric(2); dt2x0 = f_numeric(3);
y0 = f_numeric(4); dty0 = f_numeric(5); dt2y0 = f_numeric(6);
xd0 = f_numeric(7); yd0 = f_numeric(8);
%Решение уравнение
func0 = @(t, y) func1(t, y, 0);
[t0,h0]=ode45(func0,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
test0 = h0(:,1);
func1 = @(t, y) func1(t, y, 10);
[t1,h1]=ode45(func1,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
test1 = h1(:,1);
func2 = @(t, y) func1(t, y, 20);
[t2,h2]=ode45(func2,[0,T1],[x0,dtx0,dt2x0,y0,dty0,dt2y0,xd0,yd0]);
test2 = h2(:,1);
figure;
hold on;
grid on;
plot(t0,test0,'r-');
plot(t1,test1,'b-');
plot(t2,test2,'g-');
hold off;

