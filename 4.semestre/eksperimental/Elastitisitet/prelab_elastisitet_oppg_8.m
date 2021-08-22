%Les av lydfilen og finn lengden
[signal,sf]=audioread('messing_lyd.wav');
signal=0.5*transpose(signal); %Halverer amplituden på signalet for å unngå at totalsignalet overstiger amplitude=1
t=0:1/sf:10;

%Velg frekvens og generer nytt signal
f = {'Frekvens (i Hz):',};
f = inputdlg(f);
f = str2double(f);
fprintf('Frekvens = %d Hz', f(1))
omega_t=2*pi*f*t;
mittsignal=0.5*sin(omega_t);

%Summerer signalet fra lydfilen og det genererte signalet
signalsum=signal+mittsignal;

%Spill av svevefrekvensen og plott signalsummen
%sound(signalsum)
plot(t,signalsum)

