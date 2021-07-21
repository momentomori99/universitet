import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile

samplerate, data = wavfile.read('voice2.wav')
x_n = data[:]
N = data.shape[0]
f_samp = samplerate
T = N/f_samp
dt = 1/f_samp

t = np.linspace(0,T,N)

#plt.plot(t, x_n)
#plt.show()

X_k = np.fft.fft(x_n)
PSD = np.abs(X_k)
freq = np.fft.fftfreq(N,dt)
plt.plot(freq, PSD)
plt.show()

min = 5000
indices = PSD > min
PSDclean = PSD * indices
X_k = indices * X_k





m_x = np.real(np.fft.ifft(X_k))
plt.plot(t, x_n)
plt.plot(t, m_x)
plt.show()

data2 = m_x.astype(np.int16)
rate = f_samp
wavfile.write('result.wav',rate,data2)
