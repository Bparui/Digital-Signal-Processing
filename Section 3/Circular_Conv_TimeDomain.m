function [y_n] = circ_conv(x_n,h_n)
N = max(length(x_n),length(h_n));  %length of convolved signal required
x_n = [x_n zeros(1,N-length(x_n))];
h_n = [h_n zeros(1,N-length(h_n))];
y_n = zeros(1,N);
    for n=1:N
        for i=1:N
            j=n-i+1;
            if(j<=0)
                j=N+j;
            end
            y_n(n)=y_n(n)+(x_n(i)*h_n(j));
        end
    end
end