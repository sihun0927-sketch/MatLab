% sol0304_1.m  (3.4 연습문제 1)
% sind 와 sin(deg2rad(...)) 비교
clear; clc

deg = 0:45:360;
a = sind(deg);
b = sin(deg2rad(deg));

disp("sind        = " + join(string(round(a,4)), "  "))
disp("sin(deg2rad)= " + join(string(round(b,4)), "  "))
fprintf("두 결과가 완전히 같은가? %d\n", isequal(a,b))
fprintf("최대 차이 = %.3e   <- 부동소수점 오차만큼 다르다\n", max(abs(a-b)))
