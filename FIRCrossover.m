% clc
%close all
%clear all
fs = 48000;
fc = 3000;
wc = fc / (fs/2);
order = 100;  % Filter length (number of taps)

% DESIGN FIR FILTERS
blp = fir1(order, wc, 'low');   % Low-pass for woofer
bhp = fir1(order, wc, 'high');  % High-pass for tweeter

 
[H_lp, f] = freqz(blp, 1, [], fs);
[H_hp, ~] = freqz(bhp, 1, [], fs);

 
figure;
semilogx(f, 20*log10(abs(H_lp)), 'b', 'LineWidth', 1.5); hold on;
semilogx(f, 20*log10(abs(H_hp)), 'r', 'LineWidth', 1.5);
xline(fc, '--k', 'Crossover at 3 kHz', 'LabelOrientation','horizontal');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Linear-Phase FIR Crossover (100 taps)');
legend('Low-pass FIR (Woofer)', 'High-pass FIR (Tweeter)');
grid on; ylim([-60 5]);
xlim([20 20000]);   