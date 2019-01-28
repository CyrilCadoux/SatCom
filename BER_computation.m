
%% BER computation in function of Eb_N0

Eb_N0 = 14;%db
Eb_N0_lin = 10^(Eb_N0/10);

fprintf('\n\n\n\n\n===== WITH Eb/N0 = %.2f dB =====\n', Eb_N0);

fprintf('\n-------------------\n')
fprintf('AWGN BPSK and QPSK, Pb = %d \n\n', 0.5*exp(-Eb_N0_lin));
fprintf('AWGN BFSK, Pb = %d \n', 0.5*exp(-0.5*Eb_N0_lin));

fprintf('-------------------\n')
fprintf('Rayleigh BPSK, Pb = %d \n\n', 0.5*(1-sqrt(Eb_N0_lin/(1 + Eb_N0_lin))));
fprintf('Rayleigh QPSK, Pb = %d \n\n', 1/(2+2*Eb_N0_lin));
fprintf('Rayleigh BFSK, Pb = %d \n\n',1/(2+Eb_N0_lin));


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
fprintf('Rayleigh QPSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = (1-2*Pb)/(Pb);
b = dec_to_db(a);
fprintf('Rayleigh BFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);


%% CODED : EB_N0 in function of BER

fprintf("\n\n\n\n\n\n\n\n\n\n\n\n=======================\n")

Pb = 1e-6;
fprintf("Pb = %.2d\n", Pb);


% We need 2 coded bits to transmit 1 bit of pure information
% => Hence Eb will correspond to 2Ec = Ec/0.5
r = 0.5;
fprintf("coding rate (#InputBits / #OutputBits) = %.2f\n", r);


% k = nb of bits per symbol, 
% k=1 for BPSK, k=2 for QPSK...

% The formulas for Ec given below never take into consideration the number
% of bits per symbol ! In other words, they always give the EC considering BPSK.
% In theory (and for a 'general' modulation scheme), we should indeed 
% divide Ec by 'k'. But as we consider only BPSK, QPSK and BFSK, and as
% QPSK can be modeled as BPSK, 'k' is always considered to be 1 (cf homework 3)


% One term approximation for D (Ok when BER is not that small)
% For higer approximation, use the function in the python nb
% D = power(Pb/18,0.1);

D = 0.184;
fprintf("\nThe x-term approximation:\nD = %.4f\n", D );


fprintf("\n\n------- SOFT PART -------\n\n");

% Soft AWGN
Ec_N0 = -log(D);
fprintf("AWGN BPSK soft decision :\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r);
fprintf("\tEb_N0 = %.2f [db]\n", dec_to_db(Ec_N0/r));

% Soft Rayleigh
Ec_N0 = (1-D)/D;
fprintf("\nRAYLEIGH BPSK soft decision:\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r);
fprintf("\tEb_N0 = %.2f [dB]\n", dec_to_db(Ec_N0/r));


% -------- Now for hard decisions : ---------
delta = (16-4*4*D*D);
hard_eps = (-4 + sqrt(delta)) / (-8);
fprintf("\n\n------- HARD PART -------\n");
fprintf("hard eps = %f\n\n", hard_eps);

% Hard AWGN
Ec_N0 = -log(2*hard_eps);
fprintf("AWGN BPSK hard decision :\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r);
fprintf("\tEb_N0 = %.2f [db]\n", dec_to_db(Ec_N0/r));

% Hard Rayleigh
temp = (1-2*hard_eps)^2;
Ec_N0 = temp/(1-temp);
fprintf("\nRAYLEIGH BPSK hard decision:\n");
fprintf("\tEc_N0 = %.3f [lin]\n", Ec_N0);
fprintf("\tEb_N0 = %.3f [lin]\n", Ec_N0/r);
fprintf("\tEb_N0 = %.2f [dB]\n", dec_to_db(Ec_N0/r));








