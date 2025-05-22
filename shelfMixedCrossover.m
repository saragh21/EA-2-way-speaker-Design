fs = 48000; fc = 3000; wc = fc/(fs/2);

%  LR2 woofer & LR4 tweeter ----
[b_lp2,a_lp2]   = butter(2, wc, 'low');
[b_hp21,a_hp21] = butter(2, wc, 'high');
[b_hp22,a_hp22] = butter(2, wc, 'high');
b_hpLR4 = conv(b_hp21, b_hp22);
a_hpLR4 = conv(a_hp21, a_hp22);

%  2nd-order low-shelf (boost at 100 Hz by +6 dB)
f0   = 100;     % Shelf corner
G    = +6;      % Gain in dB
Q    = 0.7;     % Shelf Q
A    = 10^(G/40);
w0   = 2*pi*f0/fs;
alpha= sin(w0)/(2*Q);
% Low-shelf biquad
b_shelf = A*[ (A+1)-(A-1)*cos(w0)+2*sqrt(A)*alpha, ...
              2*((A-1)-(A+1)*cos(w0)), ...
              (A+1)-(A-1)*cos(w0)-2*sqrt(A)*alpha ];
a_shelf =     [ (A+1)+(A-1)*cos(w0)+2*sqrt(A)*alpha, ...
              -2*((A-1)+(A+1)*cos(w0)), ...
               (A+1)+(A-1)*cos(w0)-2*sqrt(A)*alpha ];

%Cascade LPF + Shelf on woofer ----
b_woofer = conv(b_lp2, b_shelf);
a_woofer = conv(a_lp2, a_shelf);

 
[H_w, f]      = freqz(b_woofer, a_woofer, 2048, fs);
[H_t, ~]      = freqz(b_hpLR4, a_hpLR4,     2048, fs);

figure;
semilogx(f,20*log10(abs(H_w)),'b','LineWidth',1.5); hold on;
semilogx(f,20*log10(abs(H_t)),'r','LineWidth',1.5);
xline(fc,'--k','Crossover','LabelOrientation','horizontal');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
legend('Woofer LPF + Shelf','Tweeter LR4 HPF');
grid on; ylim([-60 15]); xlim([20 20000]);
title('LR4 + LR2 + Low-Shelf Crossover');
