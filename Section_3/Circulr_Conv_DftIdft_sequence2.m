clc;
clear;

%given sequences
%y[n]<-->Y[k] = X[k]XH[k]<--> x[n]*h[n](circular)  
%('*' Convolution,'X' element wise multiplication)
n = 0:10;
x_n = n;
h_n = (0.5).^n;

N = max(length(x_n),length(h_n));  % Finding length of output signal y = max(len x,len h)
x_n = [x_n zeros(1,N-length(x_n))];  %Padding x[n] upto N samples with zero
h_n = [h_n zeros(1,N-length(h_n))];  %Padding h[n] upto N samples with zero
X = nfft(x_n,N);                     % DFT x[n] = X[k]
H = nfft(h_n,N);                     % DFT h[n] = H[k]
Y_k = X.*H;                          % DFT y[n] = Y[k] = X[k] x H[k]
y_n = infft(Y_k,length(Y_k));        % IDFT Y[k] = y[n]
stem(y_n,'LineWidth',1.5);
xlabel("Samples")
ylabel("Magnitude")
title("(x[n] = n)*(h[n] = 0.5^n)")
hold on
disp(y_n);