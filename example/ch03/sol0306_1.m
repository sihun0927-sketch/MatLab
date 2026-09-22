% sol0306_1.m  (3.6 연습문제 1)
% 공칭 100옴, 공차 +-5% 저항 1000개
clear; clc
rng(1)

nominal = 100;
tol = 0.05;
r_min = nominal*(1-tol);
r_max = nominal*(1+tol);

R = (r_max-r_min)*rand(1000,1) + r_min;
fprintf("mean=%.4f  max=%.4f  min=%.4f\n", mean(R), max(R), min(R))
fprintf("이론값: mean=%.4f  max=%.4f  min=%.4f\n", nominal, r_max, r_min)
