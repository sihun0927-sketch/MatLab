% 정답 24: 난수 시뮬레이션. 균일분포 [a,b]와 정규분포(mean, std)
clear, clc, clf
rng(1)                                   % 재현용 (슬라이드 밖 [보강])
a = 5; b = 10; n = 1000;
u = (b - a)*rand(n, 1) + a;              % [5, 10] 균일분포
mu = 70; sigma = 8;
g = sigma*randn(n, 1) + mu;              % 평균 70, 표준편차 8
fprintf('Uniform : min %.3f, max %.3f, mean %.3f (target 7.5)\n', min(u), max(u), mean(u))
fprintf('Gaussian: mean %.3f, std %.3f (target 70, 8)\n', mean(g), std(g))
within1 = sum(abs(g - mu) < sigma) / n * 100;
within2 = sum(abs(g - mu) < 2*sigma) / n * 100;
fprintf('Within 1 sigma: %.1f%%, within 2 sigma: %.1f%% (expect 68%%, 95%%)\n', within1, within2)
tiledlayout(1, 2)
nexttile, histogram(u, 10), title("Uniform [5, 10]"), xlabel("value"), ylabel("count")
nexttile, histogram(g, 20), title("Gaussian \mu = 70, \sigma = 8"), xlabel("value"), ylabel("count")
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a24_random_sim.png')
