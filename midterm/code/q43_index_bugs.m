% 문제 43: 배열 인덱싱 연습. 각 줄의 결과를 예상하라.
clear, clc
x = [10 20 30 40 50];
first = x(0)
mid = x(2.5)
x(7) = 70
M = [1 2 3; 4 5 6; 7 8 9];
row4 = M(4, :)
M(:, 2) = []
col = M(:, 3)
last = M(end, end)
v = M(2, 1:end)
