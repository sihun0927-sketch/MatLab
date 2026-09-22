% sol0301_2.m  (3.1 연습문제 2)
% size 의 두 출력을 각각 이름에 받는다
clear; clc

A = [1 2 3 4; 5 6 7 8; 9 10 11 12];
[nrow, ncol] = size(A);
fprintf("%d행 %d열\n", nrow, ncol)
