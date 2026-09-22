% sol0501_7.m - 연습문제 5.1.3-1 감쇠 진동, 축 고정, TeX 제목
clear; clc; close all

lambda = 0.3;                    % 감쇠상수
x = 0:0.1:10;
y = exp(-lambda*x).*sin(3*x);    % .* 에 주의

plot(x, y, LineWidth=1.5)
axis([0 10 -1 1])                % [xmin xmax ymin ymax]
title("감쇠 진동  y = e^{-\lambda x} sin(3x),  \lambda = 0.3")   % ^{} 위 첨자, \lambda 그리스 문자
xlabel("x")
ylabel("진폭 y")
grid on

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_7.png")
