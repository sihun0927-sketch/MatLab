% sol0535_1.m - 5.3.5 연습문제 1
% y1 = sin(x), y2 = x^3 을 두 y축으로 그린다.

clear; clc; close all

x  = linspace(0, 10, 100);
y1 = sin(x);
y2 = x.^3;

yyaxis left
plot(x, y1)
ylabel("sin(x)")

yyaxis right
plot(x, y2)
ylabel("x^3")

xlabel("x")
title("Two Scales on One Figure")
grid on
