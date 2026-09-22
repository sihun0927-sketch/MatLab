% ex0501_axis.m - 5.1.3 axis 로 축 범위 직접 정하기
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

t = tiledlayout(1, 2);

nexttile
plot(x, y, ":ok", x, y*2, "--r", x, y/2, "-b")
title("자동 축 범위")
xlabel("x"), ylabel("y"), grid on

nexttile
plot(x, y, ":ok", x, y*2, "--r", x, y/2, "-b")
axis([0 11 0 300])               % [xmin xmax ymin ymax]
title("axis([0 11 0 300])")
xlabel("x"), ylabel("y"), grid on

title(t, "axis 로 축 범위를 고정한다")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_axis.png")

% 참고: 입력 없는 axis 는 현재 범위를 '동결'한다.
%       axis equal / axis square / axis tight 같은 옵션도 있다.
