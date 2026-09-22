% sol0305_3.m  (3.5 연습문제 3)
% 조화급수 부분합과 log(10) 비교
clear; clc

k = 1:10;
s = cumsum(1./k);
disp("누적합 = " + join(string(round(s,4)), "  "))

fprintf("10항 합 = %.4f,  log(10) = %.4f,  더 큰가? %d\n", ...
        s(end), log(10), s(end) > log(10))
