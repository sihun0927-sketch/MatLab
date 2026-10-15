% 정답 62: 몬테카를로 pi 추정 (loop 없이 cumsum으로 누적 추정)
clear, clc, clf
rng(1)
N = 100000;
x = rand(1, N);
y = rand(1, N);
inside = x.^2 + y.^2 <= 1;             % 사분원 안에 든 점 (logical)
piHat = 4*sum(inside)/N;
fprintf('N = %d: pi estimate = %.4f, error = %.4f\n', N, piHat, abs(piHat - pi))
running = 4*cumsum(inside)./(1:N);     % n개째까지의 추정값
errRun = abs(running - pi);
firstGood = find(errRun < 0.01, 1)
lastBad = find(errRun >= 0.01, 1, "last")
fprintf('Error first below 0.01 at n = %d, last above at n = %d\n', firstGood, lastBad)
tiledlayout(1, 2)
nexttile
show = 1:5000;                         % 그림은 앞 5000점만
in5 = inside(show);
scatter(x(show(in5)), y(show(in5)), 2, "b", "filled"), hold on
scatter(x(show(~in5)), y(show(~in5)), 2, "r", "filled"), hold off
axis square, axis([0 1 0 1])
title(sprintf("\\pi \\approx %.4f", piHat))
nexttile
semilogx(1:N, errRun), hold on
yline(0.01, "k--", "0.01"), hold off
xlabel("n"), ylabel("|estimate - \pi|"), grid on
title("Running error")
theme(gcf, "light")
exportgraphics(gcf, '../img/a62_monte_carlo_pi.png')
