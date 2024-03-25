function result = linear_force(t, force_info,time_info)    
    T1 = time_info.Tforce;
    T2 = T1 + time_info.deltaT;
    result = zeros(size(t));  % Инициализация массива результатов нулями
    
    
    % Вычисление силы для каждого момента времени
    for i = 1:numel(t)
        if t(i) < T1
            result(i) = 0;
        elseif t(i) >= T1 && t(i) <= T2
            result(i) = (force_info.power / (T2 - T1)) * (t(i) - T1);
        else
            result(i) = force_info.power;
        end
    end
end