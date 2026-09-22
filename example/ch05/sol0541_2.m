% sol0541_2.m - 5.4.1 연습문제 2
% 3차원 리사주 곡선을 그리고 시점을 바꿔 두 장면을 비교한다.

clear; clc; close all

t = linspace(0, 2*pi, 400);
x = sin(3*t);
y = sin(4*t);
z = sin(5*t);

tl = tiledlayout(1,2);
title(tl, "3D Lissajous Curve")

nexttile
plot3(x, y, z); grid on
xlabel("x"); ylabel("y"); zlabel("z")
title("기본 시점")

nexttile
plot3(x, y, z); grid on
view(0, 90)                 % 위에서 내려다보기 (xy 평면)
xlabel("x"); ylabel("y"); zlabel("z")
title("view(0,90) - 위에서")
