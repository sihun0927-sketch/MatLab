% sol0560_2.m - 5.6 연습문제 2
% 같은 3차원 산점도를 기본 시점과 위에서 본 시점으로 비교한다.

clear; clc; close all

load seamount

t = tiledlayout(1,2);
title(t, "같은 데이터, 다른 시점")

nexttile
scatter3(x, y, z, 12, z, "filled")
xlabel("Longitude"); ylabel("Latitude"); zlabel("Depth")
title("기본 시점")

nexttile
scatter3(x, y, z, 12, z, "filled")
view(2)                         % 위에서 내려다본 2차원 시점
colorbar
xlabel("Longitude"); ylabel("Latitude")
title("view(2)")
