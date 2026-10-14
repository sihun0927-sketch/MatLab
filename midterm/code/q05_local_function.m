% 문제 05: 반지름 벡터의 원 넓이와 둘레를 local function으로 계산해
%          r마다 한 줄씩 출력한다.
clear, clc
r = [1 2 3];
area = circle_stats(r);
fprintf('r = %g: area = %.3f, circ = %.3f\n', [r; area; circ])

function [area, circ] = circle_stats(r)
% CIRCLE_STATS 반지름 r(벡터 가능)의 넓이와 둘레
area = pi*r^2;
circ = 2*pi*r;
