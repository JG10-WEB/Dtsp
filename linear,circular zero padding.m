clc;
clear all;

x = input('Enter x:');
h = input('Enter h:');
N1 = length(x);
N2 = length(h);
x_new = [x, zeros(1,N2-1)]
h_new = [h, zeros(1,N1-1)]

N1 = length(x_new)
N2 = length(h_new)
    
h_new = h_new.';
h_ans = h_new;
for k = 1:(N1-1);
    h2 = circshift(h_new,k);
    h_ans = horzcat(h_ans,h2);
end

h_ans

y = h_ans*x_new.'

conv(x,h)