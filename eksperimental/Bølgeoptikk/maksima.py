import numpy as np
import matplotlib.pyplot as plt


def E(x, c, a, N, A, lamb):
    """Alt skal oppgis i mm untatt lambda, lambda skal være i nm

    A: avstand mellom spaltene
    a: bredde til spalten
    R: avstand fra spalten til skjermen
    N: antall spalter
    lamb: lysets bølgelengde
    """



    return ((np.sinc(a*c*x))**2) * ((np.sinc(N*A*c*x))**2)





x = np.linspace(-100,100,10000)

plt.plot(x, E(x,0.627,0.12,2,0.6,0.000632))
plt.show()
#
# plt.plot(x, E(x,5000,0.12,6,0.6,632.8)) #prøve eksempel
# plt.show()


# R1 = [3.972, 3.956, 3.960]
# R2 = [3.962, 3.963, 3.962]
#
# R1_error = np.std(R1)/np.sqrt(3)
# R2_error = np.std(R2)/np.sqrt(3)
# print(R1_error)
# print(R2_error)
# R1_avg = np.mean(R1)
# R2_avg = np.mean(R2)
# print(R1_avg)
# print(R2_avg)
