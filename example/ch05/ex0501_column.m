% ex0501_column.m - 5.1.1 MATLAB 은 column dominant: 2차원 입력은 '열' 단위로 그린다
clear; clc; close all

x  = 0:pi/100:2*pi;
y1 = cos(4*x);
y2 = sin(x);
x1 = x;
x2 = 2*x;

X = [x1; x2];                    % 2 x 201
Y = [y1; y2];                    % 2 x 201
fprintf("size(X) = %d x %d\n", size(X, 1), size(X, 2));

t = tiledlayout(1, 2);

nexttile
plot(X, Y)                       % 열이 201개 -> 점 2개짜리 선이 201개 그려진다
title("plot(X, Y)  (2 x 201)")
xlabel("x"), ylabel("y"), grid on

nexttile
plot(X', Y')                     % 전치하면 201 x 2 -> 점 201개짜리 선 2개
title("plot(X', Y')  (201 x 2)")
xlabel("x"), ylabel("y"), grid on

title(t, "행/열을 바꾸면 결과가 완전히 달라진다")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_column.png")
