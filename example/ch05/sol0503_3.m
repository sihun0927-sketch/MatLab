% sol0503_3.m - 연습문제 5.3.2-1 멱함수를 plot 과 loglog 로 비교
clear; clc; close all

x = logspace(-1, 3, 100);        % 0.1 ~ 1000
y = 3*x.^1.5;

t = tiledlayout(1, 2);

nexttile
plot(x, y)
title("plot - 선형/선형")
xlabel("x"), ylabel("y"), grid on

nexttile
loglog(x, y)
title("loglog - 로그/로그")
xlabel("x"), ylabel("y"), grid on

title(t, "y = 3x^{1.5}")

% 답: 선형 그래프에서는 x 가 0.1~10 인 구간이 원점 근처에 뭉개져 보이지 않는다.
%     loglog 는 네 자릿수 범위를 고르게 펴 주고, 직선의 기울기 1.5 가 곧 지수다.
n = (log10(y(end)) - log10(y(1))) / (log10(x(end)) - log10(x(1)));
fprintf("loglog 기울기 = %.4f  (지수 1.5 와 일치)\n", n);

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0503_3.png")
