% sol0308_3.m  (3.8 연습문제 3)
clear; clc

a = 1/3;
b = 0.333333333333333;

fprintf("a == b              : %d\n", a == b)
fprintf("abs(a-b)            : %.4e\n", abs(a-b))
fprintf("abs(a-b) < eps      : %d\n", abs(a-b) < eps)
fprintf("abs(a-b) < 1e-15    : %d\n", abs(a-b) < 1e-15)
disp("허용 오차를 얼마로 잡느냐에 따라 '같다'의 판정이 달라진다.")
