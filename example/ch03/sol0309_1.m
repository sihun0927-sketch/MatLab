% sol0309_1.m  (3.9 연습문제 1)
clear; clc

v = [3 NaN 7 NaN 12];
fprintf("mean(v)            = %g   <- NaN 에 오염됨\n", mean(v))
fprintf("mean(v,'omitnan')  = %g\n", mean(v, "omitnan"))
fprintf("mean(v(~isnan(v))) = %g   <- 직접 걸러도 같다\n", mean(v(~isnan(v))))
fprintf("NaN 개수 = %d\n", sum(isnan(v)))
