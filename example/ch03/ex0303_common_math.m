% ex0303_common_math.m
% 3.3.1 기본 수학 함수 (Table 3.1)
clear; clc

x = [-8 -3 0 4 85];

disp("abs(x)   = " + join(string(abs(x)), "  "))
disp("sign(x)  = " + join(string(sign(x)), "  "))
fprintf("sqrt(85)      = %.4f\n", sqrt(85))

% nthroot 는 실수 n제곱근을 준다. ^(1/3) 과 결과가 다르다.
fprintf("nthroot(-2,3) = %.4f\n", nthroot(-2,3))
z = (-2)^(1/3);
fprintf("(-2)^(1/3)    = %.4f %+.4fi  (복소수)\n", real(z), imag(z))

fprintf("rem(25,4)     = %g\n", rem(25,4))
fprintf("mod(-25,4)    = %g   (rem 과 부호 처리가 다르다)\n", mod(-25,4))
fprintf("rem(-25,4)    = %g\n", rem(-25,4))

% 지수와 로그
fprintf("exp(10)       = %.4e\n", exp(10))
fprintf("log(10)       = %.4f   (자연로그 ln)\n", log(10))
fprintf("log10(10)     = %.4f\n", log10(10))
fprintf("log2(8)       = %.4f\n", log2(8))

% 임의 밑의 로그는 밑변환 공식으로 직접 계산한다
base = 3; value = 81;
fprintf("log_3(81)     = %.4f\n", log(value)/log(base))
