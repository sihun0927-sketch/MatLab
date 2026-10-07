% sol0852_2.m — 8.5.2 연습문제 2: abs 없이 절댓값 (if/else 와 logical indexing)

clear; clc

%% 스칼라: if/else
x = -7;
if x < 0
    y = -x;
else
    y = x;
end
y

%% 배열: if 에 넣으면 전체가 한 번에 판정되므로 틀린다
x = [-7, 3, -2, 0];
if x < 0
    y = -x;
else
    y = x;          % 모든 원소가 음수는 아니므로 여기로 → 그대로
end
y                   % -7 3 -2 0  ← 틀렸다

%% 배열은 logical indexing
y = x;
y(x < 0) = -x(x < 0)
isequal(y, abs(x))
