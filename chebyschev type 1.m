clc;
clear all;
close all;
fp=475; # pass band frequency
fs=700; # sampling frequency
Fs=3000; #stop band frequency
f1=400;
f2=700;
rp=1; # Passband ripple, in decibels
rs=60; # Stopband attenuation, in decibels
wp=2*fp/Fs; # Passband corner frequency 
ws=2*fs/Fs; # Stopband corner frequency
w1=2*f1/Fs; # window
w2=2*f2/Fs;
w=[w1 w2];
[N,wc]=cheb2ord(wp,ws,rp,rs); #order and cutoff frequency
display(N)
display(wc)
Rs=60
[b1,a1]=cheby2(N,Rs,wc,'low'); #Transfer function coefficient
[b2,a2]=cheby2(N,Rs,wc,'high');
[b3,a3]=cheby2(N,Rs,wc);
[b4,a4]=cheby2(N,Rs,wc,'stop');
freqz(b1,a1);
figure;
freqz(b2,a2);
figure;
freqz(b3,a3);
figure;
freqz(b4,a4);
figure;

n=0:1:249;
T=1/Fs;
x=sin(2*pi*500*n*T);
rn=randn(1,250);
noise=sqrt(0.1)*rn;
xnoise=x+noise;
ylow=filter(b1,a1,xnoise);
yhigh=filter(b2,a2,xnoise);
ybandpass=filter(b3,a3,xnoise);
ybandreject=filter(b4,a4,xnoise);

subplot(2,1,1);
plot(n,x);
subplot(2,1,2);
plot(n,xnoise);
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
g1=abs(fft(x));
g2=abs(fft(xnoise));
subplot(2,1,1);
plot(f,g1);
subplot(2,1,2);
plot(f,g2);
figure;

h1=abs(fft(ylow));
h2=abs(fft(yhigh));
h3=abs(fft(ybandpass));
h4=abs(fft(ybandreject));
subplot(4,1,1);
plot(f,h1);
title('Low Pass Filter');
subplot(4,1,2);
plot(f,h2);
title('High Pass Filter');
subplot(4,1,3);
plot(f,h3);
title('Band Pass Filter');
subplot(4,1,4);
plot(f,h4);
title('Band Reject Filter');