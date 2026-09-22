% sol0541_1.m - 5.4.1 연습문제 1
% 반지름 1, 높이가 t와 함께 증가하는 나선(helix)을 plot3로 그린다.

clear; clc; close all

t = linspace(0, 6*pi, 500);
x = cos(t);
y = sin(t);
z = t;

plot3(x, y, z)
grid on
xlabel("x"); ylabel("y"); zlabel("z = t")
title("Helix")
