n = 0:199;
N = 200;
x_n = 2*cos(2*pi*n/10) + cos(2*pi*n/5);
x_k = nfft(x_n,N);     % Finding DFT using created function
x_ngen = infft(x_k,N); % Finding original sequence using made IDFT function
w = pi*n/N;


figure
subplot(3,1,1)
stem(w,abs(x_k),'LineWidth',1)
xlabel("Omega")
ylabel("Magnitude")
title("DFT of x[n] = 2*cos(2*\pi*n/10) + cos(2*\pi*n/5)")
grid on
subplot(3,1,2)
plot(n,x_ngen)
xlabel("Samples")
ylabel("Amplitude")
title("IDFT of x[k] , Generated from DFT")
grid on
subplot(3,1,3)
plot(n,x_n)
xlabel("Samples")
ylabel("Amplitude")
title("Original function x[n]")
grid on