import numpy as np
import matplotlib.pyplot as plt


def func1(t,f):
    A = 1
    return A*np.sin(2*np.pi*f*t)

T = 1
f_s = 1000
N = T*f_s
dt = T/N

t = np.linspace(0,T,N)

n = np.zeros(N)
for i in range(N):
    if t[i] < 0.5:
        n[i] = func1(t[i], 5)
    else:
        n[i] = func1(t[i], 10)

print(N)
plt.plot(t, n)
plt.show()
# plt.plot(t, func1(t,1))
# plt.show()


x_k = abs(np.fft.fft(n))
freq = np.fft.fftfreq(N, dt)

plt.plot(freq, x_k)
plt.show()
