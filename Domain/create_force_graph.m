function create_force_graph (enumForce, Timpulse, Power, deltaT, Tmax)   
% Создание массива времени
t = 0:0.1:Tmax;

% Вычисление силы для каждого момента времени
    if enumForce == 0
        result = zeros(size(t));
    elseif enumForce == 1
        result = linear_force(t,Timpulse,Power,deltaT);
    elseif enumForce == 2
        result = impulse_force(t,Timpulse,Power,deltaT);
    end

% Построение графика
figure;
plot(t, result, 'LineWidth', 2);
xlabel('Время (τ)');
ylabel('Сила');
title('Зависимость возмущающей силы от времени');
hold on;
xline(Timpulse, '--b', 'Label', 'τн', 'LabelHorizontalAlignment', 'left');
xline(Timpulse + deltaT, '--b', 'Label', 'τн + δτ', ...
        'LabelHorizontalAlignment', 'right');
yline(Power, '--b', 'Label', 'kQ');
grid on;