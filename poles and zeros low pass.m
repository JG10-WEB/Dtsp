clc;
clear all;
p=[0.5,-0.7*exp(j*((3*pi)/4)),-0.7*exp(-j*((3*pi)/4))];
z=[-0.5*exp(j*(pi/4)),-0.5*exp(-j*(pi/4))];
[num,denum]=zp2tf(p',z',1);
fs=50;
t=0:(1/fs):10
x1=sin(2*pi*10*t)
x2=sin(2*pi*10*t)
x=x1+x2
y=filter(num,denum,x);

freqz(num,denum);
figure;

subplot(4,1,1)
title('X1')
Stem((t,x1)
subplot(4,1,2)
title('X2')
Stem((t,x2)
subplot(4,1,3)
title('x')
Stem((t,x)
subplot(4,1,4)
title('Y')
stem(t,y)
figure;

g1=fft(x1)
g2=fft(x2)
g3=fft(x)
g4=fft(y)

subplot(4,1,1)
title('X1')
plot((t,g1)
subplot(4,1,2)
title('X2')
plot((t,g2)
subplot(4,1,3)
title('x')
plot((t,g3)
subplot(4,1,4)
title('y')
plot(t,g4)









