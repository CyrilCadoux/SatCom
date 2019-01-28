function D = get_D_from_gain(G,fc,efficiency)
    lambda = wavelength(fc);
    D = lambda/pi * sqrt(10^(G/10)/efficiency);
end