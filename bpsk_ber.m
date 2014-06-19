function [ dem ] = bpsk_ber( snr, m )

Tb = 100;
t = 1/Tb:1/Tb:1;
Eb = 14;
A = sqrt(Eb./1); % sqrt (Eb / Tb), gdzie Tb to czas trwania bitu, u nas Tb = t = 1
f0 = 2;
w0 = 2*pi*f0;

lm = length(m); %%% ilosc bitow wiadomosci
for i=1:lm
   if ( m(i) == 0 )
        m(i) = -1;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% nosna
c = A.*cos(w0.*t); %carrier - nosna


%%%%%%%%%%%%%%%%%%%% modulacja
mod = [];
for i=1:lm
b = c*m(i);
mod = [mod b];
end



mod_szum = szum(snr, mod);   %%dodanie AWGN 


%%%%%%%%%%%%% demodulator

for i=1:lm
    tmp = mod_szum((i-1)*Tb+1:i*Tb);
    for j=1:Tb
        tmp(j) = tmp(j)*c(j);
    end
    temp(i) = trapz(t,tmp);
    
    if (temp(i) < 0)
        dem(i) = -1;
    else
        dem(i) = 1;
    end
    
end



for i=1:lm
    if (dem(i) == -1)
        dem(i) = 0;
    end




end

