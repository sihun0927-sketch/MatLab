% sol0309_2.m  (3.9 연습문제 2)
% pi 를 변수로 덮어쓰면 벌어지는 일
clear; clc

r = 2;
fprintf("정상    : 넓이 = %.4f\n", pi*r^2)

pi = 3;                       %#ok<*NASGU>
fprintf("덮어쓴 뒤: 넓이 = %.4f   <- 값이 틀렸다\n", pi*r^2)

clear pi                      % 변수를 지우면 함수가 되살아난다
fprintf("복구 후  : 넓이 = %.4f\n", pi*r^2)
