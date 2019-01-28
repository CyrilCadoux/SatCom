function e = EIRP(P,G)
%e = EIRP(P,G)
%e      EIRP in DB
%P      transmitted power in dB
%G      Gain in dBi

e = P + G;
end