% ex0306_randn_gaussian.m
% 3.6.2 정규(가우시안) 난수 randn
clear; clc
rng(0)

% randn 은 평균 0, 분산 1 (따라서 표준편차도 1)
x = randn(1,500);
fprintf("randn(1,500)  : mean=%.4f  std=%.4f\n", mean(x), std(x))

% 원하는 평균/표준편차로 옮기는 공식: sigma*randn + mu
sigma = 2.5;
average = 3;

x500 = sigma*randn(1,500) + average;
fprintf("n=500   : mean=%.4f  std=%.4f\n", mean(x500), std(x500))

x50000 = sigma*randn(1,50000) + average;
fprintf("n=50000 : mean=%.4f  std=%.4f\n", mean(x50000), std(x50000))
fprintf("이론값  : mean=%.4f  std=%.4f\n", average, sigma)

% 68-95-99.7 규칙 확인
within1 = sum(abs(x50000-average) < sigma)     / numel(x50000) * 100;
within2 = sum(abs(x50000-average) < 2*sigma)   / numel(x50000) * 100;
within3 = sum(abs(x50000-average) < 3*sigma)   / numel(x50000) * 100;
fprintf("1 sigma 이내 %.2f%%, 2 sigma 이내 %.2f%%, 3 sigma 이내 %.2f%%\n", ...
        within1, within2, within3)
