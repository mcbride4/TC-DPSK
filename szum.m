function [ y ] = szum( snr, x)


ebn0 = 10^(snr/10);
eb = sum(x.^2)/(length(x));
n0=eb/ebn0;
pn = n0*(100)/2;
n = sqrt(pn)*randn(1,length(x));
y=x+n;

end

