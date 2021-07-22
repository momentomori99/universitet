L = [144.1 144.5 144.4 144.3];
Lavg = mean(L);
L_Se = std(L)/sqrt(4);
L_error = sqrt(L_Se^2 + ((0.14/200)*Lavg)^2 + (7*0.05)^2)

d = [15.99,16.00,16.00,15.99,15.98];
davg = mean(d);
d_Se = std(d)/sqrt(5);
d_error = (d_Se^2 + 0.02^2) %alle målingene er tatt uten sqrt (wops)

E = 104.96e9
L = Lavg*1e-2
d = davg*1e-3

dE = 0.1
dL =L_error*1e-2
dd = d_error*1e-3

M = 2.482

f = sqrt( (pi*E*d^2)/(16*M*L) )

df = f_m*sqrt( (0.5*dE/E)^2 + (dL/L)^2  + (-0.5*dd/d)^2 )

f_m = 1212.98

E1 = (16*M*L*f_m^2)/(pi*d^2)

E1_error = E1*sqrt( (dL/L)^2 + (-2*dd/d)^2 + (2*0.02/f)^2)


f_fft = 1213.6
E2 = (16*M*L*f_fft^2)/(pi*d^2)

df_fft = 0.1

E2_error = E2*sqrt( (dL/L)^2 + (-2*dd/d)^2 + (2*0.1/f)^2)

D = abs(E1 - E2)

dD = sqrt(E1_error^2 + E2_error^2)

