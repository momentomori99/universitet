

d_plast = [20.23, 30.09, 40.03, 49.53]
v_plast = [285.71, 374, 425, 458]

d_stl = [0.99, 1.50, 2.00, 3.17, 3.99, 5.54, 5.99, 6.38, 7.00, 7.94, 9.00, 10.00]
v_stl = [41, 43.2, 72.3, 157, 207, 350, 379.8, 445, 440, 488, 615, 682]

d_stl_stor = [63.46, 38.01, 28.57, 26.98, 25.40, 19.00, 15.06, 10.00]
v_stl_stor = [3000, 2470, 2128, 1986, 1989, 1263, 1047, 727]

d_isopor = [5.2, 7.7, 21, 26, 37, 47, 56];
v_isopor = [1971, 1988,4000, 4000, 5217, 6000, 6000];

plot(log(d_isopor), log(v_isopor), 'r--o',log(d_isopor), f_isopor(log(d_isopor)),'r')
hold on
plot(log(d_plast), log(v_plast), 'b--o',log(d_plast), f_plast(log(d_plast)),'b')
plot(log(d_stl), log(v_stl), 'g--o',log(d_stl), f_stl(log(d_stl)),'g')
plot(log(d_stl_stor), log(v_stl_stor), 'm--o',log(d_stl_stor), f_stl_stor(log(d_stl_stor)),'m')


legend({'Målte V til isoporkule i luft, a = 0.52', 'Linær tilnærming','Målte V til plastkule i vann, a = 0.5','Linær tilnærming', 'Målte V til stålkule i olje, a = 1.3', 'Linær tilnærming', 'Målte V til stor stålkule i olje, a = 0.8', 'Linær tilnærming'}, 'Location','northwest')




title('log-plot med tilnærming')
xlabel('Diameter')
ylabel('Terminal Hastighet')
hold off
grid on





mdl = fitlm(log(d_plast), log(v_plast))
