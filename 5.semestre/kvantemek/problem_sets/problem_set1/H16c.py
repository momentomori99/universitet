import numpy as np
import matplotlib.pyplot as plt


def delta(x,e):
    return (1/np.pi)*(e/(e**2 + x**2))
x = np.linspace(-1,1,100000)


plt.plot(x, delta(x,0.01))
plt.title("e = 0.01")
plt.xlabel("x")
plt.ylabel("delta_e")
plt.grid(True)
plt.show()
