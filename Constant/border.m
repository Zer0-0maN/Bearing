function Z = border(enumRotor)
%Получаем константы
    lamda = 0.55:0.0005:0.59;
    [I,E,deltaX,deltaY,sigma,typeEnum] = constant(enumRotor);
    alpha_zero = get_alpha(I,E,sigma,0);    
    Z_vec = zeros(1,numel(lamda));
    value = zeros(1,numel(lamda));
    delta = I(6) - I(7);
    k = I(5) + I(8);
    b = I(1)*I(8) - I(2)*I(7) - I(3)*I(6) + I(4)*I(5);
    %Определяем значения value
    for i = 1:numel(lamda)
        c = alpha_zero(2)*lamda(i).^4 - alpha_zero(4)*lamda(i).^2 + b;
        bb = 0;
        a = b + (E*k)/(2*sigma^2);
        if (c < 0)
            roots_of_equation = roots([a, bb, c]);
            Z_vec(i) = min(roots_of_equation(real(roots_of_equation) > 0 ...
            & imag(roots_of_equation) == 0));
            alpha = get_alpha(I,E,sigma,Z_vec(i));
            value(i) = alpha(1)*lamda(i)^6 - alpha(3)*lamda(i)^4 + ...
            + alpha(5)*lamda(i)^2 - alpha(7);
        else 
            value(i) = -1000;
        end
    end
    %Ищем значения a/c при которых value == 0
    [~, idx] = min(abs(value));
    Z = Z_vec(idx);
end
