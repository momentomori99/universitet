%%Data fra Table 4.2, p. 34 i Squires
T = [570.6, 555.9, 549.4, 544.1, 527.3, 522.2, 513.1, 497.6, 484.9];
R = [148.1, 202.6, 227.1, 255.1, 362.0, 406.1, 502.5, 750.1, 1026.7];

x = 1000./T;
y = log(R);

plot(T,R, 'o');

%Plot transformerte variabler
plot(x,y, 'o');

%Tilpass lineær regresjonsmodell
mdl = fitlm(x,y);
mdl

%Matlab gir følgende output. Vi skal bare se på noen av tallene.
% mdl = 
% 
% 
% Linear regression model:
%     y ~ 1 + x1
% 
% Estimated Coefficients:
%                        Estimate                 SE                  tStat                 pValue       
%                    _________________    __________________    _________________    ____________________
% 
%     (Intercept)    -5.91029715924012    0.0725401430205739    -81.4762269983923    1.10442144012536e-11
%     x1               6.2282792344512    0.0382603823045141      162.78664402463    8.71137976053882e-14
% 
% 
% Number of observations: 9, Error degrees of freedom: 7
% Root Mean Squared Error: 0.011
% R-squared: 1,  Adjusted R-Squared 1
% F-statistic vs. constant model: 2.65e+04, p-value = 8.71e-14

%Fra denne output'en kan vi lese av estimerte beta-koeffisienter og
%standardfeilene (se kompendiet for tolkning av standardfeil).
%Hvis man skal bruke disse tallene til noe i Matlab, er det bedre å
%aksessere informasjonen lagret i "mdl" direkte.

%"mdl" er en litt komplisert data-struktur, der man kan aksessere elementer
%ved å skrive "mdl.navn", der en liste over tilgjengelige "navn" kan finnes 
%ved å trykke "TAB" etter at man skriver punktum. Fra dette finner man f.eks. 
%at estimerte koeffisienter finnes i

mdl.Coefficients.Estimate %Gir samme tall som i output over.

%Plott modelltilpasningen med dataene
%Hent ut koeffisientene og plott modelltilpasningen manuelt
xData = x;
yData = y;
mdl = fitlm(xData,yData);
betahat = mdl.Coefficients.Estimate;
fplot(@(z) betahat(1) + betahat(2)*z, [min(xData), max(xData)]);
hold on
plot(xData,yData, 'o'); %Legg til datapunkter
hold off


%Finn konfidensintervaller for koeffisientene. Se kompendium for forklaring
%på hvordan disse lages (prosessen er helt tilsvarende for gjennomsnittet). 
%Vi lar Matlab gjøre utregningene (default dekningsgrad er 95%)
ci = mdl.coefCI

%NB: Disse er kun gyldige under visse antagelser, som skisseres i
%kompendiet. 

%Gir output:
% ci =
% 
%   -6.081827340640579  -5.738766977839663
%    6.137807806578736   6.318750662323667

%Altså, et 95% konfidensintervall for beta_0 er [-6.1,-5.7]
%og et 95% konfidensintervall for beta_1 er [6.1,6.3].