% ex0304_trig_plot.m
% 3.4 라디안 입력과 도 입력 비교 그래프
clear; clc; close all

theta_deg = 0:1:360;

f = figure(Visible="off");
theme(f, "light")   % R2025a 이후 기본 테마가 어두우므로 밝은 테마로 고정
tl = tiledlayout(f, 2, 1, TileSpacing="compact");

nexttile
plot(theta_deg, sind(theta_deg), LineWidth=1.5)
title("sind(theta) - 입력이 도(degree)")
xlabel("theta [deg]"); ylabel("sin"); grid on
xlim([0 360])

nexttile
plot(theta_deg, sin(theta_deg), LineWidth=1.5)
title("sin(theta) - 같은 수를 라디안으로 해석")
xlabel("theta [deg 로 적었지만 rad 로 계산됨]"); ylabel("sin"); grid on
xlim([0 360])

title(tl, "각도 단위를 틀리면 그래프 자체가 달라진다")
out = "../../textbook/ch03/img/ex0304_trig_plot.png";
exportgraphics(f, out, Resolution=150)
disp("saved: " + out)
