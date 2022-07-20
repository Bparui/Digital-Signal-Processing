% Code for input x[n] sinusoid creation 
clear
F = 10000;        % Sinusoid frequency ( Hz - Cycles/ second)
Fs = 100000;      % Sampling Frequency ( Hz -Samples/ second )
n = 4*Fs/F;       % 4(no. of cycles)* (no. of samples/cycle)  =40

t2 = 0:n-1;       %tiime axis with samples taken at 0,1,...39 = 40 samples
x_n2 = sin(2*pi*t2*F/Fs);   % input sinusoid
x_n2 = downsample(x_n2,2);  % Downsampling Signal by factor of 2
t2 = 0:n/2-1;               %redefining time axis for downsampled signal
fft_x_n2 = fft(x_n2)/length(x_n2)*2;
%finding the fft, normalising value for correct amplitude range
fft_x_n2 = fftshift(fft_x_n2);
% shifting fft to make it symmetric about 0 
Freq = ((-n/4:((n/4)-1))/(n/2))*2*pi;

figure
subplot(3,1,1)
stem(t2/(Fs/2),x_n2,'linewidth',2)
title("Sampled Sinusoid - 4 cycles",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on 
plot(t2/(Fs/2),x_n2,'-g','linewidth',1.5)
grid on 
subplot(3,1,2)
stem(Freq,angle(fft_x_n2),'linewidth',2);
title("Phase spectrum - Frequency Spectrim of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Phase (in rad)",'FontSize',15);
hold on 
plot(Freq,angle(fft_x_n2),'linewidth',1.5);
grid on
subplot(3,1,3)
stem(Freq,abs(fft_x_n2),'linewidth',2);
title("Amplitude spectrum - Frequency Spectrum of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on
plot(Freq,abs(fft_x_n2),'linewidth',1.5);
grid on 