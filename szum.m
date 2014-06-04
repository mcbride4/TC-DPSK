function [ y ] = szum( snr, x, f0)


ebn0 = 10^(snr/10);
eb = sum(x.^2)/(length(x)*0.01);
n0=eb/ebn0;
pn = n0*(f0)/2;
n = sqrt(pn)*randn(1,length(x));
y=x+n;

end

