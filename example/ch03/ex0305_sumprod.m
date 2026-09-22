% ex0305_sumprod.m
% 3.5.3 합과 곱, 누적합 (Table 3.7)
clear; clc

x = [1 5 3
     2 4 6];

disp("sum(x)     = " + join(string(sum(x)), "  "))
disp("prod(x)    = " + join(string(prod(x)), "  "))
cs = cumsum(x);
cp = cumprod(x);
disp("cumsum(x) 2행 = " + join(string(cs(2,:)), "  "))
disp("cumprod(x) 2행 = " + join(string(cp(2,:)), "  "))

% 조화급수 1 + 1/2 + 1/3 + ... 의 부분합
k = 1:5;
sequence = 1./k;
series = cumsum(sequence);

format rat
disp("sequence (분수 표시)")
disp(sequence)
format short

disp("series = " + join(string(series), "  "))

% 항을 늘리면 조화급수는 천천히 발산한다
kk = 1:1000;
fprintf("1000항까지의 합 = %.4f\n", sum(1./kk))
