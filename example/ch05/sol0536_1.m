% sol0536_1.m - 5.3.6 연습문제 1
% fplot으로 감쇠 진동 f(x) = exp(-x/3)*sin(3x) 를 [0,10]에서 그린다.

clear; clc; close all

fplot(@(x) exp(-x/3) .* sin(3*x), [0, 10])
xlabel("x"); ylabel("f(x)")
title("Damped Oscillation")
grid on
