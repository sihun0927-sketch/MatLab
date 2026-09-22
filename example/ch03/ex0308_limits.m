% ex0308_limits.m
% 3.8 계산 한계 (Table 3.15)
clear; clc

fprintf("realmax = %.4e\n", realmax)
fprintf("realmin = %.4e\n", realmin)
fprintf("intmax  = %d\n", intmax)     % 기본은 int32
fprintf("intmin  = %d\n", intmin)
fprintf("intmax('int64') = %d\n", intmax("int64"))

% 지수 오버플로: 표현 범위를 넘으면 Inf
x = 2.5e200;
y = 1.0e200;
fprintf("2.5e200 * 1.0e200 = %g   <- exponent overflow\n", x*y)

% 지수 언더플로: 너무 작으면 0
x = 25e-200;
y = 1.0e200;
fprintf("25e-200 / 1.0e200 = %g   <- exponent underflow\n", x/y)

% eps: 1 과 그 다음 double 사이의 간격
fprintf("eps      = %.4e\n", eps)
fprintf("1+eps/2 == 1 : %d   <- 더해도 값이 바뀌지 않는다\n", (1+eps/2) == 1)
fprintf("0.1+0.2 == 0.3 : %d\n", (0.1+0.2) == 0.3)
fprintf("abs((0.1+0.2)-0.3) < eps : %d   <- 이렇게 비교해야 한다\n", abs((0.1+0.2)-0.3) < eps)
