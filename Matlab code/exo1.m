% exercice 1
re =6371;
%% 1.1

%% 1.2
%Geo alt => alt = 35787
alt = 36000; %km
R_0 = sat_range(alt,0)
R_30 = sat_range(alt,30)

%% 1.3
alpha = law_sine(re,alt+re,120);

area = small_spot_beam(R_30,alpha)