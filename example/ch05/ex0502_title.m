% ex0502_title.m - 5.2 레이아웃 전체 제목 붙이기
% tiledlayout 의 반환값(TiledChartLayout 객체)을 받아 title(t, ...) 에 넘긴다.
clear; clc; close all

x = 0:pi/20:2*pi;

t = tiledlayout(2, 1);           % 세미콜론으로 출력 억제 (객체 정보가 길다)

nexttile
plot(x, sin(x))
title("Sin(x)")
xlabel("x-axis"), ylabel("y-axis"), grid minor

nexttile
plot(x, sin(2*x))
title("Sin(2x)")
xlabel("x-axis"), ylabel("y-axis"), grid minor

title(t, "My Example Tiled Chart")   % 각 tile 제목이 아니라 창 전체 제목

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0502_title.png")
