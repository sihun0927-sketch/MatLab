% ex0501_legendtext.m - 5.1.3 legend 와 text 로 그래프에 설명 붙이기
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

plot(x, y, ":ok", x, y*2, "--r", x, y/2, "-b")
legend("line 1", "line 2", "line 3", Location="northwest")
text(1, 100, "Label plots with the text command")   % 좌표는 축 값 기준
axis([0 11 0 300])
title("Example Graph for Chapter 5")
xlabel("My x-axis label")
ylabel("My y-axis label")
grid on

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_legendtext.png")
