% sol0721_3.m — 7.2.1 연습문제 3
% 아포스트로피와 큰따옴표가 들어간 문장을 세 가지 방법으로 출력한다.

clear; clc

% 목표 1: It's a trap!
disp('--- char 안의 아포스트로피: '''' 로 두 번 ---')
disp('It''s a trap!')

disp('--- string 안이면 한 번만 쳐도 된다 ---')
disp("It's a trap!")

disp(' ')
% 목표 2: She said "no" twice.
disp('--- string 안의 큰따옴표: "" 로 두 번 ---')
disp("She said ""no"" twice.")

disp('--- char 안이면 한 번만 쳐도 된다 ---')
disp('She said "no" twice.')

disp(' ')
% 목표 3: 둘 다 들어간 문장
disp('--- 둘 다 들어가면 어느 쪽을 쓰든 하나는 두 번 쳐야 한다 ---')
disp('He said "it''s fine" and left')
disp("He said ""it's fine"" and left")

disp(' ')
disp('--- fprintf 의 format 에도 같은 규칙 ---')
fprintf('%s\n', 'It''s a trap!');
fprintf("%s\n", "She said ""no"" twice.");
fprintf('따옴표를 변수로 넘기면 규칙을 신경 쓰지 않아도 된다: %s %s\n', '"', char(39));
