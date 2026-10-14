% 정답 13: nargin으로 기본값을 갖는 함수, 다중 출력, 함수 핸들, fplot
clear, clc, clf
t = 0:2:10;
[d_earth, v_earth] = freefall(t);          % g 생략 → 9.8
[d_moon, v_moon] = freefall(t, 1.6);
fprintf('%4.0f s: Earth %7.1f m (%5.1f m/s) | Moon %6.1f m (%4.1f m/s)\n', ...
        [t; d_earth; v_earth; d_moon; v_moon])
moon_fall = @(t) freefall(t, 1.6);         % 두 번째 입력을 고정한 핸들
fplot(moon_fall, [0 10], "r--", LineWidth = 1.5)
title("Free fall on the Moon"), xlabel("t, s"), ylabel("d, m"), grid on
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a13_function_nargin.png')

function [d, v] = freefall(t, g)
% FREEFALL 자유낙하 거리 d와 속도 v. g를 생략하면 9.8 m/s^2
if nargin < 2
    g = 9.8;
end
d = 0.5*g*t.^2;
v = g*t;
end
