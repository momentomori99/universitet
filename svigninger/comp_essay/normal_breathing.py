import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile

samplerate, data = wavfile.read('normal_breathing.wav')
x_n_full = data[:,0] #Siden dette er en stereo fil, velger man en av de kanalene
N_full = data.shape[0] #finner ut antall samples
f_s = samplerate #samplefrekvens [Hz]
T_full = N_full/f_s #Sampletiden
dt = 1/f_s

t_full = np.linspace(0,T_full,N_full)


t = t_full[0:-1] #Slicer opp t slik at vi kan fokuserer bare på det ene coo-coo
x_n = x_n_full[0:-1] #Slicer den også.
N = t.shape[0]
T = N/f_s

def wavelet(f_a, K, t_k, t_n):
    C = 0.798*2*np.pi*f_a/(f_s*K)
    eksp1 = -1j*2*np.pi*f_a*(t_n - t_k)
    eksp2 = -K**2
    eksp3 = (-2*np.pi*f_a**2)*((t_n - t_k)**2)/(2*K)**2
    return C*(np.exp(eksp1) - np.exp(eksp2))*np.exp(eksp3)

def gamma(f_a, K, t_k):
    sum = 0
    for i in range(N):
        sum = sum + np.conj(x_n[i]*(wavelet(f_a, K, t_k, t[i])))
    return sum


K = 5

t_ = np.linspace(0,10,70)
f_ = np.linspace(30,300,30)
T,F = np.meshgrid(t_,f_)
Z = abs(gamma(F,K,T))
plt.contourf(T,F,Z)
plt.grid(True)
plt.colorbar()
plt.xlabel("tid [s]")
plt.ylabel("Frekvens [Hz]")
plt.title("2D plot av wavelettransform")
plt.show()
