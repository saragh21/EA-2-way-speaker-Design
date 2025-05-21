fs = 48000;        % Sampling frequency
fc = 3000;         % Crossover frequency
wc = fc / (fs/2);  % Normalized cutoff

[blp, alp] = butter(2, wc, 'low');
[bhp, ahp] = butter(2, wc, 'high');

[H_lp, f] = freqz(blp, alp, [], fs);    
[H_hp, ~] = freqz(bhp, ahp, [], fs);    
 
figure;
semilogx(f, 20*log10(abs(H_lp)), 'b', 'LineWidth', 1.5); hold on;
semilogx(f, 20*log10(abs(H_hp)), 'r', 'LineWidth', 1.5);
xline(fc, '--k', 'Crossover at 3 kHz', 'LabelOrientation','horizontal');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Low-pass IIR (Woofer)', 'High-pass IIR (Tweeter)');
legend('Low-pass (Woofer)', 'High-pass (Tweeter)');
grid on; ylim([-60 5]);
xlim([20 20000]);   
 
