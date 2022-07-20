clc;
clear;

%given sequences
%y[n]<-->Y[k] = X[k]XH[k]<--> x[n]*h[n](circular)  
%('*' Convolution,'X' element wise multiplication)
x_n = [1, 3, -2, 4, 7];
h_n = [3, 1, 21, -3];

N = max(length(x_n),length(h_n));  % Finding length of output signal y = max(len x,len h)
x_n = [x_n zeros(1,N-length(x_n))];  %Padding x[n] upto N samples with zero
h_n = [h_n zeros(1,N-length(h_n))];  %Padding h[n] upto N samples with zero
X = nfft(x_n,N);                     % DFT x[n] = X[k]
H = nfft(h_n,N);                     % DFT h[n] = H[k]
Y_k = X.*H;                          % DFT y[n] = Y[k] = X[k] x H[k]
y_n = infft(Y_k,length(Y_k));        % IDFT Y[k] = y[n]
stem(y_n,'LineWidth',1);
xlabel("Samples")
ylabel("Magnitude")
title("x[n]*h[n]")
hold on
disp(y_n);