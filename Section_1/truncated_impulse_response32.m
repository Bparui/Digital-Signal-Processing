% Code for output with truncated Impulse response
clear
F = 500;        % Signal Frequency (Hz-cycles per second)
n = 48;         % samples (4 cycles)
Fs = 6000;      % Sampling Frequency(Hz-samples per second)
t = linspace(0, n/Fs, n);
x_n = sin(2 * pi * t * F);
num = [1 0 0 1];            %Feed forward Coefficients
den = [1 -2.56 2.22 -0.65]; %Feed Backward Coefficients

h = impz(num,den);
x_0 = conv(x_n,h(1:32));    %IIR*x[n] 

figure
subplot(3,1,1)
plot(h(1:32),"LineWidth",2)
title("Truncated Impulse(32samples) ",'FontSize', 15);
xlabel('Samples', 'FontSize', 8);
ylabel('Amplitude', 'FontSize', 8);

subplot(3,1,2)
plot(x_0,'LineWidth',2)
grid on
title("(Impulse Response)*(Input signal-4 cycle) ",'FontSize', 15);
xlabel('Samples', 'FontSize', 8);
ylabel('Amplitude', 'FontSize', 8);


subplot(3,1,3)
plot(t,x_0(1:48),'LineWidth',2)
grid on
title("Same as above but with unitoftime upto 4 input cycle(48 samples) ",'FontSize', 15);
xlabel('Time(t) in seconds', 'FontSize', 8);
ylabel('Amplitude', 'FontSize', 8);