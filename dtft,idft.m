clc;
clear all;
close all;

xn = input("Enter Xn: ");
N1 = length(xn);

hn = input("Enter Hn: ");
N2 = length(hn);

Nm = N1 + N2 - 1;
display (Nm);

xn1 = [xn, zeros(1,N2-1)];
hn1 = [hn, zeros(1,N1-1)];

display("After zero padding matrices:");
display(xn1);
display(hn1);

%%For loops for TFM

for n = 0:(Nm-1)
  for k = 0:(Nm-1)
    W(n+1,k+1) = exp((-j*2*pi*k*n)/Nm);
  endfor
end

display("The TFM is:");
display(W);

%%Calculating DFT of xn and hn

Xk = W*xn1';
display("The input:");
display(Xk);

Hk = W*hn1';
display("The filter function:");
display(Hk);

Yk = Xk.*Hk;
display("The output:");
display(Yk);

%%Calculating IDFT of Yk

Wc = conj(W);
Yn = (1/Nm) * (Wc * Yk);
display("The final output after IDFT:");
display(Yn);

Ynabs = abs(Yn);
display("Calculated using DFT convolution: ");
display(Ynabs);

%%Verification with system function
Yo = conv(xn,hn);
display("Inbuilt function generated answer: ");
display(Yo);