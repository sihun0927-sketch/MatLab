% sol0542_1.m - 5.4.2 연습문제 1
% 멕시코 모자(sombrero) 곡면을 meshgrid + surf로 그린다.
% z = sin(r)/r,  r = sqrt(x^2 + y^2)

clear; clc; close all

[X, Y] = meshgrid(-8 : 0.5 : 8);
R = sqrt(X.^2 + Y.^2) + eps;    % eps를 더해 0으로 나누는 것을 막는다
Z = sin(R) ./ R;

surf(X, Y, Z)
shading interp
colormap(gca, "parula")
colorbar
xlabel("x"); ylabel("y"); zlabel("z")
title("Sombrero: z = sin(r)/r")
