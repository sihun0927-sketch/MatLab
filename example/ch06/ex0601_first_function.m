% ex0601_first_function.m — 별도 파일로 저장한 함수 호출하기 (6.1.1)
% mypoly.m 은 같은 폴더에 있는 독립 함수 파일이다.
% 파일 이름(mypoly.m)과 함수 이름(mypoly)이 반드시 같아야 한다.

clear; clc

x = 0:0.5:2;
y = mypoly(x);

disp('x =')
disp(x)
disp('mypoly(x) =')
disp(y)

% 스칼라 하나만 넣어도 된다
fprintf('mypoly(2) = %g\n', mypoly(2));

% 행렬을 넣으면 원소별로 계산된다
M = [1 2; 3 4];
disp('mypoly([1 2; 3 4]) =')
disp(mypoly(M))
