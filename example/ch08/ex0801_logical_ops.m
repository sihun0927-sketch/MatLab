% ex0801_logical_ops.m — 논리 연산자 6개 (8.1)

clear; clc

x = [1, 2, 3, 4, 5];
y = [-2, 0, 2, 4, 6];
z = [8, 8, 8, 8, 8];

%% and: z 가 x 보다 크고 그리고 y 보다도 크다
z > x & z > y               % 1 1 1 1 1

%% or: x 가 y 보다 크거나 또는 z 보다 크다
x > y | x > z               % 1 1 1 0 0

%% not
~(x > y)                    % 0 0 0 1 1

%% xor: 둘 중 정확히 하나만 참일 때 참
xor(x > 2, y > 2)           % 0 0 1 0 0

%% 우선순위: 관계 연산자가 & 보다 먼저, & 가 | 보다 먼저
a = 1; b = 0; c = 1;
a | b & ~c                  % a | (b & (~c)) = 1

%% &&, || 는 스칼라 전용 (shortcut / short-circuit)
k = 0;
k ~= 0 && 10/k > 1          % 앞이 거짓이므로 뒤(10/k)를 계산하지 않는다 → 0

try
    x > 0 && y > 0          % 배열이면 오류
catch err
    fprintf('오류: %s\n', err.message);
end

% 배열 전체를 하나의 참/거짓으로 줄이려면 all/any
all(x > 0) && all(y > 0)    % 0
