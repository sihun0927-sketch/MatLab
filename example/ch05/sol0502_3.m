% sol0502_3.m - 연습문제 5.2-3 3x3 격자에서 위 두 줄을 하나로 합치기
clear; clc; close all

x = 0:0.05:2*pi;

t = tiledlayout(3, 3);

nexttile(1, [2, 3])              % 1번 칸부터 2행 3열 -> 위 두 줄 전체
plot(x, sin(x), x, cos(x), LineWidth=1.2)
title("큰 그래프: sin(x) 와 cos(x)")
xlabel("x, rad"), ylabel("y"), grid on
legend("sin(x)", "cos(x)")

nexttile, plot(x, sin(2*x)),  title("sin(2x)"),  grid on
nexttile, plot(x, sin(3*x)),  title("sin(3x)"),  grid on
nexttile, plot(x, sin(4*x)),  title("sin(4x)"),  grid on

title(t, "nexttile(1, [2, 3]) 으로 칸 합치기")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0502_3.png")
