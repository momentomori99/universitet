k = 1000
dt = [23.45 35.93 55.81 76.08 105.48 133.83 ]
z = [0 3.6 8.68 11.69 14.76 17.81]*1e-3

nb = 152/(10*60)

n = k./dt -nb


linreg = fitlm(z,log(n))

% plot(z, log(n),'ko')
% hold on
% plot(z, -99.147*z + 3.7161,'r--')
% xlabel('z [m]')
% ylabel('Tellerate n [1/s]')
% legend('Målepunkter','Lineær tilnærming')


my = 99.147

z = log(0.1)/-my
z2 = log(0.01)/-my


