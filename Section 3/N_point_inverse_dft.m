% Inverse DFT function
function [x_n]=infft(x_k,N)
len = length(x_k);
if N>len
    x_k = [x_k zeros(1,N)];
elseif N<len
    x_k = x_k(1:N);
end
for k = 1:N
    x_n(k) = 0;
    for n = 1:N
        x_n(k) = x_n(k) + x_k(n).*exp((1j).*2.*pi.*(n-1).*(k-1)/N);
    end
    x_n(k) = x_n(k)/N;
end
end