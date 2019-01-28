
%% BER computation in function of Eb_N0

Eb_N0 = 26;%db
Eb_N0_dec = 10^(Eb_N0/10);

fprintf('\n\n===== WITH Eb/N0 = %.2f dB =====\n\n', Eb_N0);
fprintf('AWGN BPSK and DPSK, Pb = %d \n\n', 0.5*exp(-Eb_N0_dec));
fprintf('AWGN BFSK, Pb = %d \n\n', 0.5*exp(-0.5*Eb_N0_dec));


fprintf('Rayleigh BPSK, Pb = %d \n\n', 0.5*(1-sqrt(Eb_N0_dec/(1 + Eb_N0_dec))));
fprintf('Rayleigh DPSK, Pb = %d \n\n', 1/(2+2*Eb_N0_dec));
fprintf('Rayleigh BFSK, Pb = %d \n\n',1/(2+Eb_N0_dec));


%% Eb_N0 in function of BER
Pb = 1e-6;

fprintf('\n\n===== WITH Pb = %.1d =====\n\n', Pb);

a = -log(2*Pb);
b = dec2dB(a);
fprintf('AWGN BPSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = -2*log(2*Pb);
b = dec2dB(a);
fprintf('AWGN BFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);


inter = (1-2*Pb)^2;
a = inter/(1-inter);
b = dec2dB(a);
fprintf('Rayleigh BPSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = (1-2*Pb)/(2*Pb);
b = dec2dB(a);
fprintf('Rayleigh DFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

a = (1-2*Pb)/(Pb);
b = dec2dB(a);
fprintf('Rayleigh BFSK,\nEb_N0 = %.3f [lin]\nEb_N0 = %.3f [db]\n\n', a, b);

