r = 0:0.1:10;
std_dev = [0.5,1,2,3,4];
figure;
for std= std_dev
    sig = r/std^2.*exp(-r.^2/(2*std^2));
    plot(r,sig);
    hold on
end
legend('0.5','1','2','3','4')