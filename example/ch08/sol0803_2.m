% sol0803_2.m — 8.3 연습문제 2: 처음으로 기준을 넘는 순간, 그리고 개수

clear; clc

t = 0:0.5:5;                        % 시간 (s)
h = 20*t - 4.9*t.^2;                % 높이 (m)

first = find(h > 15, 1)             % 처음 15 m 를 넘는 인덱스
fprintf("처음 15 m 초과: t = %.1f s, h = %.2f m\n", t(first), h(first));

last = find(h > 15, 1, "last");
fprintf("마지막 15 m 초과: t = %.1f s\n", t(last));

% 개수: numel(find(...)) 과 sum(...) 은 같다
[numel(find(h > 15)), sum(h > 15)]
