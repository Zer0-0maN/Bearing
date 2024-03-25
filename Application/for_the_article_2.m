lamda = 0.55:0.001:0.59;
[I,E,deltaX,deltaY,sigma,typeEnum] = constant(1);
alpha_zero = get_alpha(I,E,sigma,0);

Z = zeros(1,numel(lamda));
value = zeros(1,numel(lamda));
delta = I(6) - I(7);
k = I(5) + I(8);
b = I(1)*I(8) - I(2)*I(7) - I(3)*I(6) + I(4)*I(5);

for i = 1:numel(lamda)
    c = alpha_zero(2)*lamda(i).^4 - alpha_zero(4)*lamda(i).^2 + b;
    bb = 0;
    a = b + (E*k)/(2*sigma^2);
    if (c < 0)
        roots_of_equation = roots([a, bb, c]);
        Z(i) = min(roots_of_equation(real(roots_of_equation) > 0 ...
        & imag(roots_of_equation) == 0));
        alpha = get_alpha(I,E,sigma,Z(i));
        value(i) = alpha(1)*lamda(i)^6 - alpha(3)*lamda(i)^4 + ...
        + alpha(5)*lamda(i)^2 - alpha(7);
    else 
        value(i) = -1000;
    end
end

ans = 0.56;

% Построение графика
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');    
tiledlayout(2,1)
%График 1
graf1 = nexttile;
plot(graf1,lamda,Z)
title(graf1,'График зависимости a/c от lamda')  
ylabel(graf1,'a/c')
xlabel(graf1,'lamda')
xline(ans, '--b', 'Label', 'value ≈ 0', ...
        'LabelHorizontalAlignment', 'right');
grid on;
%График 2
graf2 = nexttile;
plot(graf2,lamda,value);
title(graf2,'График зависимости value от lamda')  
ylabel(graf2,'value')
xlabel(graf2,'lamda')
xline(ans, '--b', 'Label', 'value ≈ 0', ...
        'LabelHorizontalAlignment', 'right');
grid on;
set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);
