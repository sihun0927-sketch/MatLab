% sol0602_1.m — 6.2 연습문제 1
% 하나의 primary 흐름과 두 개의 subfunction 으로 구성한다.
% subfunction 끼리 서로 호출할 수 있다.

clear; clc

sides = [3 4 5; 6 8 10; 2 3 4];

for k = 1:size(sides, 1)
    s = sides(k, :);
    fprintf('변 %s → 둘레 %5.2f, 넓이 %7.4f\n', ...
        mat2str(s), perimeter(s), heron_area(s));
end

function p = perimeter(s)
% PERIMETER  세 변의 합.
p = sum(s);
end

function A = heron_area(s)
% HERON_AREA  헤론의 공식. perimeter subfunction 을 다시 쓴다.
hp = perimeter(s) / 2;                       % 반둘레
A  = sqrt(hp * prod(hp - s));
end
