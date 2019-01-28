%% SRQ 

Pb = 0.0001; %to change
PDU = 1024*8; %bits

Pc = (1-Pb)^PDU
Pe = 1-Pc

L = ceil(1/Pc)
efficiency = 1/L