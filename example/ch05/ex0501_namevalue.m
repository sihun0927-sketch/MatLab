% ex0501_namevalue.m - 5.1.2 Name=Value 로 선 속성 세밀하게 조정
% LineSpec 문자열로는 굵기나 마커 크기를 정할 수 없다. 속성 이름을 써야 한다.
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

plot(x, y, LineWidth=2, Marker="o", MarkerSize=10)
title("plot(x, y, LineWidth=2, Marker=""o"", MarkerSize=10)")
xlabel("x"), ylabel("y"), grid on

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_namevalue.png")

% 구문법(R2021a 이전)으로 쓰면 아래와 동일하다.
% plot(x, y, "LineWidth", 2, "Marker", "o", "MarkerSize", 10)
