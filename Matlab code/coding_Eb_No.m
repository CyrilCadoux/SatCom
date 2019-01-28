%exo 7

%% BPSK AWGN soft 
Pb = 1e-6;
rate = 0.5;

D = compute_D(Pb);
Ec_No = -log(D);

Eb_No = dec2dB(Ec_No/rate)

%% BPSK AWGN hard
Pb = 1e-6;
rate = 0.5;

D = compute_D(Pb);

eps = roots([4,-4,D^2]);
eps = eps(eps < mean(eps));

Ec_No = -log(2*eps)

Eb_No = dec2dB(Ec_No/rate)

%% BPSK rayleigh soft

Pb = 1e-6
rate = 0.5

D= compute_D(Pb);
Ec_No = 1/D - 1;

Eb_No = dec2dB(Ec_No/rate)

%% BPSK rayleigh hard
Pb = 1e-6;
rate = 0.5;

D = compute_D(Pb);

eps = roots([4,-4,D^2]);
eps = eps(eps < mean(eps));

Ec_No = (1-4*eps + 4*eps.^2)./(4*eps-4*eps.^2)

Eb_No = dec2dB(Ec_No/rate)

