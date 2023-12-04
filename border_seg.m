function border()
global Z
I(1) = 2.546; I(2) = 0;
I(3) = 0; I(4) = 5.26;
I(5) = 2.23; I(6) = 0;
I(7) = 0; I(8) = 4.293;
E = 3.638; sigma = 1.667;

delta = I(6) - I(7);
beta = I(2) - I(3);
m = I(1) + I(4);
k = I(5) + I(8);
f = I(1)*I(4) - I(2)*I(3);
q = I(5)*I(8) - I(6)*I(7);
b = I(1)*I(8) - I(2)*I(7) - I(3)*I(6) + I(4)*I(5);

%alpha0 = q*sigma^4;
alpha1 = b*sigma^4 + 0.5*k*E*sigma^2;
%alpha2 = f*sigma^4 + 2*q*sigma^2 + 0.5*m*E*sigma^2 + E*2/4;
alpha3 = 2*b*sigma^2 + 0.5*k*E;
%alpha4 = 

Z_numerator(1) = -(E*delta/(2*sigma^2))+sqrt((E*delta/(2*sigma^2))^2-...
    -4*(b+(E*k/(2*sigma^2))*(alpha1/sigma^4-alpha3/sigma^2+b)));
%Z_numerator(2) = -(E*delta/(2*sigma^2))-sqrt((E*delta/(2*sigma^2))^2-...
%    -4*(b+(E*k/(2*sigma^2))*(alpha1/sigma^4-alpha3/sigma^2+b)));
Z_denominator = 2*(b+(E*k/(2*sigma^2)));
Z = Z_numerator(1)/Z_denominator;

