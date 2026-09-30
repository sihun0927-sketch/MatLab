% sol0613_1.m — 6.1.3 연습문제 1
% 두 변의 길이를 받아 빗변과 두 예각을 반환하는 함수 (입력 2, 출력 3)

clear; clc

a = [3 5 8];
b = [4 12 15];

[c, A, B] = right_triangle(a, b);

disp(table(a(:), b(:), c(:), A(:), B(:), ...
    VariableNames=["a", "b", "빗변", "A각(deg)", "B각(deg)"]))

% 출력을 하나만 받으면 빗변만 돌아온다
fprintf('빗변만: %s\n', mat2str(right_triangle(a, b)));

function [c, angleA, angleB] = right_triangle(a, b)
% RIGHT_TRIANGLE  직각삼각형의 빗변과 두 예각(도)을 구한다.
%   [c, A, B] = RIGHT_TRIANGLE(a, b)
c      = sqrt(a.^2 + b.^2);
angleA = atand(a ./ b);
angleB = 90 - angleA;
end
