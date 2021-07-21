import numpy as np

I0 = 13.7
I = np.array([12.4, 11.0, 9.7, 8.9, 7.9, 7.1])
z = np.array([4, 8, 12, 16, 20, 24])

inlog = np.log(I0/I)


my = np.zeros(len(z))
for i in range(len(z)):
    my[i] = inlog[i]/z[i]


print(my)
print(np.average(my))
