A = importdata('terminal_hastighet_rdata.dat');
radius = A(:,1);
v_1 = A(:,2);
v_2 = A(:,3);
v_3 = A(:,4);

plot(log(radius*2), log(v_1),'g--o',log(radius*2), log(v_2),'b--o', log(radius*2), log(v_3),'r--o')
legend({'v_1','v_2','v_3'},'Location','northwest')

mdl = fitlm(log(radius*2), log(v_1));
mdl = fitlm(log(radius*2), log(v_2));
mdl = fitlm(log(radius*2), log(v_3));

p_k = 7905
p_m = 886
g = 9.81
my = 0.190
p = 886

for i = 1:9
    c(i) = (((p_k/p_m)-1)*pi*g*p)/(3*my*(v_1(i)-(radius(i)*2)^2))
end

