function f = func1(t,x,Z) %Название
f = [x(2);x(3);
    -0.106*x(3)-1.018*x(6)+0.052*x(2)-0.36*x(5)+0.051*Z*x(5)+...
    +0.097*Z*x(1)-0.045*x(1)-0.313*x(4)-0.078*Z*x(4)-0.001*cos(t)+...
    +0.008*sin(t);    
    x(5);x(6);
    -1.737*x(3)+2.47*x(6)-0.36*x(2)-0.051*Z*x(2)-2.521*Z*x(5)-...
    -0.256*x(1)-0.355*Z*x(1)+0.882*x(4)-2.436*Z*x(4)-0.057*cos(t)+...
    +0.001*sin(t);
    1.71*x(1)-2.286*x(4)+0.977*x(2)+0.123*x(5);
    0.931*x(1)+6.638*x(4)+0.119*x(2)+6.811*x(5)];