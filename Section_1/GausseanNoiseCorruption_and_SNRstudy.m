%Code for White Gaussean Noise addition
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
impr = filter(num,den,op);
r_i = snr(impr);

figure 
subplot(3,1,1)
plot(x_n,'linewidth',2);
grid on
title("No Noise Input Signal ",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
subplot(3,1,2);
plot(op,'linewidth',2);
grid on
title("Input Signal with White Gaussean Noise(SNR = 5dB) ",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
subplot(3,1,3)
snr(op,Fs);
