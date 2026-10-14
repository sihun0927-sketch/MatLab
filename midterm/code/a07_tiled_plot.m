% 정답 07: tiledlayout 2x2, 아래 행은 하나로 합침
clear, clc, clf
t = 0:0.25:10;                       % s
v = 20*exp(-0.3*t);                  % m/s
d = cumsum(v)*0.25;                  % m (근사 적분)
tl = tiledlayout(2, 2);
nexttile
plot(t, v, "b-o", MarkerSize = 4)
title("Velocity"), xlabel("t, s"), ylabel("v, m/s"), grid on
nexttile
semilogy(t, v, "r--")
title("Velocity (log scale)"), xlabel("t, s"), ylabel("v, m/s"), grid on
nexttile(3, [1 2])
plot(t, d, LineWidth = 2)
title("Distance"), xlabel("t, s"), ylabel("d, m"), grid minor
title(tl, ["Decaying Motion"; "v = 20e^{-0.3t}"])
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a07_tiled_plot.png')
