% ex0501_plot.m - 5.1.1 기본 x-y plot 과 제목/축 이름/격자
% 실험실에서 측정한 시간-거리 데이터를 그린다.
clear; clc; close all

x = 0:2:18;                                              % Time, s
y = [0 0.33 4.13 6.29 6.85 11.19 13.19 13.96 16.33 18.17];   % Distance, ft

plot(x, y)
title("Laboratory Experiment 1")
xlabel("Time, sec")
ylabel("Distance, ft")
grid on

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_plot.png")
