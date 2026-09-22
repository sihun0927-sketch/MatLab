% ex0305_average.m
% 3.5.2 평균값 계열 (Table 3.6)
clear; clc

x = [1 5 3
     2 4 6];

disp("mean(x)    = " + join(string(mean(x)), "  "))    % 열 평균
disp("mean(x,2)  = " + join(string(mean(x,2)'), "  ")) % 행 평균
fprintf("mean(x,'all') = %.4f\n", mean(x, "all"))      % 전체 평균

y = [1 5 3
     2 4 6
     3 8 4];
disp("median(y)  = " + join(string(median(y)), "  "))

z = [1 2 3 3];
fprintf("mode(z)    = %g\n", mode(z))

% 중앙값은 이상치(outlier)에 둔감하다
scores = [70 72 75 74 1000];
fprintf("mean   = %.1f\n", mean(scores))
fprintf("median = %.1f   <- 이상치 1000 에 흔들리지 않는다\n", median(scores))
