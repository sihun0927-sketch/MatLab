% sol0308_2.m  (3.8 연습문제 2)
clear; clc

x = 1e-320;     % realmin 보다 작다. 비정규화 수로 간신히 저장된다.
fprintf("x        = %g\n", x)
fprintf("x/10     = %g\n", x/10)
fprintf("x/1e10   = %g   <- 언더플로로 0\n", x/1e10)
fprintf("realmin  = %.4e   (x 는 이미 realmin 보다 작다)\n", realmin)
