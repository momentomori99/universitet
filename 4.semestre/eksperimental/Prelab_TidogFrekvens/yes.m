A = load('data1.mat');
data = A.data1;

mean(data)
std(data);
std(data)/sqrt(100);

k = 0
for i = 1:100
    if data(i) < (mean(data) - 2*std(data))
        k = k + 1
    end
    if data(i) > (mean(data) + 2*std(data))
        k = k + 1
    end
end
disp('Antall prosent:')
(k/100)*100
disp('prosnet for antall innenfor:')
100 - (k/100)*100