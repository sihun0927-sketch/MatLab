% ex0605_fzero_fminbnd.m — fzero, fminbnd, integral (6.5)
% [보강] 슬라이드는 fplot 만 다루지만, 같은 "함수를 인수로 받는 함수" 무리다.

clear; clc; close all

f = @(x) exp(-x/3) .* sin(2*x);

% fzero: 근(값이 0 이 되는 x) 을 찾는다. 두 번째 인수는 시작점 또는 구간이다.
r1 = fzero(f, 1.5);
r2 = fzero(f, [2 4]);       % 구간 양 끝의 부호가 달라야 한다
fprintf('fzero(f, 1.5)   = %.6f\n', r1);
fprintf('fzero(f, [2 4]) = %.6f\n', r2);

% fminbnd: 구간 안의 최솟값을 찾는다
[xmin, fmin] = fminbnd(f, 1, 4);
fprintf('fminbnd(f, 1, 4): x = %.6f, f = %.6f\n', xmin, fmin);

% 최댓값은 부호를 뒤집어 최솟값 문제로 바꾼다
[xmax, negmax] = fminbnd(@(x) -f(x), 0, 2);
fprintf('최댓값: x = %.6f, f = %.6f\n', xmax, -negmax);

% integral: 정적분도 함수를 인수로 받는다
A = integral(f, 0, 10);
fprintf('integral(f, 0, 10) = %.6f\n', A);

% 그림으로 확인
fplot(f, [0 10], LineWidth=1.5); hold on
yline(0, 'k:')
plot([r1 r2], f([r1 r2]), 'ro', MarkerFaceColor='r')
plot(xmin, fmin, 'bs', MarkerFaceColor='b')
plot(xmax, -negmax, 'g^', MarkerFaceColor='g')
hold off
grid on
legend(["f(x)", "", "fzero 근", "fminbnd 최솟값", "최댓값"], Location="northeast")
xlabel('x'); ylabel('f(x)')
title('fzero / fminbnd 결과')

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/ex0605_fzero_fminbnd.png')
