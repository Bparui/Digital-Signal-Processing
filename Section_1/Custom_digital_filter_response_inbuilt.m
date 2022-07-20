% Code for output signal from given digital filter using filter()
clear
F = 500;        % Sinusoid frequency ( Hz - Cycles/ second)
Fs = 6000;      % Sampling Frequency ( Hz -Samples/ second )
n = 48;         % no. of samples     
% 4 cycles  =  12X4 = 48 samples
t = linspace(0,n/Fs,n);
x_n = sin(2*pi*t*F);    % input sinusoid

num = [1 0 0 1];               %Coefficients of x[n-k]
den = [1 -2.56 2.22 -0.65];    %Coefficients of y[n-k]
y_n = filter(num,den,x_n); %INbuilt function to solve difference equation

plot(t, x_n,'-c','LineWidth', 2);
grid on;
title("x[n],y[n] with Filter function (n=48)"); 
xlabel('time(t) in seconds', 'FontSize', 15);
ylabel('Amplitude', 'FontSize', 15);
hold on;
plot(t,y_n,'-m','LineWidth',2);
grid on;
legend("x[n]","y[n]");