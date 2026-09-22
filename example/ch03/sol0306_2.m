% sol0306_2.m  (3.6 연습문제 2)
% 평균 170, 표준편차 6 인 키 자료
clear; clc
rng(1)

mu = 170; sigma = 6;
h = sigma*randn(1,10000) + mu;

inRange = sum(h >= 160 & h <= 180) / numel(h) * 100;
fprintf("mean=%.2f  std=%.2f\n", mean(h), std(h))
fprintf("160~180cm 비율 = %.2f%%\n", inRange)
fprintf("참고: 160~180 은 평균 +-1.67 sigma 구간이다\n")
