% 정답 47: 주어진 출력을 만드는 meshgrid 계산
clear, clc
x = 1:4;
y = [10 20 30];
[X, Y] = meshgrid(x, y)
Z = X.^2 + Y
colsum = sum(Z)
rowmax = max(Z, [], 2)'
big = Z(Z > 25)'
