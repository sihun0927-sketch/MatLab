% sol0301_1.m  (3.1 연습문제 1)
% x 각 원소의 절댓값의 제곱근
clear; clc

x = [4 -9 16 -25];
y = sqrt(abs(x));      % 함수는 배열 입력을 그대로 받는다
disp("x = " + join(string(x), "  "))
disp("y = " + join(string(y), "  "))
