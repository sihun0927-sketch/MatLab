% ex0721_disp_concat.m — disp 하나로 글자와 숫자를 같이 내보내기 (7.2.1)
% disp 는 배열 하나만 받으므로, 여러 정보를 보이려면
%   (a) disp 를 여러 번 쓰거나
%   (b) 하나의 배열로 합쳐서 넘겨야 한다.

clear; clc

x = 5;
y = string(x);     % 숫자를 string 으로

disp('=== (a) disp 두 번 ===')
disp("The answer is")
disp(x)

disp(' ')
disp('=== (b) string 끼리 + 로 이어 붙여 한 번에 ===')
disp("The answer is " + y)

% string 과 숫자를 + 로 이으면 MATLAB 이 알아서 숫자를 글자로 바꿔 준다
disp("바로 숫자를 더해도 된다: " + x)

disp(' ')
disp('=== 배열을 이으면 결과도 배열이 되어 여러 줄이 나온다 ===')
v = [1 2 3];
disp("x 는 " + v)          % 1x3 string → 세 줄

disp(' ')
disp('=== 한 줄에 다 넣으려면 num2str 로 배열 전체를 글자로 ===')
disp("x 는 " + num2str(v))
fprintf('num2str(v) 의 클래스 = %s  ← 이름과 달리 char 를 만든다\n', class(num2str(v)));
fprintf('num2str(v) 의 크기   = %s\n', mat2str(size(num2str(v))));

disp(' ')
disp('=== char 배열끼리는 대괄호로 잇는다 (+ 가 아니다) ===')
disp(['x 는 ' num2str(v) ' 이다'])
fprintf('[''a''] + [''b''] 는 글자를 잇지 않고 더한다: %s\n', mat2str('a' + 'b'));

disp(' ')
disp('=== num2str 의 자릿수 지정 ===')
disp("기본값:      " + num2str(pi))
disp("num2str(pi,8): " + num2str(pi, 8))
disp("포맷 지정:    " + num2str(pi, '%8.4f'))
