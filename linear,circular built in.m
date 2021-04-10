clc;
clear all;

x = input('Enter the elements for input array');
h = input('Enter the elements for response array');
N1 = length(x);
N2 = length(h);
xn = [x, zeros(1,N2-1)];
hn = [h, zeros(1,N1-1)];

N=N1+N2-1:
ht=transpose(hn);
v=ht;
for m = 1:(N1-1);
    k = circshift(ht,m);
    v = horzcat(v,k);
end
disp(v)
xt=transpose(xn);

disp("Circular Convolution:")
y = v*xt
disp("Linear convolution using built in function:")
y=conv(x,h)