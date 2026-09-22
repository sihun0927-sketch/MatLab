% ex0534_histcounts.m
% 5.3.4 histcounts - 그림 없이 bin 개수만 얻기, 그리고 히스토그램 주석 달기

clear; clc; close all

x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
edges = [0, 60, 70, 80, 90, 100];

n = histcounts(x, edges);           % edge 기준 도수
fprintf("edges 기준 도수: %s\n", mat2str(n));

[nAuto, edgesAuto] = histcounts(x); % bin 경계까지 함께 받기
fprintf("자동 bin 도수 : %s\n", mat2str(nAuto));
fprintf("자동 bin 경계 : %s\n", mat2str(edgesAuto));

fprintf("총 인원(합계) : %d\n", sum(n));

histogram(x, edges)
xlabel("Test Score")
ylabel("Number of Students")
title("Test Results")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0534_histcounts.png")
