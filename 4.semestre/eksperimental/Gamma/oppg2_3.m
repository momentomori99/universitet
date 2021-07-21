data = importdata('poisson.mat');
%Her er første kollone E_x og andre kolonne E_z
A = data;



%Finner midleverdien m:
N = length(A);
S = sum(A);

m = S/N

%Finner standardavviket s

s = std(A)


