function [ m ] = wpisz_recznie( s )
length(unique(s));
m = [];
if (length(unique(s))~=2)
x = double(s);
%x = base2dec(s,10);
b = de2bi(x);
m = reshape(b,1,[]);
setappdata(0,'bin_tekst',0);
else
    setappdata(0,'bin_tekst',1);        %%%%%%%%%%%%%% bin_tekst = 1 wiec wiem ze podaje wiadomosc zerojedynkowa
    for i=1:length(s)
        m(i) = str2num(s(i));
    end
end


end

