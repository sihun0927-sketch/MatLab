% ex0722_multiple_arrays.m — 배열 인수를 여러 개 주면 생기는 함정 (7.2.2)
% fprintf 는 "첫 배열을 전부 쓴 뒤에" 다음 배열로 넘어간다.
% 행렬 하나로 묶었을 때와는 전혀 다른 결과가 나온다.

clear; clc

feet = 1:3;
inches = feet * 12;

disp('--- 의도: 1 feet = 12 inches ... ---')
fprintf('%4.0f feet = %6.0f inches\n', [feet; inches]);

disp(' ')
disp('--- fprintf(fmt, feet, inches) 로 쓰면 ---')
fprintf('%4.0f feet = %6.0f inches\n', feet, inches);
fprintf('(feet 의 1 2 3 을 먼저 다 쓰고 나서 inches 로 넘어간다)\n');

disp(' ')
disp('--- 소비 순서는 모든 인수를 이어 붙인 것과 같다 ---')
disp([feet(:); inches(:)]')

disp(' ')
disp('--- 인수가 스칼라들일 때는 이 동작이 자연스럽다 ---')
a = 3; b = 4;
fprintf('%d + %d = %d\n', a, b, a + b);

disp(' ')
disp('--- 짝을 맞추는 올바른 방법 두 가지 ---')
fprintf('(1) 행으로 쌓기:   ');
fprintf('%d/%d ', [feet; inches]); fprintf('\n');
fprintf('(2) 전치한 뒤 (:)'': ');
M = [feet', inches']';
fprintf('%d/%d ', M); fprintf('\n');
