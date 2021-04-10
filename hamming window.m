clc;
clear all;
close all;
M = 50;
N = M-1;
Fs = 2500;
Fc = 600;
f1 = 300;
f2 = 900;
W1 = 2*f1/Fs;
W2 = 2*f2/Fs;
W = [W1 W2];
Wc = (2*Fc)/Fs;
Blpf=fir1(N,Wc,'low',hamming(M)); 
Bhpf=fir1(N,Wc,'high',hamming(M));
hbpf=fir1(N,W,'bandpass',hamming(M));
hbrf=fir1(N,W,'stop',hamming(M));
freqz(Blpf);
figure;
freqz(Bhpf);
figure;
freqz(hbpf);
figure;
freqz(hbrf);
figure;
n=0:249;

T=1/Fs;
x1=sin(2*pi*500*n*T)
x2=sin(2*pi*700*n*T)
x=x1+x2;
ylow=filter(Blpf,1,x);
yhigh=filter(Bhpf,1,x);
ybandpass=filter(hbpf,1,x);
ybandreject=filter(hbrf,1,x);
subplot(3,1,1);
plot(n,x1);
subplot(3,1,2);
plot(n,x2);
subplot(3,1,3);
plot(n,x);
figure;
subplot(4,1,1);
plot(n,ylow);
subplot(4,1,2);
plot(n,yhigh);
subplot(4,1,3);
plot(n,ybandpass);
subplot(4,1,4);
plot(n,ybandreject);
figure;

f=(n*Fs)/250;
g1=abs(fft(x1));
g2=abs(fft(x2));
g3=abs(fft(x));
subplot(3,1,1);
plot(f,g1);
subplot(3,1,2);
plot(f,g2);
subplot(3,1,3);
plot(f,g3);
figure;
h1=abs(fft(ylow));
h2=abs(fft(yhigh));
h3=abs(fft(ybandpass));
h4=abs(fft(ybandreject));
subplot(4,1,1);
plot(f,h1);
subplot(4,1,2);
plot(f,h2);
subplot(4,1,3);
plot(f,h3);
subplot(4,1,4);
plot(f,h4);














