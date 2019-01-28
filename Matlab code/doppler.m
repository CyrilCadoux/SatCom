function fd = doppler(v_vehicle,alt_sat,fc,el_angle)
    v_vehicle = 1000*v_vehicle/3600;    
    c = 3e8;
    fd = (v_vehicle)/c*fc*cosd(el_angle);
end