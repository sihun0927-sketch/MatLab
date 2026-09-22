% sol0550_1.m - 5.5 연습문제 1
% 메뉴 편집 없이 코드만으로 구를 제대로 보이게 만든다.

clear; clc; close all

[X, Y, Z] = sphere(40);

surf(X, Y, Z)
shading interp
axis equal                      % 데이터 종횡비를 1:1:1로 고정
colorbar
xlabel("x"); ylabel("y"); zlabel("z")
title("Unit Sphere")
