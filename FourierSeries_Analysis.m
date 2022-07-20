%%function [a_k] = dtfs_parui_019(x_n,num)
N = numel(x_n); %length of period
y = zeros(1,N); % storing for Fourier series
for k=1:N
a = 0;
for n=1:N
a = a+ x_n(n)*exp(-1i*2*pi*(n-1)*(k-1)/N);
end
y(k) = a;
a_k = y(1,1:num);
end

%%
clc;
clear all;
close all;
%g(t) = sin(2pi50t) + cos(2pi100t) + sin (2pi250t), sample
g(t) with fs = 1000Hz
fs = 1000; %Sampling frequence
Ts = 1/fs; %Sampling Period
n = 0:199;
g_n =sin(2*pi*50*n*Ts) +cos(2*pi*100*n*Ts) +
sin(2*pi*250*n*Ts);
period = 20;
k = numel(g_n)-1;
freq_ax = 0:(fs/numel(g_n)):(numel(g_n)-1)*(fs/numel(g_n));
G_k = dtfs_parui_019(g_n,k+1);
Re_G = (G_k + conj(G_k))/2; % Real part of the function
Im_G = (G_k - conj(G_k))/(2*1i);
plot(Re_G)
grid on
xlabel('k');
ylabel('Real part of G_k in DC');
title('G[k] versus k');
figure
plot(Im_G)
grid on
xlabel('k');
ylabel('Imaginary part of G_k in DC');
title('G[k] vs k');
figure
plot(abs(G_k))
grid on
xlabel('k');
ylabel('Magnitude of G_k in DC');
title('G[k] vs k');
figure
plot(angle(G_k))
grid on
xlabel('k');
ylabel('Phase of G_k in DC');
title('G[k] vs k');
plot(freq_ax,Re_G)
grid on
xlabel('Frequency in Hz');
ylabel('Real part of G_k in DC');
title('G[k] versus Frequency');
figure
plot(freq_ax,Im_G)
grid on
xlabel('Frequency in Hz');
ylabel('Imaginary part of G_k in DC');
title('G[k] vs Frequency');
figure
plot(freq_ax,abs(G_k))
grid on