% sol0542_2.m - 5.4.2 연습문제 2
% 같은 배열을 mesh(z)와 mesh(x,y,z)로 그려 축 값의 차이를 확인한다.

clear; clc; close all

z = magic(6);                   % 6x6 배열
x = linspace(0, 100, 6);        % 열 개수와 같아야 한다
y = linspace(10, 60, 6);        % 행 개수와 같아야 한다

t = tiledlayout(1,2);
title(t, "입력 1개 vs 입력 3개")

nexttile
mesh(z)
xlabel("열 인덱스"); ylabel("행 인덱스"); zlabel("z")
title("mesh(z)")

nexttile
mesh(x, y, z)
xlabel("x (0~100)"); ylabel("y (10~60)"); zlabel("z")
title("mesh(x,y,z)")

fprintf("size(z) = %s, numel(x) = %d, numel(y) = %d\n", mat2str(size(z)), numel(x), numel(y));
