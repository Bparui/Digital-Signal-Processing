%Code for filter task
coeffy = [1, -0.919, 0.325];
coeffx = [0.102, 0.204, 0.102];


n=0:100;
x_1 = sin(0.1*pi*n);   % Sinusoid within passband
x_2 = sin(0.65*pi*n);  % Sinusoid out of passband

n=0:100;
x_add = x_1+x_2;       % adding them
y = filter( coeffx, coeffy,x_add);    % applying filter given

figure();
subplot(411);
plot(n,x_1);
grid on;
title("x1=sin(0.1\pi n");

subplot(412);
plot(n,x_2);
grid on;
title("x1=sin(0.65\pi n");

subplot(413);
plot(n,x_add);
grid on;
title("x=x1+x2");

subplot(414);
plot(n,y);
grid on;
title("filter output on x");