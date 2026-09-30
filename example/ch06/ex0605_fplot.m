% ex0605_fplot.m — function function: 함수를 입력으로 받는 함수 (6.5)
% fplot 은 "그릴 함수"와 "구간"을 받는다. 데이터 배열이 아니라 함수 자체를 넘긴다.

clear; clc; close all

f = @(x) exp(-x/3) .* sin(2*x);

tiledlayout(1, 2)

nexttile
fplot(f, [0 10], LineWidth=1.5)
grid on
xlabel('x'); ylabel('f(x)')
title('fplot(@(x) exp(-x/3).*sin(2x))')

% 이름 있는 함수도 handle 로 넘기면 된다
nexttile
fplot(@mypoly, [-2 2], LineWidth=1.5)
grid on
xlabel('x'); ylabel('mypoly(x)')
title('fplot(@mypoly, [-2 2])')

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/ex0605_fplot.png')
