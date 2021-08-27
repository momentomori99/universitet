#for argon:
sigma = 3.4*10**(-10)
epsilon = 1.62*10**(-21) #m²kg/s²
k_b = 1.38064852 * 10**(-23)


def calc(T, P):
    T_star = (k_b * T)/epsilon
    P_star = (P * sigma**3)/epsilon

    print(f"T_star: {T_star}, P_star: {P_star}")
calc(293, 10**5)
