function alpha = get_alpha(I,E,sigma,Z)

alpha = zeros(1, 6);

delta = I(6) - I(7);
beta = I(2) - I(3);
m = I(1) + I(4);
k = I(5) + I(8);
f = I(1)*I(4) - I(2)*I(3);
q = I(5)*I(8) - I(6)*I(7);
b = I(1)*I(8) - I(2)*I(7) - I(3)*I(6) + I(4)*I(5);

alpha(1) = q*sigma^4;
alpha(2) = b*sigma^4 + 0.5*k*E*sigma^2;
alpha(3) = f*sigma^4 + 2*q*sigma^2 + 0.5*m*E*sigma^2 + E^2/4;
alpha(4) = 2*b*sigma^2 + 0.5*k*E;
alpha(5) = 2*f*sigma^2 + 0.5*m*E + q*(1 + Z^2);
alpha(6) = b*(1 + Z^2) + k*E*(Z^2)/(2*sigma^2) + Z*E*delta/(2*sigma^2);
alpha(7) = f*(1 + Z^2) + E*m*(Z^2)/(2*sigma^2) +...
    (E^2)*(Z^2)/(4*sigma^2) + Z*E*beta/(2*sigma);
end

