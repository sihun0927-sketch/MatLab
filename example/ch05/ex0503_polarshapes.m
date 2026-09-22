% ex0503_polarshapes.m - 5.3.1 [보강] 극좌표에서 자주 나오는 곡선들
clear; clc; close all

theta = 0:pi/200:2*pi;

t = tiledlayout(1, 3);

nexttile
polarplot(theta, ones(size(theta)))          % r = 1  -> 원
title("r = 1")

nexttile
polarplot(theta, 1 + cos(theta))             % 카디오이드
title("r = 1 + cos\theta")

nexttile
polarplot(theta, cos(3*theta))               % 세 잎 장미
title("r = cos(3\theta)")

title(t, "극좌표 곡선 세 가지")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0503_polarshapes.png")
