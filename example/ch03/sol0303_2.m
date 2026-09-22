% sol0303_2.m  (3.3 연습문제 2)
% 소인수분해와 검산
clear; clc

n = 720;
f = factor(n);
disp("factor(720) = " + join(string(f), "  "))
fprintf("prod(f) = %d,  원래 값과 같은가? %d\n", prod(f), prod(f) == n)
