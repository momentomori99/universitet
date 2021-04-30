import numpy as np
import matplotlib.pyplot as plt


def E(x, R, a, N, A, lamb):
    """Alt skal oppgis i mm untatt lambda, lambda skal være i nm

    A: avstand mellom spaltene
    a: bredde til spalten
    R: avstand fra spalten til skjermen
    N: antall spalter
    lamb: lysets bølgelengde
    """
    v = lamb * 10**(-6)
    c = np.pi/(v*R)

    if N == 1:
        return ((np.sin(a*c*x))/(a*c*x))**2
    else:
        return (((np.sin(a*c*x))/(a*c*x))**2) * (((np.sin(N*A*c*x))/(A*c*x))**2)





x = np.linspace(-100,100,10000)

plt.plot(x, E(x,5000,0.12,1,0,632.8))
plt.show()

plt.plot(x, E(x,5000,0.12,6,0.6,632.8)) #prøve eksempel
plt.show()
