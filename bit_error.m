function [ te ] = bit_error( m, dem )


err=m-dem;
te=sum(abs(err));

end

