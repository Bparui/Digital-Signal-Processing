%% Sequence 1 i) x(n) = [1; 3; −2; 4; 7], h(n) = [3; 1; 21; −3]
clc;
clear;
x_n = [1, 3, -2, 4, 7];
h_n = [3, 1, 21, -3];

y_n = circ_conv(x_n,h_n);
stem(y_n,'LineWidth',1.5)
xlabel("Sample")
ylabel("Amplitude")
title("y[n] = (x[n]=[1, 3, -2, 4, 7])*(h[n] = [3, 1, 21, -3])")

%% Sequence 2 ii) x(n) = x_n = n, h_n = (0.5).^n ,  0 ≤ n ≤ 10
clc;
clear;
n = 0:10;
x_n = n;
h_n = (0.5).^n;
y_n = circ_conv(x_n,h_n);
stem(y_n,'LineWidth',1.5)
xlabel("Sample")
ylabel("Amplitude")
title("y[n] = (x_n = n)*(h_n = (0.5)^n)")
