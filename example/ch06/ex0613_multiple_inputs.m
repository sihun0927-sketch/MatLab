% ex0613_multiple_inputs.m — 입력이 여러 개인 함수 (6.1.3)

clear; clc

x = 1:5;
y = 5:-1:1;

disp('elemprod(x, y) =')
disp(elemprod(x, y))

% 한쪽이 스칼라면 스칼라 확장이 일어난다
disp('elemprod(x, 10) =')
disp(elemprod(x, 10))

% 함수 안에서 쓰인 중간 변수 a 는 workspace 에 남지 않는다
disp('workspace 변수 목록:')
who

% exist('a','var') 는 0 — a 는 elemprod 안에서만 살아있던 local variable
fprintf('exist(''a'', ''var'') = %d\n', exist('a', 'var'));
