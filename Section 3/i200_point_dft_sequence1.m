clc
clear

n = 0:199;   % No. of samples
N = 200;     %Length of sequence
xn = 2*cos(2*pi*n/10) + cos(2*pi*n/5);  % defining function
w = pi*n/N;                           % Converting 200 samples to 0-2pi
xk = nfft(xn,N);                        % Finding 200 point DFT 


figure
subplot(2,1,1)
stem(n,xn)
xlabel("samples")
ylabel("Amplitude")
title("x[n] = 2cos(2\pin/10) + cos(2\pin/5)")
grid on
subplot(2,1,2)
stem(w,abs(xk))
hold on
plot(w,abs(xk))
xlabel("omega")
ylabel("Magnitude")
title("x(k) against omega")
grid on