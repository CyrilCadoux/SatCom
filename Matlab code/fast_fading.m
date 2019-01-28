function fast_fading(fd,sps)
    To = 1/fd
    Ts = 1/sps
    
    if(To  < Ts)
        disp('fast fading')
    else
        disp('slow fading')
    end
end