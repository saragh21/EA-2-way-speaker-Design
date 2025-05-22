fs = 48000; fc = 3000; wc = fc/(fs/2);

% LR2 woofer: one 2nd-order low-pass
[b_lp2,a_lp2] = butter(2, wc, 'low');

% LR4 tweeter: cascade two 2nd-order high-passes
[b_hp21,a_hp21] = butter(2, wc, 'high');
[b_hp22,a_hp22] = butter(2, wc, 'high');
b_hpLR4 = conv(b_hp21, b_hp22);
a_hpLR4 = conv(a_hp21, a_hp22);

% Frequency responses
[H_lp2, f]   = freqz(b_lp2,   a_lp2,   2048, fs);
[H_hpLR4, ~] = freqz(b_hpLR4, a_hpLR4, 2048, fs);

% Plot
figure;
semilogx(f,20*log10(abs(H_lp2)),'b','LineWidth',1.5); hold on;
semilogx(f,20*log10(abs(H_hpLR4)),'r','LineWidth',1.5);
xline(fc,'--k','Crossover','LabelOrientation','horizontal');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
legend('LR2 LPF (Woofer)','LR4 HPF (Tweeter)');
grid on; ylim([-60 5]); xlim([20 20000]);
title('Linkwitz–Riley Crossover (4^{th}-order HPF + 2^{nd}-order LPF)');
