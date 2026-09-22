% ex0303_factorial_limit.m
% 3.3.3 factorial 의 한계와 nchoosek
clear; clc

fprintf("factorial(5)   = %d\n", factorial(5))
fprintf("5*4*3*2*1      = %d\n", 5*4*3*2*1)

% double 로 표현 가능한 마지막 팩토리얼은 170!
fprintf("factorial(170) = %.4e\n", factorial(170))
fprintf("factorial(171) = %g   <- 오버플로로 Inf\n", factorial(171))

% 200명 중 2명 팀 조합 수
fprintf("nchoosek(200,2) = %d\n", nchoosek(200,2))

% 정의식으로 계산하면 Inf/Inf 가 되어 NaN 이 된다
bad = factorial(200)/(factorial(198)*factorial(2));
fprintf("factorial(200)/(factorial(198)*factorial(2)) = %g\n", bad)
