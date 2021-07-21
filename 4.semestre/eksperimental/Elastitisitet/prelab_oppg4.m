data = importdata('maalinger_h.dat');
masse = data(:,1);
maaling = data(:,2);

%plot(masse,maaling,'o');

model = fitlm(masse, maaling);

%OPPGAVE 6
g = 9.81 %[m/s²]

A = -1.393*10^(-3) %[kg/m]
delta_A = 0.021*10^(-3) %[kg/m]

l = 1.213 %[m]
delta_l = 0.002 %[m]

d = 14.91 * 10^(-3) %[m]
delta_d = 0.03 * 10^(-3) %[m]

%E = (4*l^3 * g)/(3 * pi * abs(A)*d^4)

L = 1.530 
M = 2.500
E = 107000000000


f = sqrt((E*pi*d^2)/(16*M*L))

%OPPGAVE 8
[signal, sf] = audioread('messing_lyd.wav')


