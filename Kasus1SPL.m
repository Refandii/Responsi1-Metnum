% Kasus 1: Galat dan Error Pemotongan
clc; clear; close all;

t = 0:0.01:5;
lam = 12; v = 36; x = 10; h0 = 5;
y = (t * v) / lam; % Argumen y = 3t

% Menghitung nilai eksak
h_exact = h0 * (cos(y) + exp(x));

% Inisialisasi array pendekatan
h_23 = zeros(size(t)); h_24 = zeros(size(t)); h_25 = zeros(size(t));

% Loop perhitungan deret Taylor/Maclaurin untuk menghindari overflow
for i = 1:length(t)
    cos_val_23 = 0; exp_val_23 = 0;
    cos_val_24 = 0; exp_val_24 = 0;
    cos_val_25 = 0; exp_val_25 = 0;

    % Iterasi n = 23
    for k = 0:22
        cos_val_23 = cos_val_23 + ((-1)^k * y(i)^(2*k)) / factorial(2*k);
        exp_val_23 = exp_val_23 + (x^k) / factorial(k);
    end
    h_23(i) = h0 * (cos_val_23 + exp_val_23);

    % Iterasi n = 24
    for k = 0:23
        cos_val_24 = cos_val_24 + ((-1)^k * y(i)^(2*k)) / factorial(2*k);
        exp_val_24 = exp_val_24 + (x^k) / factorial(k);
    end
    h_24(i) = h0 * (cos_val_24 + exp_val_24);

    % Iterasi n = 25
    for k = 0:24
        cos_val_25 = cos_val_25 + ((-1)^k * y(i)^(2*k)) / factorial(2*k);
        exp_val_25 = exp_val_25 + (x^k) / factorial(k);
    end
    h_25(i) = h0 * (cos_val_25 + exp_val_25);
end

% Evaluasi Error Rata-Rata Mutlak
err_23 = mean(abs(h_exact - h_23));
err_24 = mean(abs(h_exact - h_24));
err_25 = mean(abs(h_exact - h_25));

% Persentase galat terhadap rata-rata tinggi eksak
rata_eksak = mean(abs(h_exact));
fprintf('Persentase Error (n=23): %.4f%%\n', (err_23 / rata_eksak) * 100);
fprintf('Persentase Error (n=24): %.4f%%\n', (err_24 / rata_eksak) * 100);
fprintf('Persentase Error (n=25): %.4f%%\n', (err_25 / rata_eksak) * 100);

% Visualisasi Grafik
figure;
plot(t, h_exact, 'k', 'LineWidth', 3); hold on;
plot(t, h_23, 'b--'); plot(t, h_24, 'r-.'); plot(t, h_25, 'g:');
title('Perbandingan Eksak dan Pendekatan Gelombang');
xlabel('Waktu (t)'); ylabel('Ketinggian (h)');
legend('Eksak', 'Pendekatan n=23', 'Pendekatan n=24', 'Pendekatan n=25');
grid on;
