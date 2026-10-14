% 정답 48: 두 y축 그래프와 fplot
clear, clc, clf
x = 0:0.1:6;
tiledlayout(2, 1)
nexttile
yyaxis left
plot(x, sin(x), LineWidth = 1.5), ylabel("sin(x)")
yyaxis right
plot(x, exp(x), "--"), ylabel("e^x")
xlabel("x"), title("Two y-axes: sin(x) and e^x"), grid on
nexttile
f = @(x) exp(-x/3).*sin(2*x);
fplot(f, [0 6], "r", LineWidth = 1.5)
title("f(x) = e^{-x/3}sin(2x)"), xlabel("x"), ylabel("f(x)"), grid on
xs = 0:0.01:6;
[fmax, k] = max(f(xs));
text(xs(k), fmax, sprintf("  max %.3f at x = %.2f", fmax, xs(k)))
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a48_yyaxis_fplot.png')
