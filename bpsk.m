function [ dem ] = bpsk( m )
% m - wiadomosc do przeslania
% t - czas trwania 1 bitu
% A - amplituda sygnalu
% f0 - czestotliwosc nosnej
% lm - ilosc bitow do przeslania
% c - nosna
% mod - sygnal zmodulowany
% dem - syngal zdemodulowany
% tmp, temp - zmienne tymczasowe
% x - czas trwania wiadomosci
% Tb - na tyle dzielimy 1 bit 




Tb = 100;
t = 1/Tb:1/Tb:1;
Eb = 14;
A = sqrt(Eb./1); % sqrt (Eb / Tb), gdzie Tb to czas trwania bitu, u nas Tb = t = 1
f0 = 2;
w0 = 2*pi*f0;

setappdata(0,'m',m);
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

%%%%%%%%%%%%% demodulator
for i=1:lm
    tmp = mod((i-1)*Tb+1:i*Tb);
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
%%%%%%%%%%%%%%%%%%%%%%%%%%% subplot 1 - nosna

% subplot(4,1,1);
% plot(t,c);
% title('nosna');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 subplot 2 - msg
% subplot(4,1,2);
% hold on;
% stairs(0:lm-1,m);
% plot(lm-1:0.001:lm,m(lm), 'b-');
% axis([0 lm -1.5 1.5]);
% title('sygnal wejsciowy');
% hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55 subplot 3 - sygnal zmodolony
% subplot(4,1,3);
% x=1/Tb:1/Tb:lm;
% plot(x,mod);
% title('sygnal zmodulowany');





%%%%%%%%%%%%%%%%%%%% subplot 4 - sygnal zdemodolony
% %subplot(4,1,4);
% hold on;
% stairs(0:lm-1,dem);
% plot(lm-1:0.001:lm,dem(lm), 'b-');
% axis([0 lm -1.5 1.5]);
% title('sygnal zdemodulowany');
% hold off;

for i=1:lm
    if (dem(i) == -1)
        dem(i) = 0;
    end
end
setappdata(0,'t',t);
setappdata(0,'c',c);
setappdata(0,'lm',lm);

setappdata(0,'Tb',Tb);
setappdata(0,'mod',mod);
setappdata(0,'dem',dem);
end

