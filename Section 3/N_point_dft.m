% Code for n-point DFT function
clc
clear

x_n = [1 2 3 4 ];   %Sample sequence for testing
x_n_nfft = nfft(x_n,length(x_n));  %Calling n point dft function (nfft)
disp(x_n_nfft);

function [x_k]=nfft(x_n,N)
len = length(x_n);
if N>len
    x_n = [x_n zeros(1,N)];
elseif N<len
    x_n = x_n(1:N);
end
for l = 1:N
    x_k(l) = 0;
    for n = 1:N
        x_k(l) = x_k(l) + x_n(n).*exp((-1j).*2.*pi.*(n-1).*(l-1)/N);
    end
end
end
