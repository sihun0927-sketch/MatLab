% ex0306_rand_uniform.m
% 3.6.1 균등 난수 rand (Table 3.13)
clear; clc
rng(0)   % 시드를 고정해야 실행할 때마다 같은 값이 나온다

disp("rand(2) - 2x2, 0~1 균등 난수")
disp(rand(2))

disp("rand(3,2) - 3행 2열")
disp(rand(3,2))

% [x_min, x_max] 구간으로 옮기는 공식: (x_max-x_min)*rand + x_min
x_max = 10;
x_min = 5;

x100 = (x_max-x_min)*rand(100,1) + x_min;
fprintf("n=100   : mean=%.4f  max=%.4f  min=%.4f\n", mean(x100), max(x100), min(x100))

x10000 = (x_max-x_min)*rand(10000,1) + x_min;
fprintf("n=10000 : mean=%.4f  max=%.4f  min=%.4f\n", mean(x10000), max(x10000), min(x10000))
fprintf("이론값  : mean=%.4f  max=%.4f  min=%.4f\n", (x_max+x_min)/2, x_max, x_min)

% 정수 난수는 randi
sz = [2 3];
disp("randi(10,sz) - 1~10 정수")
disp(randi(10, sz))
