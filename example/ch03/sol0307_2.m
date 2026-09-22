% sol0307_2.m  (3.7 연습문제 2)
% x^2 + 2x + 5 = 0 의 근
clear; clc

a = 1; b = 2; c = 5;
disc = b^2 - 4*a*c;
fprintf("판별식 = %g  (음수이므로 허근)\n", disc)

x1 = (-b + sqrt(disc)) / (2*a);
x2 = (-b - sqrt(disc)) / (2*a);
fprintf("x1 = %g %+gi\n", real(x1), imag(x1))
fprintf("x2 = %g %+gi\n", real(x2), imag(x2))
fprintf("두 근은 서로 켤레인가? %d\n", x1 == conj(x2))

% roots 함수로 검산
disp("roots([1 2 5]) = " + join(string(roots([a b c]).'), "   "))
