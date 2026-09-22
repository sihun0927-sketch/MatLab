% sol0304_3.m  (3.4 연습문제 3)
% cos(pi/2) 가 0 이 아닌 이유
clear; clc

v = cos(pi/2);
fprintf("cos(pi/2) = %.4e\n", v)
disp("pi 는 무리수라서 double 로 정확히 저장되지 않는다.")
disp("따라서 pi/2 도 정확한 90도가 아니고, 그 코사인도 정확한 0 이 아니다.")

fprintf("v == 0            : %d\n", v == 0)
fprintf("abs(v) < 1e-12    : %d   <- 이렇게 판정한다\n", abs(v) < 1e-12)
