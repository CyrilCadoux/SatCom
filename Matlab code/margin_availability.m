function m_dB =  margin_availability(avail)
    p1_margin =-log(avail);
    margin = 1/p1_margin;
    m_dB = dec2dB(margin);
end