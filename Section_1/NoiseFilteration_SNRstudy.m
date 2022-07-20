%Code for Improvement in SNR
clear

F = 100;       % (Cycles/second / Samples/Second) = Cycles/Sample
Fs = 1000;      % F/Fs = 100/1000 = 0.1 Cycles/Sample
n = 100;   % no. of samples| basically 10 cycles 
t = linspace(0,n/Fs,n);   
x_n = sin(2 * pi * t * F);   %sin(2pi*n*(1/Fs*F)) 

num = [1 0 0 1];              %Feed Forward Coefficients
den = [1 -2.56 2.22 -0.65];   %Feed Backward Coefficients
op = awgn(x_n,5,'measured');  % Noise induced Signal at SNR = 5dB
SNR = snr(op);
improved = filter(num,den,op);
r_i = snr(improved);

figure
subplot(2,1,1)
plot(t,improved,'linewidth',2);
grid on
title("Filtered White Gaussean Noise signal",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
subplot(2,1,2)
snr(improved,Fs);