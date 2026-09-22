% sol0534_1.m - 5.3.4 연습문제 1
% 정규분포 난수 1000개의 히스토그램. bin 20개, 확률로 정규화.

clear; clc; close all

rng(0)                          % 결과를 재현하기 위해 난수 씨앗 고정
data = randn(1, 1000);

histogram(data, 20, Normalization="probability")
xlabel("Value"); ylabel("Probability")
title("1000 Normally Distributed Random Numbers")

fprintf("모든 bin 확률의 합 = %.3f\n", sum(histcounts(data, 20, Normalization="probability")));
