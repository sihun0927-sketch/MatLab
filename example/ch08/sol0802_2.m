% sol0802_2.m — 8.2 연습문제 2: flowchart → 짝수/홀수 판정

clear; clc

% Start
% Input: 정수 n 을 받는다 (평행사변형)
if usejava('desktop')
    n = input("정수를 입력하시오: ");
else
    n = 7;
    fprintf("정수를 입력하시오: %d\n", n);
end

% Decision: n 을 2 로 나눈 나머지가 0 인가? (마름모)
if mod(n, 2) == 0
    % Output: 짝수 (평행사변형)
    fprintf("%d 는 짝수\n", n);
else
    % Output: 홀수 (평행사변형)
    fprintf("%d 는 홀수\n", n);
end
% End

% 배열이라면 if 대신 logical indexing
v = 1:10;
fprintf("짝수: %s\n", mat2str(v(mod(v, 2) == 0)));
