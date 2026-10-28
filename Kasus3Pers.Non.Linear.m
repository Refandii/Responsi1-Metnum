% Kasus 3: Pencarian Jari-jari dengan Persamaan Non Linier
clc; clear; close all;

% Definisi fungsi non-linear: f(r) = (4/3)*pi*r^3 - 300
f = @(r) (4/3) * pi * r.^3 - 300;

% Bagian 1: Metode Grafik untuk rentang nilai awal
r_val = 0:0.1:6;
y_val = f(r_val);
figure;
plot(r_val, y_val, 'b-', 'LineWidth', 2); hold on;
yline(0, 'r--', 'LineWidth', 1.5);
title('Metode Grafik: Menentukan Tebakan Awal Jari-jari (r)');
xlabel('Jari-jari (r) cm'); ylabel('f(r)');
grid on;

% Bagian 2: Evaluasi Akar dengan Metode Biseksi di rentang [3, 5]
a = 3; b = 5;
tol = 1e-5; max_iter = 100;

for iter = 1:max_iter
    c = (a + b) / 2;
    % Hentikan jika nilai f(c) sangat kecil atau toleransi tercapai
    if abs(f(c)) < tol || (b - a)/2 < tol
        break;
    end
    % Perbarui interval
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

fprintf('Akar pendekatan (Jari-jari) ditemukan pada = %.4f cm\n', c);
