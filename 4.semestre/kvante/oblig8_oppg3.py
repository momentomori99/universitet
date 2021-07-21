import matplotlib.pyplot as plt
import numpy as np


L = 0.2 #[nm]
hbar = 1240  #[eVnm]
V0 = 10.0 #[eV]
m = 9.10*10**(-31) #[kg]

def T1(E):
    """
    Tilfelle 1 når E < V0
    """
    sinh = ((np.sqrt(2*m*(V0 - E)))/(hbar)) * L
    faktor1 = (V0**2)/(4*(V0 - E)*E)
    nevner = 1 + faktor1*np.sinh(sinh)**2
    return 1/nevner

E = np.linspace(0,10,100)

kons = 1/(1 + ((m*L**2)/(2*hbar**2))*V0)
print(f"konst: {kons}")


plt.plot(E, T1(E))
plt.xlabel("Enegier [eV]")
plt.ylabel("Sannsynlighet for transmisjon")
plt.grid(True)
plt.show()
def T3(E):
    """
    Tilfelle 1 når E > V0
    """
    sin = ((np.sqrt(2*m*(E-V0)))/(hbar)) * L
    faktor1 = (V0**2)/(4*E*(E-V0))
    nevner = 1 + faktor1*np.sin(sin)**2
    return 1/nevner

E3 = np.linspace(10,20,100)

print(T3(11))

plt.plot(E3, T3(E3))
plt.xlabel("Enegier [eV]")
plt.ylabel("Sannsynlighet for transmisjon")
plt.grid(True)
plt.show()
