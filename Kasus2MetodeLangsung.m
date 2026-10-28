% Kasus 2: Perhitungan Harga dengan SPL Metode Langsung
clc; clear;

% Matriks Koefisien (semua satuan disamakan menjadi Kilogram (kg))
% Format Urutan Bahan: [Beras, Telur, Tepung, Ayam]
% Adel:  2.5  1.5  5    0.5  = 161000
% Briza: 4    0.75 1    2    = 149000  (40 hg = 4kg)
% Caca:  2    1.5  0.5  6    = 251500  (50 dag = 0.5kg)
% Dinda: 1    4.25 2    0.9  = 173000  (4250 g = 4.25kg)

A = [2.5, 1.5, 5.0, 0.5;
     4.0, 0.75, 1.0, 2.0;
     2.0, 1.5, 0.5, 6.0;
     1.0, 4.25, 2.0, 0.9];

B = [161000; 149000; 251500; 173000];

% Penyelesaian matriks menggunakan metode analitik langsung (Left-Matrix Divide)
harga = A \ B;

fprintf('Harga Beras  : Rp %.2f / kg\n', harga(1));
fprintf('Harga Telur  : Rp %.2f / kg\n', harga(2));
fprintf('Harga Tepung : Rp %.2f / kg\n', harga(3));
fprintf('Harga Ayam   : Rp %.2f / kg\n', harga(4));


