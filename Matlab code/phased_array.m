function phased_array(fc,el_angle,Pt_dec,EIRP,alt,efficiency)
    
    if(nargin == 5)
        efficiency = 0.55;
    end
    
    alpha_deg = law_sine(6371,alt+6371,90+el_angle);
    
    FOV_3dB = 2*deg2rad(alpha_deg);
    
    G = EIRP - dec2dB(Pt_dec);
    
    D = get_D_from_gain(G,fc,efficiency)
    
    d = wavelength(fc)/FOV_3dB/sqrt(efficiency)
    
    Nd = ceil(D/d)
    
    Ne = (3*Nd^2+1)/4
    
    NeGd = dB2dec(G);
    
    Gd = dec2dB(NeGd/Ne)
    

end