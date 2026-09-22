% ex0305_variance.m
% 3.5.6 분산과 표준편차 (Table 3.12) + 산포 비교 그래프
clear; clc; close all
rng(0)   % 재현 가능한 난수

x = [1 5 3];
fprintf("std(x) = %g,  var(x) = %g,  std^2 = %g\n", std(x), var(x), std(x)^2)

m = [1 5 3
     2 4 6];
disp("std(m) = " + join(string(std(m)), "  "))

% 평균이 같고 산포만 다른 두 성적 집합
n = 1000;
scores1 = 50 + 20*randn(1, n);
scores2 = 50 + 10*randn(1, n);

fprintf("scores1: mean=%.2f, std=%.2f, var=%.2f\n", mean(scores1), std(scores1), var(scores1))
fprintf("scores2: mean=%.2f, std=%.2f, var=%.2f\n", mean(scores2), std(scores2), var(scores2))

f = figure(Visible="off", Position=[100 100 900 600]);
theme(f, "light")   % R2025a 이후 기본 테마가 어두우므로 밝은 테마로 고정
tl = tiledlayout(f, 2, 2, TileSpacing="compact");

nexttile; plot(scores1, LineWidth=0.5); yline(mean(scores1), "r", LineWidth=2)
title("scores1 (sigma = 20)"); xlabel("학생 번호"); ylabel("점수"); ylim([0 100])

nexttile; histogram(scores1, 30)
title("scores1 분포"); xlabel("점수"); ylabel("학생 수"); xlim([0 100])

nexttile; plot(scores2, LineWidth=0.5); yline(mean(scores2), "r", LineWidth=2)
title("scores2 (sigma = 10)"); xlabel("학생 번호"); ylabel("점수"); ylim([0 100])

nexttile; histogram(scores2, 30)
title("scores2 분포"); xlabel("점수"); ylabel("학생 수"); xlim([0 100])

title(tl, "평균은 같아도 표준편차가 다르면 자료의 모습이 다르다")
out = "../../textbook/ch03/img/ex0305_variance.png";
exportgraphics(f, out, Resolution=150)
disp("saved: " + out)
