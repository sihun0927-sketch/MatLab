% sol0853_2.m — 8.5.3 연습문제 2: 순서가 틀린 elseif 찾기

clear; clc

score = 95;

% 틀린 코드: 가장 넓은 조건이 맨 앞에 있다
if score >= 60
    g = "D";
elseif score >= 70
    g = "C";
elseif score >= 80
    g = "B";
elseif score >= 90
    g = "A";
else
    g = "F";
end
fprintf("틀린 순서: %g → %s\n", score, g);    % D !

% 고친 코드: 좁은(높은) 조건부터
if score >= 90
    g = "A";
elseif score >= 80
    g = "B";
elseif score >= 70
    g = "C";
elseif score >= 60
    g = "D";
else
    g = "F";
end
fprintf("고친 순서: %g → %s\n", score, g);    % A
