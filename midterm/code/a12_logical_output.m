% 정답 12: 주어진 출력을 만드는 관계·논리 연산
clear, clc
x = [3 8 1 9 6 2 7]
big = x > 5
idx = find(big)
vals = x(x > 5 & x < 9)
cnt = sum(~big)
y = [1 2 3; 4 5 6; 7 8 9];
[r, c] = find(y > 4 & rem(y, 2) == 0)
flag = xor(x > 2, x < 7)
