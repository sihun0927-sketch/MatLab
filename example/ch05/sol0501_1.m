% sol0501_1.m - 연습문제 5.1.1-1 자유낙하 거리
clear; clc; close all

t = 0:0.5:10;                    % s
d = 0.5*9.81*t.^2;               % m,  t 가 벡터이므로 .^ 를 쓴다

plot(t, d)
title("자유낙하 거리")
xlabel("시간 t, s")
ylabel("낙하 거리 d, m")
grid on

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_1.png")
