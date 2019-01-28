function R = sat_range(alt,elevation,unit)
%R = sat_range(alt,elevation,unit)
%compute the range R between the GS and the satellite
%alt is the altitude in km of the satellite (not taking in account radius of
%earth) 
%elevation is the elevation angle in degrees
%unit if true return value in km, else return in m (default value km)

if(nargin < 2)
    error('not enough argument')
end
if(nargin == 2)
    unit = true;
end
re = 6371;%km
tot_alt = alt+re;
alpha = law_sine(re,tot_alt,90+elevation);

R = sqrt(tot_alt^2 + re^2 -2*tot_alt*re*cosd(90-elevation-alpha));
if(~unit)
    R = R*1000;
end

end