% ex0541_comet3.m
% 5.4.1 comet / comet3 - 같은 그래프를 애니메이션으로 그린다.
% 결과 figure만 보면 plot, plot3와 같다. 차이는 그려지는 과정이 보인다는 것.

clear; clc; close all

x = linspace(0, 10*pi, 300);    % 점이 적으면 애니메이션이 너무 빨리 끝난다
y = cos(x);
z = sin(x);

t = tiledlayout(1,2);
title(t, "애니메이션으로 그리기")

nexttile
comet(x, y)                     % 2차원용
grid on
xlabel("x = angle"); ylabel("y = cos(x)")
title("comet (2차원)")

nexttile
comet3(x, y, z)                 % 3차원용
grid on
xlabel("x = angle"); ylabel("y = cos(x)"); zlabel("z = sin(x)")
title("comet3 (3차원)")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0541_comet3.png")
