%code
clear
F1 = 500;                    % Sinusoid frequency1 ( Hz))
F2 = 1500;                   % Sinusoid frequency2 ( Hz )
Fs = 6000;                   % Sampling Frequency ( Hz )
n = 100;                     % no. of samples 
t = linspace(0,n/Fs,n);

x_n1 = sin(2 * pi * t * F1);  %Sinusoid 1 at F1=500Hz Fs=6kHz
x_n2 = sin(2*pi*t*F2);       %Sinusoid 1 at F1=500Hz Fs=6kHz
x_n = x_n1+x_n2;             % Signal_1 + Signal_2

num = [1 0 0 1];             % Feed Forward Coeffs
den = [1 -2.56 2.22 -0.65];  % Feed Backward Coeffs      
y_n = filter(num,den,x_n);   %Digital filterer on New signal

figure
subplot(2,1,1)
plot(t, x_n,'-r','LineWidth', 2);
title("x[n] = x_{'1'}[n] + x_{'2'}[n]",'FontSize', 15);
xlabel("Time in seconds",'FontSize', 15);
ylabel('Amplitude', 'FontSize', 15);
grid on;
subplot(2,1,2) 
plot(t,y_n,'LineWidth',2);
title("Output signal y[n]","LineWidth",2);
xlabel('Time in seconds', 'FontSize', 15);
ylabel('Amplituude', 'FontSize',15);
grid on;