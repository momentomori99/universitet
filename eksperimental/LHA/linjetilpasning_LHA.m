% Generer et datasett (normalfordelte tilfeldige tall)
a=3.5; %Parameter for konstantledd i generert datasett
b=5.0; %Parameter for helning i generert datasett
x=0:0.1:1000;%2;
y=a+b.*x+randn(1,length(x));

figure(1)
plot(x,y,'r*')
hold on
%Tilpass lineær modell
mdl = fitlm(x,y);
%Tilpasningsparametre m og c i y=m*x+c:
c = mdl.Coefficients.Estimate(1);
m = mdl.Coefficients.Estimate(2);
plot(x, c + x*m);
xlabel('x')
ylabel('y')
legend('data',['linfit: ',num2str(c),'+',num2str(m),'x'],'Location','NorthWest')
hold off

%Errors in estimates
dc = mdl.Coefficients.SE(1);
dm = mdl.Coefficients.SE(2);

fprintf('slope     = %6.4f +- %5.4f\n',m,dm)
fprintf('intercept = %6.4f +- %5.4f\n',c,dc)
fprintf('R2        = %6.4f\n', mdl.Rsquared.Ordinary)
