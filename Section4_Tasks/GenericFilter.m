%Code for filter task
F = 500;
Fs = 6000;
n = 48;
t = linspace(0,n/Fs,n);
x_n = sin(2*pi*t*F);
y_n = zeros(1,n);
y_n(1:3) = [0,0,0];
for k = 4:n
    y_n(k) = x_n(k) + x_n(k-3) + 2.56*y_n(k-1) - 2.2*y_n(k-2) + 0.65*y_n(k-3);
end