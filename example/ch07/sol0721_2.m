% sol0721_2.m — 7.2.1 연습문제 2
% 벡터를 한 줄로 보여 준다. 배열을 그대로 이으면 왜 여러 줄이 되는지 확인한다.

clear; clc

v = [2 4 6 8 10];

disp('--- 그냥 이으면 원소마다 한 줄씩 ---')
disp("값: " + v)
fprintf('("값: " + v) 의 크기 = %s  ← 1x5 string 배열이라 5 줄\n', mat2str(size("값: " + v)));

disp(' ')
disp('--- num2str 로 배열 전체를 한 덩어리 글자로 ---')
disp("값: " + num2str(v))
fprintf('num2str(v) 의 크기 = %s  ← 1 줄짜리 char\n', mat2str(size(num2str(v))));

disp(' ')
disp('--- join 으로 구분자를 고르기 ---')
disp("값: " + join(string(v), ", "))

disp(' ')
disp('--- strjoin 은 cell of char 를 받는다 ---')
disp(['값: ' strjoin(cellstr(num2str(v')), ' | ')])

disp(' ')
disp('--- 자릿수를 맞춰 정렬하고 싶다면 sprintf ---')
w = [1.5 22.25 333.125];
disp("값: " + strtrim(sprintf('%9.3f', w)))
