% ex0501_multiline.m - 5.1.1 한 번의 plot 호출로 여러 선 그리기
% 방법 1: x,y 쌍을 번갈아 넘긴다.  방법 2: y 들을 2차원 배열로 묶는다.
clear; clc; close all

x  = 0:pi/100:2*pi;
y1 = cos(4*x);
y2 = sin(x);

t = tiledlayout(1, 2);

nexttile
plot(x, y1, x, y2)               % plot(X1,Y1,X2,Y2) 형태
title("plot(x, y1, x, y2)")
xlabel("time, seconds"), ylabel("distance, meters"), grid on

nexttile
Y = [y1; y2];                    % 2 x 201 배열
plot(x, Y)                       % x 는 1 x 201, Y 의 각 행이 한 선이 된다
title("plot(x, Y),  Y = [y1; y2]")
xlabel("time, seconds"), ylabel("distance, meters"), grid on

title(t, "한 번의 plot 으로 두 선 그리기")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_multiline.png")
