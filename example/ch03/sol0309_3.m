% sol0309_3.m  (3.9 연습문제 3)
clear; clc

fprintf("0/0     = %g   (정의되지 않음 -> NaN)\n", 0/0)
fprintf("1/0     = %g\n", 1/0)
fprintf("-1/0    = %g\n", -1/0)
fprintf("Inf-Inf = %g   (NaN)\n", Inf-Inf)
fprintf("Inf*0   = %g   (NaN)\n", Inf*0)
fprintf("Inf+1   = %g   (여전히 Inf)\n", Inf+1)
