% ex0543_contourf.m
% 5.4.3 contourf - 색을 채운 등고선. pcolor + contour 조합을 한 줄로 대신한다.
% 등고선에 값을 붙이는 두 번째 방법(clabel)도 함께 본다.

clear; clc; close all

[x, y, z] = peaks;

t = tiledlayout(1,3);

nexttile
contourf(x, y, z, 20, "k")      % 등고선 20개, 선 색은 검정
title("contourf(x,y,z,20,""k"")")
xlabel("x-axis"); ylabel("y-axis")

nexttile
contourf(x, y, z, 20, LineColor="flat")   % 선 색을 면 색에 맞추면 등고선이 묻힌다
title("LineColor=""flat"" - 선이 묻힌다")
xlabel("x-axis"); ylabel("y-axis")

nexttile
[C, h] = contour(x, y, z, 10);  % 등고선 행렬 C와 객체 h를 함께 받는다
clabel(C, h)                    % 슬라이드의 clabel 방식
title("clabel(C,h)")
xlabel("x-axis"); ylabel("y-axis")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0543_contourf.png")
