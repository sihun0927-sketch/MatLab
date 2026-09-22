% ex0580_other_plots.m
% 5.8 그 밖의 플롯들 - help의 "types of MATLAB plots" 표에 있는 것 중 자주 쓰는 네 가지

clear; clc; close all

x = 0 : 0.5 : 10;
y = exp(-x/3) .* cos(x);

t = tiledlayout(2,2);
title(t, "Other Plot Types")

nexttile
area(x, y)
title("area - 곡선 아래를 채운다")

nexttile
stairs(x, y)
title("stairs - 계단 모양")

nexttile
stem(x, y)
title("stem - 이산 데이터")

nexttile
errorbar(x, y, 0.05*ones(size(x)))
title("errorbar - 오차 막대")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0580_other_plots.png")
