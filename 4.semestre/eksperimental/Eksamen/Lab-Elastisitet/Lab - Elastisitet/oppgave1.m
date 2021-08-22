m = [0 0.5 1.0 1.5 2.0 2.5 3.0 3.5];
h = [0 7.2 14.5 21.8 29 36 43.1 50.6]*1e-4;

BC = [133.4 133.8 133.2 133.4];

d = [15.99,16.00,16.00,15.99,15.98];
dmean = mean(d);
d_se = std(d)/sqrt(5);
d_error = (d_se^2 + 0.02^2);

plot(m,h,'o')

%lineær tilpasning h(m) = Am + B

linreg = fitlm(m,h)

A = linreg.Coefficients.Estimate(2);
dA = linreg.Coefficients.SE(2);
B = linreg.Coefficients.Estimate(1);
dB = linreg.Coefficients.SE(1);

hold on
plot(m, A*m + B)
xlabel('m [kg]')
ylabel('h(m)[mm]')
title('Målepunkter vs. Lineærtilpasning for h(m)')
legend('Målepunkter','Lineærtilpasning')
grid on

l = 1.3345;
dl =0.34e-2;
g = 9.81;

d = dmean*1e-3;


E = (4*(l^3)*g)/(3*pi*abs(A)*(d^4))


DA = (-4*l^3*g*dA)/(3*pi*d^4*A^2);
DL = (4*l^2*g*dl)/(pi*A*d^4);
DD = (-16*l^3*g*d_error)/(3*pi*A*d^5);
E_error = sqrt(DA^2 + (DL)^2 + (DD)^2);

E_e = E*sqrt( (1*dA/A)^2 + (3*dl/l)^2 + (-4*d_error*1e-3/d)^2)

