% sol0503_1.m - 연습문제 5.3.1-1 limaçon r = 1 + 2cos(theta)
clear; clc; close all

theta = 0:pi/360:2*pi;
r = 1 + 2*cos(theta);

polarplot(theta, r, LineWidth=1.2)
title("r = 1 + 2cos\theta  (limaçon)")

% r 이 음수가 되는 구간을 확인한다
neg = theta(r < 0);
fprintf("r < 0 인 구간: theta = %.3f ~ %.3f rad\n", min(neg), max(neg));
fprintf("경계값(이론): acos(-1/2) = %.3f rad, 2*pi - 그 값 = %.3f rad\n", ...
        acos(-0.5), 2*pi - acos(-0.5));

% 답: cos(theta) < -1/2, 즉 theta 가 2*pi/3 ~ 4*pi/3 인 구간에서 r 이 음수다.
%     polarplot 은 음수 r 을 '반대 방향'으로 그리므로, 그 구간의 점들이
%     원점을 지나 맞은편에 찍히면서 안쪽 고리를 만든다.

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0503_1.png")
