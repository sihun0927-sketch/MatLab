% ex0721_disp_basics.m — 배열 내용을 보여주는 가장 단순한 방법들 (7.2.1)
% 1) 세미콜론을 빼면 이름 = 값 형태로 출력된다
% 2) disp 는 이름 없이 값만 출력한다

clear; clc

x = 1:5;

disp('--- 세미콜론 없이 정의: 이름과 값이 같이 나온다 ---')
x = 1:5    %#ok<NOPTS>  일부러 세미콜론을 뺐다

disp('--- 이름만 다시 쳐도 같다 ---')
x          %#ok<NOPTS>

disp('--- disp(x): 이름 없이 값만 ---')
disp(x)

% disp 는 숫자에도 글자에도 쓴다
disp(pi)
disp('disp 는 char 도 그대로 출력한다')
disp("string 도 마찬가지")

% disp 는 입력을 "하나"만 받는다. 둘을 주면 오류다.
try
    disp('값은 ', x)
catch err
    fprintf('disp(''값은 '', x) → 오류: %s\n', err.message);
end

% 행렬도 모양 그대로
A = magic(3);
disp('A = ')
disp(A)

% 빈 배열을 disp 하면 아무것도 출력하지 않는다 (줄바꿈조차 없다)
disp('빈 배열 disp 전후:')
disp([])
disp('(위 두 줄 사이에 아무것도 없다)')
