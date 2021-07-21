k = [2 4 7 1 0 3 5 4 3 4 7 7 5 5 5 2 5 6 7 0 2 1 2 4 4 3 4 1 1 8 6 1 1 4 5 3 1 1 9 1 2 5 2 4 4 4 5 6 1 7 4 3 6 2 3 2 4 2 7 2 2 3 4 2 5 1 4 0 2 4 5 4 1 3 6 0 5 3 5 3 3 4 3 1 4 5 1 5 4 2 2 2 3 8 2 3 1 3 4 2 3 10]

n = length(k)

h = histogram(k)
xlabel('k [1/s]')
ylabel('Antall målinger med resultat')

k_mean = mean(k)
k_std = std(k)
k_approxstd = sqrt(k_mean)

y = zeros(1,10);
y(1) = n*exp(-k_mean);

for i=2:10
    y(i) = (k_mean/(i-1))*y(i-1);
    
end

hold on
x = linspace(min(k),max(k),10)
plot(x,y)

legend('Histogram','Poisson fordeling')