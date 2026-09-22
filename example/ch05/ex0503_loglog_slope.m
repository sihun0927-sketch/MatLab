% ex0503_loglog_slope.m - 5.3.2 [보강] loglog 에서 멱함수가 직선이 되는 이유
% y = a*x^n  ->  log10(y) = log10(a) + n*log10(x)  : 기울기가 지수 n 인 직선
clear; clc; close all

x  = logspace(0, 2, 50);         % 1 부터 100 까지 로그 간격 50점
y1 = 5*x.^2;                     % n = 2
y2 = 5*x.^3;                     % n = 3

loglog(x, y1, "-o", x, y2, "--s", MarkerSize=4)
title("멱함수는 loglog 에서 직선, 기울기 = 지수")
xlabel("x"), ylabel("y")
legend("y = 5x^2  (기울기 2)", "y = 5x^3  (기울기 3)", Location="northwest")
grid on

% 기울기를 수치로 확인
n2 = (log10(y1(end)) - log10(y1(1))) / (log10(x(end)) - log10(x(1)));
n3 = (log10(y2(end)) - log10(y2(1))) / (log10(x(end)) - log10(x(1)));
fprintf("측정한 기울기: %.4f, %.4f\n", n2, n3);

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0503_loglog_slope.png")
