%% Codea
clc
% f(t)= |c| * exp(at) * exp(jwt + theeta)
% fs = 400Hz, |c| = 2, a = 2, w =2pi100, theeta = pi/4.
fs = 400; %Sampling frequence
Ts = 1/fs; %Sampling Period
n = 0:500; %No. of Points
mod_c = 2;
a = 2;
w = 2*pi*100;
theeta = pi*(1/4);
f_n = mod_c*exp(a*(n-0.9)*Ts).*exp(1i*w*(n-0.9)*Ts +
theeta); % Function in terms of discrete time
Re_f = (f_n + conj(f_n))/2; % Real part of the function
Im_f = (f_n - conj(f_n))/(2*1i); % Imaginary part of the
function
Mag_f = abs(f_n); % Magnitude of Function
Phase_f = angle(f_n); % Phase of function
%Plotting the real part of function
plot(n*Ts,Re_f)
grid on
xlabel('Time in sec');
ylabel('Amplitude in DC');
title('Re(h(n)) vs n');
figure
% Plotting the imaginary part of function
plot(n*Ts,Im_f)
grid on
xlabel('Time in sec');
ylabel('Amplitude in DC');
title('Im(h(n)) vs n');
figure
% Plotting the Magnitude of function
plot(n*Ts,Mag_f)
grid on
xlabel(';Time in sec');
ylabel(';Magnitude in DC');
title('Mag(h(n)) part vs n');

%% 
% x(t) = x(t+2) is a square pulse
Fs = 20; %Sampling frequency
offset=0.5; %shift of graph in positive y direction
amp=0.5; %amplitude of square pulse curve symmetric
about x-axis
t=0:1/Fs:5; %Time range for graph, sampled at Fs = 20
x_n= offset + amp*square((pi*t)+1.5); %Generating desire
curve
y_n = conv_parui_019(sq_wav,sq_wav); %Convolving x_n
stem(t,x_n)
grid on
xlabel('Time in Seconds(s)');
ylabel('x[n]');
title('Sampling of square pulse train ')
figure
stem(y_n)
grid on
xlabel('Time in Seconds(s)');
ylabel('y[n] = x[n]*x[n] ');
title('Square convolution with self ')