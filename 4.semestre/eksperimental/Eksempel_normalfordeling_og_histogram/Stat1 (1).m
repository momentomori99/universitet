rng(2150); %For reproduserbarhet av (pseudo) tilfeldige tall.

%NB: dette scriptet antar at filen "performMeasurements.m" ligger
%i "current folder". Matlab vil helst ha funksjoner i egne filer, og i
%denne filen ligger det en funksjon vi skal tenke p� som � returnere
% resultatet av N m�linger fra et fysisk eksperiment.

%Vi tar f�rst 1 m�ling (som er generert fra pseudo-tilfeldige tall)
x = performMeasurements(1)

%M�lingen ble 9.6505. Merk at hvis vi kj�rer all koden over (inkludert
%f�rste linje!) f�r vi akkurat samme resultat. 
%Denne m�lingen sier oss lite, og vi kan ikke, uten detaljert informasjon
%om m�leinstrumentet, si f.eks om det er antagelig mye st�y i m�lingene.

%For � gj�re dette, trenger vi � vite fordelingen til m�lingene.
%Denne kan tiln�rmes med histogrammet til mange m�linger.
x = performMeasurements(50);
histogram(x)
xlabel('M�leverdier oppdelt i bins');
ylabel('Antall m�linger med verdi i bin-intervallet');

%Tar vi mange flere m�linger, vil Matlab redusere stolpe-bredden til
%histogrammene.
rng(2150);
x = performMeasurements(50000);
histogram(x)

%Hver stolpe gir en opptelling av antall observasjoner i hvert av de sm�
%intervallene. Vi er n� mer interessert i sannsynligheter, og lar i stedet
%h�yden av hver stolpe v�re slik at arealet til stolpen er andelen
%observasjoner i intervallet. For � f� Matlab til � gj�re dette skriver vi
%f�lgende kommando:
h = histogram(x); %lager "handle" h til histogramobjektet 
h.Normalization = 'pdf'; %setter property Normalisation til sannsynlighetstettheten
%Legg merke til at skalaen endret seg dramatisk.

%Dette histogrammet er en sv�rt god tiln�rming til m�lingens faktiske
%fordeling. Vi vil i praksis aldri ha s� mange m�linger, s� til en viss
%grad er fordelinger delvis teoretiske.

%Fordelingen til disse m�lingene er -n�yaktig- s�kalt normalfordelte 
%(performMeasurements() benytter normrnd().
%At m�linger er normalfordelt betyr at histogrammet av mange (uavhengige)
%m�linger g�r mot normalfordelingstettheten, gitt ved f�lgende funksjon.

hold on; %sier til matlab at vi skal legge noe til plottet
mu = 10;
sigma = 1;
fplot(@(z) exp(-0.5.*(z-mu).^2/(sigma.^2))/(sigma.*sqrt(2*pi)),[5 15],'b', 'Linewidth',5)
hold off
%Matcher godt.