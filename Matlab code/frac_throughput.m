function T = frac_throughput(OH,Pe,W,I,C,MTU)
    under = (1 + 2*C*I/MTU);
    frac = W/under;
    if(frac > 1)
        frac = 1;
        disp(['W has been reduced to ',under])
    end
    T = (1-OH)*(1-Pe)*frac;
end