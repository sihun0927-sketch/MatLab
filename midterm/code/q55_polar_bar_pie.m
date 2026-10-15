% 문제 55: 1x3 타일 — 세 잎 장미 곡선(극좌표), 분기별 판매량 막대, 파이.
clear, clc, clf
theta = 0:10:360;                 % degrees
r = 2 + cos(3*theta);
tiledlayout(1, 3)
nexttile
polarplot(r, theta)
title("Three-leaf rose")
nexttile
sales = [120 95 143 88];
bar(sales)
xticklabels(["Q1" "Q2" "Q3" "Q4"])
ylabel("Units sold")
nexttile
pie(sales, ["Q1" "Q2" "Q3" "Q4"])
title(t, "Quarterly report")
