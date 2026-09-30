% sol0605_2.m — 6.5 연습문제 2
% fzero 로 근을, fminbnd 로 최솟값을, integral 로 넓이를 구한다.

clear; clc

f = @(x) x.^3 - 6*x.^2 + 9*x - 2;

r1 = fzero(f, 0);
r2 = fzero(f, 2);
r3 = fzero(f, 4);
fprintf('근 세 개: %.6f, %.6f, %.6f\n', r1, r2, r3);

[xmin, fmin] = fminbnd(f, 2, 4);
fprintf('구간 [2,4] 최솟값: x = %.6f, f = %.6f\n', xmin, fmin);

[xmax, negf] = fminbnd(@(x) -f(x), 0, 2);
fprintf('구간 [0,2] 최댓값: x = %.6f, f = %.6f\n', xmax, -negf);

A = integral(f, 0, 2);
fprintf('integral(f, 0, 2) = %.6f\n', A);

% 검산: 근에서의 함숫값은 0 에 아주 가깝다
fprintf('f(r2) = %.3e (0 에 가까움)\n', f(r2));
