function [Lp_dB,Lp] = free_path_loss(f,range)
%[Lp_dB,Lp] = free_path_loss(f,range)
%Lp s the free path loss the signal experience
%Lp_dB is given in dB
%f is the frequency in Hz
%range is the range in km
    lambda = wavelength(f);
    Lp = (lambda/4/pi/(range*1000))^2;
    Lp_dB = dec2dB(Lp);
end