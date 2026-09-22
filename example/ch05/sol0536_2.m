% sol0536_2.m - 5.3.6 연습문제 2
% 함수 핸들을 변수에 저장해 fplot에 넘기고, y = 0 선을 그어 근의 위치를 본다.

clear; clc; close all

g = @(x) x.^2 - 3*x + 2;        % 근은 x = 1, x = 2

fplot(g, [-1, 4])
yline(0, "--")                  % 기준선
xlabel("x"); ylabel("g(x)")
title("g(x) = x^2 - 3x + 2")
grid on

fprintf("g(1) = %g, g(2) = %g\n", g(1), g(2));
