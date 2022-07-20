% Code for BPF function calculation

%Given 
whs= 0.9*pi;
wls = 0.1*pi;
whp = 0.6*pi;
wlp = 0.4*pi;
As = -18;
Ap = -3;

%Doing prewarping to get ohmega values(analog freq)
osl = tan(wls/2);
opl = tan(wlp/2);
opu = tan(whp/2);
ou = tan(whs/2);

%For prototype LPF specs
o_pass= 1;
o_stop = (osu^2-opl*opu)/(osu*(opu-opl));

%Finding N = order
N = ceil((log10((10^(-As/10)-1)/(10^(-Ap/10)-1))/(2*log10(o_stop/o_pass)));

%According to this
s0 = -1;

%omega c
ohm_c = o_stop/(0^(-As/10)-1)^0.5;

%frequencies cutoff
B = opu - opl;
omega_o = (opu*opl)^0.5;
B = 0.5*((ohm_c*B)^2 + 4*omg_o^2)^0.5;
A = ohm_c*B*0.5;
omega_c1 = -A+B;
omega_c2 = A+B;

s = -1
%getting H_s
s_fin = (s^2 + omega_o^2)/ s(omega_c1 - omega_c2)
H_s = 1/s_fin +1
% Solving H_s 
coeff_num = [0.77587, 0, -0.77587]/.(2.77587)
coeff_den = [2.77587,0,1.22413]/.(2.77587)

freqz(coeff_num , coeff_den)

t = [0:0.05:2*pi]
x = sin(t);
Y = filter(coeff_num,coeff_den,x)
