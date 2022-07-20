% Code for spectrum of signal (at 4 cycles , perfectly sampled
clear
F = 10000;        % Sinusoid frequency ( Hz - Cycles/ second)
Fs = 100000;      % Sampling Frequency ( Hz -Samples/ second )
n = 4*Fs/F;         % 4(no. of cycles)* (no. of samples/cycle)
t = 0:n-1;   %time axis ,  1/Fs is the sampling period 
x_n = sin(2*pi*t*F*1/Fs);      % sampled signal

fft_x_n = fft(x_n)/length(x_n)*2; %finding the fft, normalising value for correct amplitude range
fft_x_n = fftshift(fft_x_n);      % shifting fft to make it symmetric about 0 
Freq = ((-n/2:((n/2)-1))/n)*2*pi;  % defining frrquency scale

figure
subplot(3,1,1)
stem(t/Fs,x_n,'linewidth',2)
title("Sampled Sinusoid - 4 cycles",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on 
plot(t/Fs,x_n,'-g','linewidth',1.5)
grid on 
subplot(3,1,2)
stem(Freq,angle(fft_x_n),'linewidth',2);
title("Phase spectrum - Frequency Spectrim of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Phase (in rad)",'FontSize',15);
hold on 
plot(Freq,angle(fft_x_n),'linewidth',1.5);
grid on
subplot(3,1,3)
stem(Freq,abs(fft_x_n),'linewidth',2);
title("Amplitude spectrum - Frequency Spectrum of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on
plot(Freq,abs(fft_x_n),'linewidth',1.5);
grid on 