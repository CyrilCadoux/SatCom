function [G,beamwidth] = gain_antenna(D,f,efficiency)
% [G,beamwidth] = gain_antenna(D,f,efficiency)
%G      gain in dBi
%beamwidth     delta3dB beamwidth in degree
%D      diameter of the antenna in m
%f      transmitting frequency in Hz
%efficiency     efficiency of the antenna (default value 0.55)
if(nargin == 2)
    efficiency = 0.55;
end

lambda = wavelength(f);
Gr = efficiency*(pi*D/lambda)^2;
beamwidth = rad2deg(lambda/D/sqrt(efficiency));
G = dec2dB(Gr);
end