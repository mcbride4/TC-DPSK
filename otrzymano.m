function [ wiadomosc ] = otrzymano( dem )

if (getappdata(0,'bin_tekst')~=1)
    a = reshape(dem, [], 7);
    b = bi2de(a);
    x = char(b);
    wiadomosc = x';
else
    wiadomosc = num2str(dem);
end
end

