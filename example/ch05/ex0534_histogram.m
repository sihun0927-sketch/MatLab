% ex0534_histogram.m
% 5.3.4 Histograms
% 자동 bin, bin 개수 지정, edge 지정, 정규화(countdensity)를 비교한다.

clear; clc; close all

x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];   % 14명의 시험 점수

t = tiledlayout(2,2);
title(t, "Histogram Options")

nexttile
histogram(x)
title("histogram(x) - bin 자동 결정")

nexttile
histogram(x, 5)
title("histogram(x,5) - bin 5개")

edges = [0, 60, 70, 80, 90, 100];   % E D C B A 학점 경계
nexttile
histogram(x, edges)
title("histogram(x,edges)")

nexttile
histogram(x, edges, Normalization="countdensity")
title("Normalization=""countdensity""")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0534_histogram.png")
