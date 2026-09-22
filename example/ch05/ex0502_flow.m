% ex0502_flow.m - 5.2 tile 개수를 모를 때: tiledlayout("flow")
% 그림이 추가될 때마다 레이아웃이 다시 흘러(reflow) 칸 수를 맞춘다.
clear; clc; close all

x = 0:0.5:50;
y = 5*x.^2;

t = tiledlayout("flow");

nexttile, plot(x, y),    title("y = 5x^2"),      ylabel("y-axis"), grid on
nexttile, plot(x, y/10), title("y = 0.5x^2"),    ylabel("y-axis"), grid on
nexttile, plot(x, sqrt(y)), title("y = \surd(5x^2)"), xlabel("x-axis"), ylabel("y-axis"), grid on

title(t, "flow 는 그림 수에 맞춰 칸을 다시 배치한다")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0502_flow.png")
