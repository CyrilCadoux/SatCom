function D = compute_D(Pb)
    D = roots([1404,0,211,0,36,zeros(1,9),-2*Pb]);
    D = D(imag(D)==0);
    D=D(D>0);
end