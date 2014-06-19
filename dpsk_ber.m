function [ dem ] = dpsk_ber( snr, m )

Tb = 100;
t = 1/Tb:1/Tb:1;
Eb = 14;
A = sqrt(Eb./1); % sqrt (Eb / Tb), gdzie Tb to czas trwania bitu, u nas Tb = t =1
f0 = 2;
w0 = 2*pi*f0;



lm = length(m); %%% ilosc bitow wiadomosci
for i=1:lm
   if ( m(i) == 0 )
        m(i) = -1;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% nosna
csin = -A.*cos(w0.*t);
ccos = A.*cos(w0.*t);
c = ccos; %carrier - nosna


%%%%%%%%%%%%%%%%%%%% modulacja
mod = [];

for i=1:lm
    if(m(i) == 1)
        if ( c == ccos)
            c = csin;
        else
            c = ccos;
        end
        
        mod = [mod c];
        
    else
        if ( c == ccos)
            c = ccos;
        else
            c = csin;
        end
        
        mod = [mod c];
                
    end
end



mod_szum = szum(snr,mod);


%%%%%%%%%%%%% demodulator
%%%%%% pierwszy bit
tmp = mod_szum(1:Tb);
temp(1) = trapz(t,tmp);
if (temp(1) > 0)
    dem(1) = 1;
else
    dem(1) = -1;
end
    
%%%%%%%%%%% reszta bitow
for i=1:lm-1
    tmp = mod_szum((i-1)*Tb+1:i*Tb);
    tmp2 = mod_szum((i)*Tb+1:(i+1)*Tb);
    for j=1:Tb
        tmp(j) = tmp(j)*c(j);
    end
    for j=1:Tb
        tmp2(j) = tmp2(j)*c(j);
    end
    temp(i+1) = trapz(t,tmp);    
    temp2(i+1) = trapz(t,tmp2);
    
    if (temp(i+1) > 0 )
        if (temp2(i+1)> 0)
            dem(i+1) = -1;
        else
            dem(i+1) = 1;
        end
    
    else
        if (temp2(i+1) > 0)
            dem(i+1) = 1;
        else
            dem(i+1) = -1;
        end
    end
    
end




for i=1:lm
    if (dem(i) == -1)
        dem(i) = 0;
    end
end


end

