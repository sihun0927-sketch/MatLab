% ex0722_array_column.m — 배열을 주면 format string 이 반복된다 (7.2.2)
% 값이 남아 있는 동안 format string 을 되풀이한다.
% 2차원 배열은 "열 우선"(column dominant)으로 소비된다.

clear; clc

feet = 1:5;
inches = feet * 12;

disp('--- 1 차원 배열: format 이 값 개수만큼 반복된다 ---')
fprintf('%4.0f feet = %6.0f inches\n', [feet; inches]);

disp(' ')
disp('--- 왜 [feet; inches] 로 쌓았는가 ---')
conversions = [feet; inches];
fprintf('conversions 의 크기 = %s  (1 행 feet, 2 행 inches)\n', mat2str(size(conversions)));
disp(conversions)
fprintf('열 우선으로 읽으면 %s, %s, ... 순서가 된다\n', ...
    mat2str(conversions(:,1)'), mat2str(conversions(:,2)'));

disp(' ')
disp('--- 실제 소비 순서: A(:) 와 같다 ---')
disp(conversions(:)')

disp(' ')
disp('--- 행으로 쌓으면(틀린 방법) 짝이 어긋난다 ---')
wrong = [feet', inches'];      % 5x2
fprintf('%4.0f feet = %6.0f inches\n', wrong);
fprintf('(feet 끼리 짝지어졌다. 열 우선이라 1 열을 먼저 다 쓴다.)\n');

disp(' ')
disp('--- 값이 format 자리수로 딱 나누어떨어지지 않으면 ---')
fprintf('%d-%d|', [1 2 3 4 5]);
fprintf('\n(마지막 5 는 짝이 없어 거기서 멈춘다)\n');
