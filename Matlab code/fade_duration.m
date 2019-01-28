function Td =  fade_duration(rho_db,fd)
    rho = 1/dB2dec(rho_db);
    Td = (exp(rho^2)-1)/sqrt(2*pi)/rho/fd;
end