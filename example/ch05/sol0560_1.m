% sol0560_1.m - 5.6 연습문제 1
% PLOTS 탭이 제안하는 플롯을 코드로 직접 만들어 본다 (seamount).

clear; clc; close all

load seamount

t = tiledlayout(1,3);
title(t, "seamount를 보는 세 가지 방법")

nexttile
plot(x, y, ".")
xlabel("Longitude"); ylabel("Latitude"); title("plot - 측정 위치")

nexttile
scatter(x, y, 12, z, "filled")
colorbar
xlabel("Longitude"); ylabel("Latitude"); title("scatter - 색이 수심")

nexttile
stem3(x, y, z, "Marker", "none")
xlabel("Longitude"); ylabel("Latitude"); zlabel("Depth")
title("stem3")
