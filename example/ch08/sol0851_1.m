% sol0851_1.m — 8.5.1 연습문제 1: 압력 경고 (스칼라와 배열)

clear; clc

limit = 100;

p = 120;
if p > limit
    fprintf("경고: 압력 %g 이 한계 %g 를 넘었다\n", p, limit);
end

% 배열: 하나라도 넘으면 경고하고 싶다
p = [80, 95, 130, 90];
if p > limit
    disp("이 줄은 실행되지 않는다 (모든 원소가 넘어야 참)")
end
if any(p > limit)
    fprintf("경고: %d 번째 측정값 %g 이 한계를 넘었다\n", [find(p > limit); p(p > limit)]);
end
