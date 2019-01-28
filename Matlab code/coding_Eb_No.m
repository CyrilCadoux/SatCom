%exo 7

%% BPSK AWGN soft 
Pb = 1e-6;
rate = 0.5;

D = compute_D(Pb);
Ec_No = -log(D);

Eb_No = dec2dB(Ec_No/rate)

%% BPSK rayleigh soft

Pb = 1e-6
rate = 0.5

D= compute_D(Pb);
Ec_No = 1/D - 1;

Eb_No = dec2dB(Ec_No/rate)
