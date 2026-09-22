% sol0550_2.m - 5.5 연습문제 2
% cylinder도 sphere처럼 예제 표면 함수다. axis equal의 효과를 비교한다.

clear; clc; close all

[X, Y, Z] = cylinder(1, 40);    % 반지름 1, 40면

t = tiledlayout(1,2);
title(t, "cylinder와 axis equal")

nexttile
surf(X, Y, Z)
title("axis equal 없음")
xlabel("x"); ylabel("y"); zlabel("z")

nexttile
surf(X, Y, Z)
axis equal
title("axis equal 적용")
xlabel("x"); ylabel("y"); zlabel("z")
