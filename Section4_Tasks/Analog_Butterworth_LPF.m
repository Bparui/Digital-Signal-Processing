%Code for task 1
%Given specifications
nn=80;
w = 1:nn;
w_stop = 25:60;
w_pass = 20;
As = -25;
Ap = -3;


%Order
a = 10^(-Gs/10)-1;
b = 10^(-Gp/10)-1;
numer = log10((10^(-As/10)-1)/(10^(-Ap/10)-1));
denom = 2*log10(w_stop./w_pass);
n = ceil((log10((10^(-As/10)-1)/(10^(-Ap/10)-1))./(2*log10(w_stop./w_pass))));
omega_c = w_pass./(10^(-Ap/10)-1).^(1./2*n);

for i=1:numel(n)
    flt = (1+1i.*(w./omega_c(i)).^(2*n(i))).^-1;
    magitude = abs(flt);
    plot(linspace(0,pi,nn),magitude)
    hold on;
end
grid on;

ylabel('Magnitude')
xlabel('Normalized frequency')