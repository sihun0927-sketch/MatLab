% ex0502_span.m - 5.2 nexttile 로 여러 칸을 하나로 합치기
% nexttile(시작칸번호, [행수, 열수])
clear; clc; close all

x = 0:pi/20:2*pi;

tile_name = tiledlayout(2, 2);

nexttile                         % 1번 칸
plot(x, sin(x))
title("Sin(x)"), xlabel("x-axis"), ylabel("y-axis")

nexttile                         % 2번 칸
plot(x, sin(x).^2 + cos(x))
title("Trig Function"), xlabel("x-axis"), ylabel("y-axis")

nexttile(3, [1, 2])              % 3번 칸에서 시작해 1행 2열만큼 차지
plot(x, 2 + 3*x - 8*x.^2 + 1.5*x.^3)
title("Polynomial"), xlabel("x-axis"), ylabel("y-axis")

title(tile_name, ["Some Sample Plots"; "Created by Designating Tile Size"])

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0502_span.png")
