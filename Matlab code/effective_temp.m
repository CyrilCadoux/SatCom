function [Pn,Teff] = effective_temp(Ts,Gains,band)
%doc

if(length(Ts) ~= length(Gains))
    error('Ts and Gains should have the same length')
end

k = 1.38065e-23; %J/K
gains = dB2dec(Gains);

Teff = sum(Ts./mulGain(gains));
Pn = prod(gains)*k*Teff*band;
function m = mulGain(G)
    m= ones(size(G));
    for l = 1:length(G)-1
        m(l+1:end) = m(l+1:end)*G(l);
    end
end

end