% 정답 30: 주어진 출력을 만드는 특수 행렬 명령
clear, clc
A = zeros(2, 3)
B = ones(3) * 7
C = diag([5 6 7])
D = magic(4);
d1 = diag(D)'
d2 = diag(D, -1)'
E = fliplr(D(1, :))
F = sum(D, 2)'
G = [ones(2, 1), zeros(2, 2)]
