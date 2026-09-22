% ex0542_colormap.m
% 5.4.2 colormap - 표면 색 배합 바꾸기. 기본값은 parula.

clear; clc; close all

[X, Y] = meshgrid(-2:0.1:2);        % 벡터 하나만 주면 meshgrid(x,x)와 같다
Z = X .* exp(-X.^2 - Y.^2);

maps = ["parula", "jet", "hot", "gray"];

t = tiledlayout(2,2);
title(t, "Colormap 비교")

for k = 1 : numel(maps)
    ax = nexttile;
    surf(ax, X, Y, Z)
    shading interp
    colormap(ax, maps(k))           % axes 단위로 colormap을 지정할 수 있다
    colorbar(ax)
    title(ax, maps(k))
end

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0542_colormap.png")
