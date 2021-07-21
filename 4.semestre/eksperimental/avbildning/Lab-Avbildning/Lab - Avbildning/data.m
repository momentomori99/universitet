D = [251 251 254.9888 255 255 210.5356 118.5789 99.6110 78.7223 57.5322 55.1647 37.2003 28.4971 9.0018];
var = [0 0 0.0190 0 0 6.2874 3.0809 2.6330 2.1064 1.4725 1.5174 1.0390 0.9176 0.0073];

varD = 1/2*var;
stdD = sqrt(D);

subplot(2,1,1)
plot(D(6:end),varD(6:end))
xlabel('D')
ylabel('Var(D)')

subplot(2,1,2)
plot(D(6:end),stdD(6:end),'r')
xlabel('D')
ylabel('SNR')


