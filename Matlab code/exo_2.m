%exo 2

%general 

fup = 2e9;
range = 40000;
rate = dec2dB(1e6);

%uplink

%4. eirp
%eirp = [];
eirp = [0.5,1000];
eirp_given = false;

if(eirp_given)
    Ter_EIRP = eirp(1);
else
    Ter_EIRP = gain_antenna(eirp(1),fup) + dec2dB(eirp(2))
end

%5.free path loss
Lp = free_path_loss(fup,range);

%6. uplink loss
up_loss = 12;

%4 next will be use for the dw link
% %7. gain_1_m^2
% G_1m2 = dec2dB(4*pi/(wavelength(fup)^2));
% 
% %8. OFD
% ofd = Ter_EIRP + Lp -up_loss + G_1m2;
% 
% %9.SFD 
% sfd = -110;
% 
% %10. IBO
% ibo = sfd -ofd;

%11. Spacecraft G/T
%g_t = []; G/T
g_t = [1,500]; %gr T
GT_given = false;

if(GT_given)
    sat_GT = g_t(1);
else
    sat_GT = gain_antenna(g_t(1),fup) - dec2dB(g_t(2));
end

%12. C/T thermal
C_T = Ter_EIRP + Lp - up_loss + sat_GT;

%13. Boltzmann
k = -228.6;

%14. C/No
disp('up link')
C_No = C_T-k-rate

req_C_No = 10;
margin  = C_No - req_C_No;