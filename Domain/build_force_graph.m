function build_force_graph (force_info,time_info)   
% Создание массива времени
t = 0:0.1:time_info.Tmax;

% Вычисление силы для каждого момента времени
result = change_force(t,force_info,time_info);

% Построение графика
figure;
plot(t, result, 'LineWidth', 2);
xlabel('Время (τ)');
ylabel('Сила');
title('Зависимость возмущающей силы от времени');
hold on;
xline(time_info.Tforce, '--b', 'Label', 'τн', 'LabelHorizontalAlignment', 'left');
xline(time_info.Tforce + time_info.deltaT, '--b', 'Label', 'τн + δτ', ...
        'LabelHorizontalAlignment', 'right');
yline(force_info.power, '--b', 'Label', 'kQ');
grid on;