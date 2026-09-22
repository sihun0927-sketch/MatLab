% ex0309_special_values.m
% 3.9 특수값과 기타 함수 (Table 3.16)
clear; clc

fprintf("pi   = %.4f\n", pi)
fprintf("pi() = %.4f   <- pi 는 상수가 아니라 입력이 없는 함수다\n", pi())
fprintf("i = %g %+gi,  j = %g %+gi\n", real(i), imag(i), real(j), imag(j))

% Inf 와 NaN
warning("off", "MATLAB:divideByZero")
fprintf("5/0     = %g\n", 5/0)
fprintf("-5/0    = %g\n", -5/0)
fprintf("0/0     = %g   <- 정의되지 않으면 NaN\n", 0/0)
fprintf("Inf/Inf = %g\n", Inf/Inf)

% NaN 은 자기 자신과도 같지 않다. isnan 으로 판정한다.
v = [1 NaN 3];
fprintf("NaN == NaN : %d\n", NaN == NaN)
disp("isnan(v)   = " + join(string(isnan(v)), "  "))
fprintf("sum(v)          = %g   <- NaN 하나가 전체를 오염시킨다\n", sum(v))
fprintf("sum(v,'omitnan') = %g\n", sum(v, "omitnan"))

% 시간 함수
fprintf("eps = %.4e\n", eps)
c = clock;
fprintf("clock = [%d %d %d %d %d %.3f]\n", c(1), c(2), c(3), c(4), c(5), c(6))
disp("date = " + string(date))
disp("datetime('now') = " + string(datetime("now")))
