% sol0303_1.m  (3.3 연습문제 1)
% 원의 넓이. .^ 로 원소별 제곱.
clear; clc

r = [1 2.5 7];
area = pi * r.^2;
disp("area       = " + join(string(area), "   "))
disp("round(.,2) = " + join(string(round(area,2)), "   "))
