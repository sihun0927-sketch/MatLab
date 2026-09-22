% sol0543_2.m - 5.4.3 연습문제 2
% 같은 데이터를 pcolor와 contourf로 그려 비교한다.

clear; clc; close all

[x, y, z] = peaks;

t = tiledlayout(1,2);
title(t, "pcolor vs contourf")

nexttile
pcolor(x, y, z)
shading interp
colorbar
title("pcolor + shading interp")

nexttile
contourf(x, y, z, 20, "k")
colorbar
title("contourf(...,20,""k"")")
