% Code for input x[n] sinusoid creation 
clear

F = 500; % Sinusoid frequency ( in Hz -- Cycles per second)
Fs = 6000; % Sampling Frequency ( in Hz --Samples per second )
n = 100;  % no. of samples     
% At n= Fs/F= 12(i.e no.of samples required per cycle) we get a single i/p cycle
t = linspace(0,n/Fs,n);   % n/Fs = no. of seconds per 100 sample 

x_n = sin(2 * pi * t * F); % input sinusoid

% coefficients in numerator(input signals in difference equation)
num = [1 0 0 1];   
% coefficients in denominator(output signals in difference equation)
den = [1 -2.56 2.22 -0.65];

plot(t, x_n,'LineWidth', 2);
grid on;
xlabel('time in seconds', 'FontSize', 15);
ylabel('Amplitude ', 'FontSize', 15);