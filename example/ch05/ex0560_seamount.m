% ex0560_seamount.m
% 5.6 Workspace 창에서 만드는 플롯
% PLOTS 탭이 대신 만들어 주는 코드를 직접 써 본다. 데이터는 MATLAB 내장 seamount.

clear; clc; close all

load seamount           % x, y, z 벡터가 workspace에 들어온다
whos x y z

t = tiledlayout(1,2);
title(t, "seamount 데이터 (해저 화산 측심 자료)")

nexttile
scatter(x, y, 10, z, "filled")      % PLOTS 탭의 scatter에 해당
colorbar
title("scatter - 색이 수심")
xlabel("Longitude"); ylabel("Latitude")

nexttile
scatter3(x, y, z, 10, z, "filled")  % PLOTS 탭의 scatter3에 해당
title("scatter3")
xlabel("Longitude"); ylabel("Latitude"); zlabel("Depth")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0560_seamount.png")
