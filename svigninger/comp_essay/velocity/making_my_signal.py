import numpy as np
import matplotlib.pyplot as plt

f = 260
def func1(t):
    A = 1
    if t < 0.5:
        f = 10
        return A*np.sin(2*np.pi*f*t)
    if t > 0.5:
        f = 20
        return A*np.sin(2*np.pi*f*t)



t = np.linspace(0,1,500)




plt.plot(t, func1(t))
# # plt.plot(t, func1(t,1))
# plt.show()
#
# x_n = func1(t)
#
# x_k = abs(np.fft.fft(x_n))
# freq = np.fft.fftfreq(500, 1/500)
#
# plt.plot(freq, x_k)
# plt.show()
