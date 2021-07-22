import numpy as np
import matplotlib.pyplot as plt

x = [24, 24.5, 25, 25.5, 26, 26.5, 27, 27.5, 28, 28.5, 29]
y = [123, 158, 185, 118, 83, ]


# plt.plot(x,y)
# plt.show()



def f(U):
    e = 1.60217662*10**(-19) #Coulombs
    m = 9.10938356*10**(-31) #kg
    c = 299792458 #m/s
    U = U*1000
    sqrt = 1 + (e*U)/(2*m*c**2)

    nevner = np.sqrt(1 + (e*U)/(2*m*c**2))


    return 1/nevner

print(f(100))
