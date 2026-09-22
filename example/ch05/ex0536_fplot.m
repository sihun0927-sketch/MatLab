% ex0536_fplot.m
% 5.3.6 Function Plots
% fplot은 x, y 배열을 만들지 않고 함수 자체를 그린다.

clear; clc; close all

t = tiledlayout(1,2);
title(t, "Function Plots with fplot")

nexttile
fplot(@(x) sin(x), [-2*pi, 2*pi])       % @(독립변수) 함수, [범위]
title("My Graph of the Sin Function")
xlabel("Angle in Radians"); ylabel("sin(x)")

fun = @(x) exp(-x.^2/2) .* cos(4*x);    % 함수 핸들을 변수에 저장
nexttile
fplot(fun, [-3, 3])
title("Function Handle as Input")
xlabel("x"); ylabel("f(x)")
grid on

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0536_fplot.png")
