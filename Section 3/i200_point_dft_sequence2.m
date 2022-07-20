clc
clear

n = 0:199;   % No. of samples
N = 200;     %Length of sequence
xn =n;  % defining function
w = pi*n/N;                           % Converting 200 samples to 0-2pi
xk = nfft(xn,N);                        % Finding 200 point DFT 


figure
subplot(2,1,1)
stem(n,xn,'LineWidth',1)
xlabel("samples")
ylabel("Amplitude")
title("x[n] = n")
grid on
subplot(2,1,2)
stem(w,abs(xk),'LineWidth',1)
xlabel("omega")
ylabel("Magnitude")
title("x(k) against omega")
grid on