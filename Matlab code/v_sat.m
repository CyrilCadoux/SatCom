function v = v_sat(alt_km)
    mu_earth = 3.986e14;
    r = 6371 + alt_km;
    v = sqrt(mu_earth/(r*1000));
end