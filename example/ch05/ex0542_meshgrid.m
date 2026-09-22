% ex0542_meshgrid.m
% 5.4.2 meshgrid - 두 개의 독립변수를 2차원 격자로 펼친다.
% z(x,y) = x * exp(-x^2 - y^2)

clear; clc; close all

x = -2 : 0.2 : 2;
y = -2 : 0.2 : 2;
[X, Y] = meshgrid(x, y);        % 1x21 벡터 두 개 -> 21x21 배열 두 개
Z = X .* exp(-X.^2 - Y.^2);     % 배열 크기가 맞아야 계산된다

fprintf("x: %s, X: %s, Z: %s\n", mat2str(size(x)), mat2str(size(X)), mat2str(size(Z)));

t = tiledlayout(2,2);
title(t, "meshgrid로 만든 표면")

nexttile
mesh(X, Y, Z)
title("(a) Mesh Plot"); xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
surf(X, Y, Z)
title("(b) Surface Plot"); xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
contour(X, Y, Z)
title("(c) Contour Plot"); xlabel("x-axis"); ylabel("y-axis")

nexttile
surfc(X, Y, Z)
title("(d) Surface + Contour"); xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0542_meshgrid.png")
