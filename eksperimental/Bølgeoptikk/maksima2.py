import numpy as np
import matplotlib.pyplot as plt


def E(x, c, a, N, A, lamb):
    """Alt skal oppgis i mm untatt lambda, lambda skal være i nm

    A: avstand mellom spaltene
    a: bredde til spalten
    c: regnet fra før, pi/(lambda*R) (gjort alt om til mm)
    N: antall spalter
    lamb: lysets bølgelengde
    """

    if N == 1:
        return ((np.sin(a*c*x))/(a*c*x))**2
    else:
        return (((np.sin(a*c*x))/(a*c*x))**2) * (((np.sin(N*A*c*x))/(A*c*x))**2)





x = np.linspace(-100,100,10000)

plt.plot(x, E(x, 0.627,0.12,2,0.6,0.000632))
plt.title("plot_2, from task A2, lab")
plt.show()
