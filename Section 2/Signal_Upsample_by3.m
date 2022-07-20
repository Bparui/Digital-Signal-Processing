% Code for spectrum of upsampled signal
clear
F = 10000;        % Sinusoid frequency ( Hz - Cycles/ second)
Fs = 100000;      % Sampling Frequency ( Hz -Samples/ second )
n = 4*Fs/F;        % 4(no. of cycles)* (no. of samples/cycle)  =40  

t3 = 0:n-1;        %tiime axis with samples taken at 0,1,...119 = 120 samples
x_n3 = sin(2*pi*t3*F/Fs);  % input sinusoid
x_n3 = upsample(x_n3,3);   % upsampling Signal by factor of 3
t3 = 0:n*3-1;             %redefining time axis for upsampled signal
fft_x_n3 = fft(x_n3);
%finding the fft, normalising value for correct amplitude range
fft_x_n3 = fftshift(fft_x_n3);
% shifting fft to make it symmetric about 0 
Freq = ((-(3*n)/2:(((n*3)/2)-1))/(n*3))*2*pi;

figure
subplot(3,1,1)
stem(t3/(Fs*3),x_n3,'linewidth',2)
title("Sampled Sinusoid - 4 cycles",'FontSize',15);
xlabel("Time in seconds",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on 
plot(t3/(Fs*3),x_n3,'-g','linewidth',1.5)
grid on 
subplot(3,1,2)
stem(Freq,angle(fft_x_n3),'linewidth',2);
title("Phase spectrum - Frequency Spectrim of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Phase (in rad)",'FontSize',15);
hold on 
plot(Freq,angle(fft_x_n3),'linewidth',1.5);
grid on
subplot(3,1,3)
stem(Freq,abs(fft_x_n3),'linewidth',2);
title("Amplitude spectrum - Frequency Spectrum of signal(-\pi to +\pi)",'FontSize',15);
xlabel("Angular Frequency = 2*frequency*\pi ",'FontSize',15);
ylabel("Amplitude",'FontSize',15);
hold on
plot(Freq,abs(fft_x_n3),'linewidth',1.5);
grid on 
