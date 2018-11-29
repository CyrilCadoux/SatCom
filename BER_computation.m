
%% BER computation in function of Eb_N0

Eb_N0 = 8;%db
Eb_N0_dec = 10^(Eb_N0/10);

fprintf('\n\n===== WITH Eb/N0 = %.2f dB =====\n\n', Eb_N0);

fprintf('AWGN BPSK and DPSK, Pb = %d \n\n', 0.5*exp(-Eb_N0_dec));
fprintf('AWGN BFSK, Pb = %d \n\n', 0.5*exp(-0.5*Eb_N0_dec));


fprintf('Rayleigh BPSK, Pb = %d \n\n', 0.5*(1-sqrt(Eb_N0_dec/(1 + Eb_N0_dec))));
fprintf('Rayleigh DPSK, Pb = %d \n\n', 1/(2+2*Eb_N0_dec));
fprintf('Rayleigh BFSK, Pb = %d \n\n',1/(2+Eb_N0_dec));


%% Eb_N0 in function of BER
Pb = 1e-6;

fprintf('\n\n===== WITH Pb = %d =====\n\n', Pb);

a = -log(2*Pb);
b = dec_to_db(a);
fprintf('AWGN BPSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = -2*log(2*Pb);
b = dec_to_db(a);
fprintf('AWGN BFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);


inter = (1-2*Pb)^2;
a = inter/(1-inter);
b = dec_to_db(a);
fprintf('Rayleigh BPSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = (1-2*Pb)/(2*Pb);
b = dec_to_db(a);
fprintf('Rayleigh DFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = (1-2*Pb)/(Pb);
b = dec_to_db(a);
fprintf('Rayleigh BFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);


%% CODED : EB_N0 in function of BER

Pb = 1e-6;
r = 0.5;

% One term approximation for D:
D = power(Pb/18,0.1);
fprintf("\n=======================\n")
fprintf("\nThe 1 term approximation:\nD = %.4f\n\n", D );


% Soft AWGN
Ec_N0 = -log(D);
fprintf("AWGN BPSK soft decision :\n");
fprintf("\tEc_N0 = %.2f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.2f [lin]\n", Ec_N0/r);
fprintf("\tEb_N0 = %.1f [db]\n", dec_to_db(Ec_N0/r));



% Soft Rayleigh

% Solve the equation D = 4*eps*(1-eps) <=> -4*eps^2 + 4*eps - D = 0
% (take the closest root to 0)
delta = 4*4 - 4*(-4)*(-D);
eps = (-4 + sqrt(delta)) / (-8);

inter = (1-2*eps)^2;
a = inter/(1-inter);
b = dec_to_db(a);

fprintf("\nRAYLEIGH BPSK soft decision:\n");
fprintf("\teps = %.3f\n", eps);

fprintf("\tEc_N0 = %.3f [lin]\n", a);
fprintf("\tEb_N0 = %.3f [lin]\n", a/r);
fprintf("\tEb_N0 = %.1f [dB]\n", dec_to_db(a/r));














