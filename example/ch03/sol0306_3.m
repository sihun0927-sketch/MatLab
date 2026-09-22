% sol0306_3.m  (3.6 연습문제 3)
% 주사위 두 개를 10000번
clear; clc
rng(1)

n = 10000;
d1 = randi(6, 1, n);
d2 = randi(6, 1, n);
total = d1 + d2;

p7 = sum(total == 7) / n;
fprintf("합이 7 인 비율 = %.4f\n", p7)
fprintf("이론값 6/36    = %.4f\n", 6/36)
