% Code for output signal from given digital filter using filter()
clear
F = 500;        % Sinusoid frequency ( Hz - Cycles/ second)
Fs = 6000;      % Sampling Frequency ( Hz -Samples/ second )
n = 48;         % no. of samples     
% 4 cycles  =  12X4 = 48 samples
t = linspace(0,n/Fs,n);
x_n = sin(2*pi*t*F);    % input sinusoid
y_n = zeros(1,n);       % Defining Output leny[n] = lenx[n]
y_n(1:3) = [0 0 0];     % Given Zero initial conditions 

% using loops to get value for each y[k] k E (4,5..48)
for k = 4:n
    y_n(k) = x_n(k)+ x_n(k-3) + 2.56*y_n(k-1) - 2.22*y_n(k-2) + 0.65*y_n(k-3);
end

plot(t,y_n,'LineWidth',2)
grid on
hold on
plot(t,x_n,'LineWidth',2)
title("Input x[n],Output y[n] without 'Filter' function (no.ofsamples = 48)");
xlabel("time (t)in seconds");
ylabel("Amplitude");

legend("y[n]","x[n]");