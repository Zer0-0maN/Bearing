function result = linear_force(t, T1, Power, deltaT)    
    T2 = T1 + deltaT;
    result = zeros(size(t));  % Инициализация массива результатов нулями
    
    % Вычисление силы для каждого момента времени
    for i = 1:numel(t)
        if t(i) < T1
            result(i) = 0;
        elseif t(i) >= T1 && t(i) <= T2
            result(i) = (Power / (T2 - T1)) * (t(i) - T1);
        else
            result(i) = Power;
        end
    end
end