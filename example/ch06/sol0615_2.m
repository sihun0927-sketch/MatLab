% sol0615_2.m — 6.1.5 연습문제 2
% varargout 으로 요청된 개수만큼만 통계량을 반환하는 함수.
% varargin 으로 개수가 정해지지 않은 입력을 받는 함수.

clear; clc

v = [4 8 15 16 23 42];

a        = describe(v);
[b1, b2] = describe(v);
[c1, c2, c3, c4] = describe(v);
fprintf('출력 1개: 평균 %.4f\n', a);
fprintf('출력 2개: %.4f, %.4f\n', b1, b2);
fprintf('출력 4개: %.4f, %.4f, %.4f, %.4f\n', c1, c2, c3, c4);

% varargin: 여러 벡터를 이어 붙여 평균 내기
fprintf('mean_all(1:3, [10 20], 100) = %.4f\n', mean_all(1:3, [10 20], 100));

function varargout = describe(v)
% DESCRIBE  요청된 개수만큼 평균, 표준편차, 최솟값, 최댓값을 순서대로 반환한다.
values = {mean(v), std(v), min(v), max(v)};
for k = 1:nargout
    varargout{k} = values{k};
end
end

function m = mean_all(varargin)
% MEAN_ALL  입력으로 들어온 모든 수의 전체 평균.
total = 0;
count = 0;
for k = 1:nargin
    total = total + sum(varargin{k}, 'all');
    count = count + numel(varargin{k});
end
m = total / count;
end
