clc;
clear all;
close all;

m = 50;
win = hanning(m);
deno = 1;

b = fir1(m-1, 0.20, "low", win);
figure();
freqz(b, deno);

n = 0:249;
f = 500;
fs = 4000;

x = sin(2*pi*f*n/fs);

r = randn(1,250) * sqrt(0.1);
xn = x + r;

y = filter(b, deno, xn)

figure();
subplot(3,1,1)
plot(x)
title("X")
subplot(3,1,2)
plot(xn)
title("Xn")
subplot(3,1,3)
plot(y)
title("Y")

figure();
subplot(3,1,1)
plot(abs(fft(x)))
title("FFT(X)")
subplot(3,1,1)
plot(abs(fft(xn)))
title("FFT(Xn)")
subplot(3,1,1)
plot(abs(fft(y)))
title("FFT(Y)")
