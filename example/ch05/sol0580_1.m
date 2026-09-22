% sol0580_1.m - 5.8 연습문제 1
% 같은 이산 데이터를 stem과 stairs로 그려 성격 차이를 본다.

clear; clc; close all

n = 0 : 15;
y = 0.8.^n;

t = tiledlayout(1,2);
title(t, "이산 데이터 표현")

nexttile
stem(n, y, "filled")
xlabel("n"); ylabel("0.8^n"); title("stem")

nexttile
stairs(n, y)
xlabel("n"); ylabel("0.8^n"); title("stairs")
