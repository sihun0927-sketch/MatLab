% ex0306_random_hist.m
% 3.6 rand 와 randn 의 분포 비교
clear; clc; close all
rng(0)

n = 20000;
u = (10-5)*rand(1,n) + 5;      % 5~10 균등
g = 2.5*randn(1,n) + 3;        % 평균 3, 표준편차 2.5 정규

f = figure(Visible="off", Position=[100 100 900 380]);
theme(f, "light")   % R2025a 이후 기본 테마가 어두우므로 밝은 테마로 고정
tl = tiledlayout(f, 1, 2, TileSpacing="compact");

nexttile
histogram(u, 40)
title("rand: 5~10 균등분포"); xlabel("값"); ylabel("도수"); grid on

nexttile
histogram(g, 40)
xline(3, "r", LineWidth=2)
xline(3+2.5, "r--", LineWidth=1.5)
xline(3-2.5, "r--", LineWidth=1.5)
title("randn: mu=3, sigma=2.5 정규분포"); xlabel("값"); ylabel("도수"); grid on

title(tl, "rand 는 평평하고 randn 은 종 모양이다")
out = "../../textbook/ch03/img/ex0306_random_hist.png";
exportgraphics(f, out, Resolution=150)
disp("saved: " + out)
