% sol0304_2.m  (3.4 연습문제 2)
% 직각삼각형의 빗변과 각
clear; clc

base   = 3;
height = 4;

hyp = sqrt(base^2 + height^2);
fprintf("빗변 = %g  (hypot 로도 같다: %g)\n", hyp, hypot(base,height))

ang = atand(height/base);     % 결과가 도 단위인 역탄젠트
fprintf("밑변과 빗변이 이루는 각 = %.2f deg\n", ang)
fprintf("검산: acosd(3/5) = %.2f deg\n", acosd(base/hyp))
