% ex0501_ballistics.m - 5.1.3 Example 5.2 탄도: 중력가속도 g 의 차이가 사거리에 주는 영향
% 발사각 theta, 초기속도 v 일 때 사거리  R = v^2 / g * sin(2*theta)
clear; clc; close all

g1 = 9.8;                        % m/s^2
g2 = 9.9;                        % m/s^2
v  = 100;                        % m/s
theta = 0:0.05:pi/2;             % rad

R1 = v^2 ./ g1 .* sin(2*theta);  % m
R2 = v^2 ./ g2 .* sin(2*theta);  % m

plot(theta, R1, theta, R2)
title(["Cannon Range Sensitivity"; "To the Value of g"])
xlabel("Cannon Launch Angle, \theta")
ylabel("Range, meters")
legend("g_1 = 9.8 m/s^2", "g_2 = 9.9 m/s^2")
grid on

fprintf("최대 사거리 차이: %.2f m\n", max(R1) - max(R2));

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_ballistics.png")
