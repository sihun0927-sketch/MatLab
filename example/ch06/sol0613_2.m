% sol0613_2.m — 6.1.3 연습문제 2
% 벡터의 평균, 표준편차, 개수를 한 번에 반환하는 함수.
% 출력을 일부만 받으면 어떻게 되는지 확인한다.

clear; clc

v = [12 7 19 3 25 8 14];

[m, s, n] = stats(v);
fprintf('평균 %.4f, 표준편차 %.4f, 개수 %d\n', m, s, n);

% 첫 번째 출력만
only_mean = stats(v);
fprintf('출력 1개만 받으면 평균: %.4f\n', only_mean);

% 두 번째만 필요하면 ~ 로 건너뛴다
[~, only_std] = stats(v);
fprintf('~ 로 건너뛰고 표준편차: %.4f\n', only_std);

function [m, s, n] = stats(v)
% STATS  벡터의 평균, 표준편차, 원소 개수를 반환한다.
m = mean(v);
s = std(v);
n = numel(v);
end
