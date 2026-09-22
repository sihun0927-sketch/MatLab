% ex0503_polarplot.m - 5.3.1 polarplot(theta, r) 로 극좌표 그래프 그리기
% theta 는 항상 라디안이다.
clear; clc; close all

theta  = 0:pi/100:pi;
radius = sin(theta);

polarplot(theta, radius)
title("The sine function in Polar Coordinates is a Circle")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0503_polarplot.png")
