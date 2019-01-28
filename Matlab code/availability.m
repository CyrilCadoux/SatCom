function a = availability(margin_db)
    margin = dB2dec(margin_db);
    exponent = 1/margin;
    a = exp(-exponent);
end