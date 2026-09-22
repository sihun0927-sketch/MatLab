% ex0533_bar_pie.m
% 5.3.3 Bar Graphs and Pie Charts
% 막대 그래프(bar/barh/bar3)와 파이 차트(pie/pie3)를 한 figure에 모아 본다.

clear; clc; close all

x = [1, 2, 5, 4, 8];    % 1x5 벡터
y = [x; 1:5];           % 2x5 배열 (행이 두 개의 데이터 계열)

t = tiledlayout("flow");
title(t, "Sample Bar Graphs and Pie Charts")

nexttile
bar(x)
title("Bar Graph of Vector x")

nexttile
barh(x)
title("Horizontal Bar Graph")

nexttile
bar(y)                  % 행렬을 주면 열마다 그룹이 생긴다
title("Bar Graph of Array y")

nexttile
bar3(y)
title("Three-Dimensional Bar Graph")

nexttile
bar3h(y)
title("Three-Dimensional Horizontal Bar Graph")

nexttile
pie(x)
title("Pie Chart of x")

nexttile
pie3(x)
title("Three-Dimensional Pie Chart")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0533_bar_pie.png")
