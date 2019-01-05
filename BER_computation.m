
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
Pb = 1e-8;

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

Pb = 1e-8;

% We need 2 coded bits to transmit 1 bit of pure information
% => Hence Eb will correspond to 2Ec = Ec/0.5
r = 0.5;

% k = nb of bits per symbol, 
% k=1 for BPSK, k=2 for QPSK...

% The formulas for Ec never take into consideration the number of bits per
% symbol ! In other words, they always give the EC considering BPSK.
% So if we have more than 1 bit per symbol, we need to divide this EC by 
% the number of bits per symbol k
% BPSK (we can approximate )
k = 1;


% One term approximation for D
% For higer approximation, use the function in the python nb
D = power(Pb/18,0.1);
fprintf("\n\n\n\n=======================\n")
fprintf("\nThe 1 term approximation:\nD = %.4f\n", D );


fprintf("\n\n------- SOFT PART -------\n\n");

% Soft AWGN
Ec_N0 = -log(D);
fprintf("AWGN BPSK soft decision :\n");
fprintf("\tEc_N0 = %.2f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.2f [lin]\n", Ec_N0/k/r);
fprintf("\tEb_N0 = %.1f [db]\n", dec_to_db(Ec_N0/r/k));

% Soft Rayleigh
Ec_N0 = (1-D)/D;
fprintf("\nRAYLEIGH BPSK soft decision:\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r/k);
fprintf("\tEb_N0 = %.1f [dB]\n", dec_to_db(Ec_N0/r/k));


% -------- Now for hard decisions : ---------
delta = (16-4*4*D*D);
hard_eps = (-4 + sqrt(delta)) / (-8);
fprintf("\n\n------- HARD PART -------\n");
fprintf("hard eps = %f\n\n", hard_eps);

% Hard AWGN
Ec_N0 = -log(2*hard_eps);
fprintf("AWGN BPSK hard decision :\n");
fprintf("\tEc_N0 = %.2f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.2f [lin]\n", Ec_N0/r/k);
fprintf("\tEb_N0 = %.1f [db]\n", dec_to_db(Ec_N0/r/k));

% Hard Rayleigh
temp = (1-2*hard_eps)^2;
Ec_N0 = temp/(1-temp);
fprintf("\nRAYLEIGH BPSK hard decision:\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r/k);
fprintf("\tEb_N0 = %.1f [dB]\n", dec_to_db(Ec_N0/k/r));








