% ex0541_plot3.m
% 5.4.1 Three-Dimensional Line Plots
% plot3는 (x,y,z) 순서쌍을 3차원 공간에 찍고 직선으로 잇는다.

clear; clc; close all

x = linspace(0, 10*pi, 1000);
y = cos(x);
z = sin(x);

plot3(x, y, z)
grid on
xlabel("x = angle")
ylabel("y = cos(x)")
zlabel("z = sin(x)")
title("A Spring")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0541_plot3.png")
