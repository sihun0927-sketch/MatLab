% ex0502_tiledlayout.m - 5.2 tiledlayout + nexttile 로 창을 격자로 나누기
% tiledlayout(m, n) 이 m행 n열 격자를 만들고, nexttile 이 다음 칸을 활성화한다.
clear; clc; close all

x = 0:pi/20:2*pi;

tiledlayout(2, 1)                % 2행 1열

nexttile                         % 1번 칸 (왼쪽 위 -> 오른쪽, 위 -> 아래 순서)
plot(x, sin(x))
title("Sin(x)")
xlabel("x-axis"), ylabel("y-axis"), grid minor

nexttile                         % 2번 칸. 번호를 적지 않아도 순서대로 채워진다
plot(x, sin(2*x))
title("Sin(2x)")
xlabel("x-axis"), ylabel("y-axis"), grid minor

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0502_tiledlayout.png")
