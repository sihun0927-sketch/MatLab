% ex0501_area.m - 5.1.1 area 는 plot 과 같은 입력을 받지만 선 아래를 채운다
clear; clc; close all

x = 0:2:18;
y = [0 0.33 4.13 6.29 6.85 11.19 13.19 13.96 16.33 18.17];

area(x, y)
title("Laboratory Experiment 1 - area")
xlabel("Time, sec")
ylabel("Distance, ft")
grid minor                       % 보조 격자선까지 표시

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_area.png")
