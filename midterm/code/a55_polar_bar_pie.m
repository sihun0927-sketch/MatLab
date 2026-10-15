% 정답 55: 극좌표·막대·파이 수정본
clear, clc, clf
theta = 0:10:360;                 % degrees
r = 2 + cosd(3*theta);            % 도 단위면 cosd (또는 cos(deg2rad(..)))
t = tiledlayout(1, 3);            % 레이아웃 제목을 붙이려면 핸들을 받아 둔다
nexttile
polarplot(deg2rad(theta), r)      % (theta[rad], r) 순서
title("Three-leaf rose")
nexttile
sales = [120 95 143 88];
bar(sales)
xticklabels(["Q1" "Q2" "Q3" "Q4"])
ylabel("Units sold")
nexttile
pie(sales, ["Q1" "Q2" "Q3" "Q4"]) % string 배열 라벨은 그대로 된다
title(t, "Quarterly report")
theme(gcf, "light")
exportgraphics(gcf, '../img/a55_polar_bar_pie.png')
