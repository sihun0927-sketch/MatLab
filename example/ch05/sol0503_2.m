% sol0503_2.m - 연습문제 5.3.1-2 장미 곡선의 잎 개수
clear; clc; close all

theta = 0:pi/720:2*pi;

t = tiledlayout(1, 2);

nexttile
polarplot(theta, cos(2*theta), LineWidth=1.2)
title("r = cos(2\theta)  ->  잎 4장")

nexttile
polarplot(theta, cos(5*theta), LineWidth=1.2)
title("r = cos(5\theta)  ->  잎 5장")

title(t, "n 이 짝수면 2n 장, 홀수면 n 장")

% 답: n 이 홀수면 theta 를 0~2*pi 돌 때 같은 잎을 두 번 덧그리므로 n 장,
%     짝수면 음수 r 이 만드는 잎이 기존 잎과 겹치지 않아 2n 장이 된다.

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0503_2.png")
