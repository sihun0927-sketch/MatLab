% ex0800_sequence.m — 세 가지 control structure 중 sequence (8장 도입)
% 지금까지 쓴 코드는 전부 sequence 였다. 위에서 아래로 한 줄씩, 빠짐없이 실행된다.

clear; clc

r = 2;              % 1. 반지름을 정한다
A = pi * r^2;       % 2. 넓이를 구한다
C = 2 * pi * r;     % 3. 둘레를 구한다
fprintf('r = %g → A = %.4f, C = %.4f\n', r, A, C)   % 4. 출력한다

% selection(선택) 구조는 조건에 따라 실행할 줄을 고른다 — 8장
if A > 10
    disp('selection: 넓이가 10 보다 크다')
end

% repetition(반복) 구조는 같은 줄을 여러 번 실행한다 — 9장
for k = 1:3
    fprintf('repetition: %d 번째\n', k)
end
