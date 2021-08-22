
rng(2150)
x = performMeasurements(9999);
h = histogram(x);
xlabel('Måleverdier oppdelt i bins')
ylabel('Antall målinger med verdi i bin-intervallet')

h.Normalization = 'pdf'

hold on;
mu = 10;
sigma = 1;
fplot(@(z) exp(-0.5.*(z-mu).^2/(sigma.^2))/(sigma.*sqrt(2*pi)),[5 15],'b', 'Linewidth',5)
hold off;