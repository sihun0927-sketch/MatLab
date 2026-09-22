% ex0309_shadowing.m
% 3.9 함수명을 변수명으로 쓰면 함수가 가려진다 (shadowing)
clear; clc

x = [1 5 3];

% 흔한 실수: 결과를 max 라는 이름에 담는다
max = max(x);        %#ok<*NASGU>
fprintf("변수 max = %g\n", max)

try
    y = max(x);      % 이제 max 는 함수가 아니라 1x1 배열이다
catch err
    fprintf("오류 발생: %s\n", err.message)
end

clear max            % 변수를 지우면 함수가 되살아난다
fprintf("clear 후 max(x) = %g\n", max(x))

% sin 으로도 같은 일이 벌어진다
sin = 10;
try
    sin(5)
catch err
    fprintf("오류 발생: %s\n", err.message)
end
clear sin
fprintf("clear 후 sin(0) = %g\n", sin(0))

% 이름이 가려졌는지 확인하는 방법
which max
