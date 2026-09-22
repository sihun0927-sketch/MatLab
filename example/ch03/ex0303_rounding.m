% ex0303_rounding.m
% 3.3.2 반올림 함수 (Table 3.2)
clear; clc

% 사과 예제: 5달러로 개당 0.52달러 사과를 몇 개 살 수 있나?
money = 5.00;
price = 0.52;
count = money/price;
fprintf("money/price = %.4f -> 살 수 있는 개수 = %d\n", count, fix(count))

x = [8.6 -8.6];
fprintf("%8s %8s %8s\n", "x", "8.6", "-8.6")
fprintf("%8s %8g %8g\n", "round", round(x(1)), round(x(2)))
fprintf("%8s %8g %8g\n", "fix",   fix(x(1)),   fix(x(2)))
fprintf("%8s %8g %8g\n", "floor", floor(x(1)), floor(x(2)))
fprintf("%8s %8g %8g\n", "ceil",  ceil(x(1)),  ceil(x(2)))

% round 는 자릿수를 두 번째 입력으로 받는다
fprintf("round(8.6436,3) = %.4f\n", round(8.6436,3))

% 음수에서 fix 와 floor 가 갈린다
fprintf("fix(-8.6)=%g 이지만 floor(-8.6)=%g\n", fix(-8.6), floor(-8.6))
