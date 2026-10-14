% 정답 39: tiledlayout 수정본. "두 칸 폭"은 2x2에서 불가능 → 3열 격자로 바꾼다
clear, clc, clf
x = 0:pi/20:2*pi;
t = tiledlayout(2, 3);                    % 출력 억제, 3열이어야 두 칸 폭이 가능
nexttile
plot(x, sin(x)), title("sin")
nexttile(2, [1 2])                        % 타일 2부터 1행 2열 폭
plot(x, cos(x)), title("cos")
nexttile
polarplot(x, 1 + cos(x)), title("polar")  % polarplot(theta, r)
nexttile
semilogy(x, exp(x)), title("log y")
title(t, "Trig layout")                   % 전체 제목은 layout 객체에
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a39_tiled_bugs.png')
