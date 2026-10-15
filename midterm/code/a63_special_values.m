% 정답 63: 배열 생성·빈 배열·특수값·정수형 출력 재현
clear, clc
x = 10:-3:-2
y = 5:1
e = isempty(y)
z = [1 -1], w = [1 - 1]
B = ones(2, 3)*2;
B(:, end+1) = [9; 9]
I = eye(2)*5
v = [1/0 -1/0 0/0 Inf-Inf]
q = NaN == NaN
k = isnan(v)
a = int8(200)
b = intmax("int8") + 1
c = int8(2.5)
d = 5/int8(2)
cls = class(d)
