% sol0605_1.m — 6.5 연습문제 1
% fplot 에 function handle 을 넘겨 두 함수를 한 축에 그린다.

clear; clc; close all

damped = @(x) exp(-x/4) .* cos(3*x);
envel  = @(x) exp(-x/4);

fplot(damped, [0 12], LineWidth=1.5); hold on
fplot(envel,  [0 12], '--', LineWidth=1.2)
fplot(@(x) -envel(x), [0 12], '--', LineWidth=1.2)
hold off
grid on
xlabel('x'); ylabel('y')
title('fplot 에 handle 넘기기')
legend(["exp(-x/4)cos(3x)", "포락선 +", "포락선 -"], Location="northeast")

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/sol0605_1.png')

% 데이터 배열을 만들지 않고 함수 자체를 넘긴 점이 plot 과 다르다
fprintf('fplot 은 구간만 주면 알아서 점을 고른다.\n');
