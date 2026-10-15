% 정답 61: plot3 나선, 그룹 막대, stem + yline, errorbar
clear, clc, clf
tl = tiledlayout(2, 2);
nexttile                                  % (1) 나선
t = linspace(0, 6*pi, 300);
plot3(cos(t), sin(t), t, LineWidth = 1.5)
grid on, view(35, 25)
xlabel("x"), ylabel("y"), zlabel("z")
title("Helix")
nexttile                                  % (2) 그룹 막대
sales = [120 95; 143 88; 110 130];        % 행 = 분기, 열 = 제품
bar(sales)
xticklabels(["Q1" "Q2" "Q3"])
ylabel("Units"), legend("A", "B", Location = "northwest")
title("Sales by product")
nexttile                                  % (3) stem + 평균선
k = 0:10;
s = round(10*exp(-0.2*k).*cos(k), 2);
stem(k, s, "filled")
yline(mean(s), "r--", "mean")
xlabel("k"), ylabel("s[k]"), title("Sampled signal")
nexttile                                  % (4) errorbar
trial = [4.8 5.1 5.0 4.7; 6.2 5.8 6.0 6.4; 7.1 7.5 6.9 7.3];   % 행 = 조건
m = mean(trial, 2);
sd = std(trial, 0, 2);
errorbar(1:3, m, sd, "o-", LineWidth = 1.2, CapSize = 8)
xlim([0.5 3.5]), xticks(1:3), xticklabels(["low" "mid" "high"])
ylabel("Response"), title("Mean \pm 1 std")
title(tl, "Problem 61")
theme(gcf, "light")
exportgraphics(gcf, '../img/a61_plot3_bar_errorbar.png')
