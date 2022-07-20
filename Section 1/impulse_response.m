%Code for Impulse Response
num = [1 0 0 1];            %Feed forward Coefficients
den = [1 -2.56 2.22 -0.65]; %Feed Backward Coefficients

[h,t] = impz(num,den);

plot(h,'LineWidth',2);
grid on
xlabel("Samples");
ylabel("Amplitude");
title("Impulse response of digital filter");