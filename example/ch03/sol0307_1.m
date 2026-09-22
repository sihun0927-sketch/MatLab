% sol0307_1.m  (3.7 연습문제 1)
% 복소수 사칙연산과 극형식
clear; clc

z1 = 3 + 4i;
z2 = 1 - 2i;
ops = [z1+z2, z1-z2, z1*z2, z1/z2];
names = ["z1+z2", "z1-z2", "z1*z2", "z1/z2"];

for k = 1:numel(ops)
    fprintf("%-6s = %7.4f %+7.4fi   |z|=%.4f  angle=%7.2f deg\n", ...
            names(k), real(ops(k)), imag(ops(k)), abs(ops(k)), rad2deg(angle(ops(k))))
end
