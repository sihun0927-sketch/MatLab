% ex0301_function_io.m
% 3.1 함수의 세 가지 구성요소: 이름(name), 입력(input), 출력(output)
clear; clc

% 입력이 스칼라면 출력도 스칼라, 입력이 배열이면 출력도 배열
a = 5;
b = [1 2 3];
disp("sin(a) = " + sin(a))
disp("sin(b) = " + join(string(sin(b)), "  "))

% 입력이 두 개인 함수: rem(피제수, 제수)
fprintf("rem(10,3) = %g\n", rem(10,3))

% 출력이 두 개인 함수: size
d = [1 2 3; 4 5 6];
f = size(d);              % 출력 하나로 받으면 [행 열] 벡터
disp("f = " + join(string(f), "  "))

[rows, cols] = size(d);   % 대괄호로 각각 이름을 붙여 받는다
fprintf("rows = %d, cols = %d\n", rows, cols)

% 출력을 변수에 대입하지 않으면 기본 변수 ans에 저장된다
sqrt(85);
fprintf("ans = %.4f\n", ans)
