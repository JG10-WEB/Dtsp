clc;
clear all;
 
p = [0.5, +0.7*exp(j*((3*pi)/4)), +0.7*exp(-j*((3*pi)/4))]
z = [+0.5*exp(j*(pi/4)), +0.5*exp(-j*(pi/4))]
 
k=1;
[num,den] = zp2tf(z' , p' , k)
fs=50;
t = 1: (1/fs) : 10
 
x1 = sin(2*pi*10*t)
x2 = sin(2*pi*20*t)
x = x1 + x2
 
y = filter(num,den,x);
freqz(num,den)
figure;
 
subplot(4,1,1)
stem(x1)
subplot(4,1,2)
stem(x2)
subplot(4,1,3)
stem(x)
subplot(4,1,4)
stem(y)
 
g1 = fft(x1);
g2 = fft(x2);
g3 = fft(x);
g4 = fft(y);
 
figure;
subplot(2,2,1)
plot(g1)
subplot(2,2,2)
plot(g2)
subplot(2,2,3)
plot(g3)
subplot(2,2,4)
plot(g4)