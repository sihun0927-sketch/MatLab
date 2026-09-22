% sol0301_3.m  (3.1 연습문제 3)
% 초를 시/분/초로 나눈다. fix 로 몫, rem 으로 나머지.
clear; clc

t = 3725;
h = fix(t/3600);
m = fix(rem(t,3600)/60);
s = rem(t,60);
fprintf("%d초 = %d시간 %d분 %d초\n", t, h, m, s)
