% sol0502_2.m - 연습문제 5.2-2 flow 는 그림 수에 따라 배치가 달라진다
% 그림 3개 -> 2x2 격자에 3칸만 사용,  그림 4개 -> 2x2 를 꽉 채운다.
clear; clc; close all

x = 0:0.1:2*pi;

% --- 그림 3개 ---
t3 = tiledlayout("flow");
nexttile, plot(x, sin(x)), title("sin(x)"), grid on
nexttile, plot(x, cos(x)), title("cos(x)"), grid on
nexttile, plot(x, tan(x)), ylim([-5 5]), title("tan(x)"), grid on
title(t3, "flow, 그림 3개")
theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0502_2a.png")

% --- 그림 4개 ---
figure
t4 = tiledlayout("flow");
nexttile, plot(x, sin(x)), title("sin(x)"), grid on
nexttile, plot(x, cos(x)), title("cos(x)"), grid on
nexttile, plot(x, tan(x)), ylim([-5 5]), title("tan(x)"), grid on
nexttile, plot(x, sin(x).*cos(x)), title("sin(x)cos(x)"), grid on
title(t4, "flow, 그림 4개")
theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0502_2b.png")
