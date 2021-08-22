%% Eksperiment 3: Ferromagnetisme-Hysterese
%%Punkt 4

% Spenningen i min.punktet D
U1 = -[0.07 0.10 0.15 0.21 0.27 0.31 0.37 0.43 0.48 0.53];
% Spenningen i max.punkt A
U2 = [0.09 0.12 0.17 0.24 0.29 0.33 0.39 0.45 0.50 0.55];

% Motstand i serie
R = 0.25; % [ohm]

% Finner str�mmen i min.punktet D
I1 = abs(U1)./R;
% Finner str�mmen i max.punktet A
I2 = abs(U2)./R;

% Finner str�mmen som middelverdien for ytterpunktene
I = (I1+I2)./2; % [A], (lig. 15)

% FINNER N�R FLUKSTETTHETEN MHP STR�MMEN I
% Spennigen i min. punktet D er
S1 = -[0.02 0.03 0.12 0.04 0.53 0.17 0.06 0.46 0.07 1.09];
% Spenningen i max.punktet A er
S2 = [0.05 0.08 0.12 0.44 0.10 0.60 0.86 0.54 1.01 0.04];

% Kalibreringsfaktor for instrumentet
k = 1.01 * 10^(-6); % weber, [Wb]

% Dempingsfaktoren, kontrollerer f�lsomhet og instilles p� integratoren
D = 10; % demp

n = 130; % vindinger p� sekund�rspolen

A = 6.5*10^(-3)

% % Finner Flukstettheten B
B = k.*D.*(S2-S1)./(2.*n.*A) % tesla [T] (lig. 14)

% Lager en figur som viser m�lepunktene for B(I):
plot(I,B,'ro',I,B,'b-',I,B,'g:')
xlabel('I [A]')
ylabel('B [T]')
title('M�lepunkter for flukstettheten B mhp str�m I')
figure
%% Kommentar
% At B-feltet er proporsjonalt med st�rmmen I er som forventet.


%% Punkt 5: Beregner magnetfeltet H0 og magnetiseringen M mhp H0

N = 344; % vindinger p� prim�rspolen
L = 315*10^(-3); % lengden til prim�rspolen [m]
H0 = (N.*I)./L % Magnetfeltet [ampere/meter] (lig. 
%H0_mean = mean(H0)

mu_0 = 4 * pi * 10^(-7); % naturkonstanten som relaterer B og H

M = (B./mu_0)-H0 % Magnetiseringen tesla [T] (lig. 2)
plot(H0,M)%,'ro',H0_mean,M,'b-',H0_mean,M,'g:')
xlabel('H [A/m]')
ylabel('M [T]')
title('M�lepunkter for magnetiseringen M mhp. magnetfeltet H0')

%% Kommentar
%Magnetfeltet H inne i en ferromagnetisk pr�ve dekomponeres i to bidrag.
%Det ene bidrag, H0, skyldes elektriske str�mmer utenfor material, og Hd
%motvirker ferromagnetens magnetisering M. Det betyr at magnetiseringen M
%mhp p� H b�r v�re negativt, fordi, som nevnt, motvirkes ferromagnetens
%magnetisering.