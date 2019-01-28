%linear operation with back off

%general
alt = 36000; %GEO
el_angle = 30;

range = sat_range(alt,el_angle);

fup = 6e9;
fdw = 4e9;
Nb_channel = 5;
rate = Nb_channel*128e3;

req_Eb_No = 9.3;

%uplink

%4. eirp
%eirp = [];
eirp = [3.5,175];
eirp_given = false;

if(eirp_given)
    Ter_EIRP = eirp(1);
else
    Ter_EIRP = gain_antenna(eirp(1),fup) + dec2dB(eirp(2));
end

%5.free path loss
Lp = free_path_loss(fup,range);

%6. uplink loss
up_loss = 0;

%7. gain_1_m^2
G_1m2 = dec2dB(4*pi/(wavelength(fup)^2));

%8. OFD
ofd = Ter_EIRP + Lp -up_loss + G_1m2;

%9.SFD 
sfd = -90;

%10. IBO si IBO est zero on op�re � saturation
ibo = sfd -ofd;
disp('ibo')
ibo

%11. Spacecraft G/T
g_t = [9.1]; %G/T
%g_t = [2,300]; %gr T
GT_given = true;

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
C_No = C_T-k

% Downlink

%15. saturated EIRP
eirp = [53.16];
%eirp = [2,100];
eirp_given = true;

if(eirp_given)
    Sat_EIRP = eirp(1);
else
    Sat_EIRP = gain_antenna(eirp(1),fdw) + dec2dB(eirp(2));
end

%16. OBO
obo = 2.5; %estimation from graph

%17. free path loss
Lp = free_path_loss(fdw,range);

%18. Downlink loss
dw_loss = 12;

%19. Earth G/T
%g_t = []; G/T
g_t = [0.42,385]; %gr T
GT_given = false;

if(GT_given)
    e_GT = g_t(1);
else
    e_GT = gain_antenna(g_t(1),fdw) - dec2dB(g_t(2));
end 

%20. C/T thermal
CT = Sat_EIRP -obo + Lp + e_GT;

%21. boltzmann constant

%22. C/No 
C_No = CT -k;

%23. S/N
S_N = C_No - dec2dB(rate) - dw_loss - req_Eb_No

if(S_N > 0)
    disp('closed link')
else
    disp('the link is not closed')
end
