function [rms,fo] = delay_spread(P,T)
    if(length(P) ~= length(T))
        error('Proba and Times should be of the same length')
    end
    
    tau_bar = sum(P.*T)/sum(P);
    tau_bar_sq = sum(P.*T.^2)/sum(P);
    
    rms = sqrt(tau_bar_sq - tau_bar^2);
    fo = 1/rms;
    
end