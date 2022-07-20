num = [1 0 0 1];             %Feed Forward Coefficient
den = [1 -2.56 2.22 -0.65];  %Feed Backward Coefficient
[h,w] = freqz(num,den);      %Computing Frequency response
% h is the frequency response and w is the angular frequency (0 to pi)
figure
subplot(2,1,1)
plot((w/pi),abs(h),'LineWidth',2)
grid on
xlabel("Normalised Frequency (X\pi rad/sample) ",'FontSize',15);
ylabel("Magnitude",'FontSize',15);
title("Magnitude response",'FontSize',15);

subplot(2,1,2)
plot(w/pi,angle(h),'LineWidth',2)
grid on
xlabel("Normalised Frequency (X\pi rad/sample)",'FontSize',15);
ylabel("Phase Angle in rad",'FontSize',15);
title("Phase response",'FontSize',15);