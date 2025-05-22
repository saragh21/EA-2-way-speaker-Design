fs = 48000;         % Sampling frequency
fc = 3000;          % Crossover frequency
wc = fc/(fs/2);     % Normalized cutoff

% 3rd-order low-pass & high-pass
[b_lp3,a_lp3] = butter(3, wc, 'low');
[b_hp3,a_hp3] = butter(3, wc, 'high');

% Frequency responses
[H_lp3, f] = freqz(b_lp3, a_lp3, 2048, fs);
[H_hp3, ~]  = freqz(b_hp3, a_hp3, 2048, fs);

% Plot
figure; 
semilogx(f, 20*log10(abs(H_lp3)), 'b','LineWidth',1.5); hold on;
semilogx(f, 20*log10(abs(H_hp3)), 'r','LineWidth',1.5);
xline(fc,'--k','Crossover','LabelOrientation','horizontal');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
legend('3rd-order LPF (Woofer)','3rd-order HPF (Tweeter)');
grid on; ylim([-60 5]); xlim([20 20000]);
title('3^{rd}-Order Butterworth Crossover');
