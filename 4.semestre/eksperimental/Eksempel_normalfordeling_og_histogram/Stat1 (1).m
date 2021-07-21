rng(2150); %For reproduserbarhet av (pseudo) tilfeldige tall.

%NB: dette scriptet antar at filen "performMeasurements.m" ligger
%i "current folder". Matlab vil helst ha funksjoner i egne filer, og i
%denne filen ligger det en funksjon vi skal tenke på som å returnere
% resultatet av N målinger fra et fysisk eksperiment.

%Vi tar først 1 måling (som er generert fra pseudo-tilfeldige tall)
x = performMeasurements(1)

%Målingen ble 9.6505. Merk at hvis vi kjører all koden over (inkludert
%første linje!) får vi akkurat samme resultat. 
%Denne målingen sier oss lite, og vi kan ikke, uten detaljert informasjon
%om måleinstrumentet, si f.eks om det er antagelig mye støy i målingene.

%For å gjøre dette, trenger vi å vite fordelingen til målingene.
%Denne kan tilnærmes med histogrammet til mange målinger.
x = performMeasurements(50);
histogram(x)
xlabel('Måleverdier oppdelt i bins');
ylabel('Antall målinger med verdi i bin-intervallet');

%Tar vi mange flere målinger, vil Matlab redusere stolpe-bredden til
%histogrammene.
rng(2150);
x = performMeasurements(50000);
histogram(x)

%Hver stolpe gir en opptelling av antall observasjoner i hvert av de små
%intervallene. Vi er nå mer interessert i sannsynligheter, og lar i stedet
%høyden av hver stolpe være slik at arealet til stolpen er andelen
%observasjoner i intervallet. For å få Matlab til å gjøre dette skriver vi
%følgende kommando:
h = histogram(x); %lager "handle" h til histogramobjektet 
h.Normalization = 'pdf'; %setter property Normalisation til sannsynlighetstettheten
%Legg merke til at skalaen endret seg dramatisk.

%Dette histogrammet er en svært god tilnærming til målingens faktiske
%fordeling. Vi vil i praksis aldri ha så mange målinger, så til en viss
%grad er fordelinger delvis teoretiske.

%Fordelingen til disse målingene er -nøyaktig- såkalt normalfordelte 
%(performMeasurements() benytter normrnd().
%At målinger er normalfordelt betyr at histogrammet av mange (uavhengige)
%målinger går mot normalfordelingstettheten, gitt ved følgende funksjon.

hold on; %sier til matlab at vi skal legge noe til plottet
mu = 10;
sigma = 1;
fplot(@(z) exp(-0.5.*(z-mu).^2/(sigma.^2))/(sigma.*sqrt(2*pi)),[5 15],'b', 'Linewidth',5)
hold off
%Matcher godt.