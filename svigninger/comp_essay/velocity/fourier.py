import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile

class Analyse:
    def __init__(self, filename):
        def func1(t,f):

            return np.cos(f*2*np.pi*t)

        t = np.linspace(0,10,500)
        data = np.zeros(len(t))
        for i in range(len(t)):
            if t[i] < 4:
                f = 10
            else:
                f = 100

            data[i] = func1(t[i],f)

        self.x_n = data[:]
        self.N = data.shape[0]
        self.T = 10
        self.dt = 1/self.N
        self.t = t



    def soundplot(self):
        plt.plot(self.t, self.x_n)
        plt.grid(True)
        plt.xlabel("tid [s]")
        plt.ylabel("amplitude")
        plt.title("Plot of original sound")
        plt.show()

    def fourier_transform(self):
        self.x_k = np.fft.fft(self.x_n)
        self.freq = np.fft.fftfreq(self.N, self.dt)
        plt.plot(self.freq, abs(self.x_k))
        plt.grid(True)
        plt.xlabel("frekvens [f]")
        plt.ylabel("amplitude")
        plt.title("Plot of fourier transform")
        plt.xlim(xmin=0)
        plt.show()

    def noise(self, min_amp):
        indices = abs(self.x_k) > min_amp
        x_knew = indices * self.x_k
        self.n_xnew = abs(np.fft.ifft(x_knew))

        plt.subplot(2,1,1)
        plt.plot(self.freq, abs(x_knew))

        plt.subplot(2,1,2)
        plt.plot(self.t, self.x_n)
        plt.plot(self.t, self.n_xnew)
        plt.show()

    def wavelet_analyse(self,tmin, tmax, tsteps, fmin, fmax, fsteps):
        def wavelet(f_a, K, t_k, t_n):
            C = 0.798*2*np.pi*f_a/(self.f_s*K)
            eksp1 = -1j*2*np.pi*f_a*(t_n - t_k)
            eksp2 = -K**2
            eksp3 = (-2*np.pi*f_a**2)*((t_n - t_k)**2)/(2*K)**2
            return C*(np.exp(eksp1) - np.exp(eksp2))*np.exp(eksp3)

        t_ = np.linspace(tmin,tmax,tsteps)
        f_ = np.linspace(fmin,fmax,fsteps)
        T,F = np.meshgrid(t_,f_)
        K = 5

        sum = 0
        for i in range(self.N):
            sum = sum + np.conj(self.n_xnew[i]*(wavelet(F, K, T, self.t[i])))
        Z = abs(sum)
        plt.contourf(T,F,Z)
        plt.grid(True)
        plt.colorbar()
        plt.xlabel("tid [s]")
        plt.ylabel("Frekvens [Hz]")
        plt.title("2D plot av wavelettransform")
        plt.show()

if __name__ == '__main__':
    ins = Analyse('normal_breathing2.wav')
    ins.soundplot()
    ins.fourier_transform()
