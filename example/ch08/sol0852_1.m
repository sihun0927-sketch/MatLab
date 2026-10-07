% sol0852_1.m — 8.5.2 연습문제 1: 음수면 sqrt 대신 메시지

clear; clc

for x = [16, -9]                % (반복문은 9장)
    if x >= 0
        fprintf("sqrt(%g) = %g\n", x, sqrt(x));
    else
        fprintf("%g: 음수의 제곱근은 실수가 아니다\n", x);
    end
end

% 검사하지 않으면 sqrt 는 오류 없이 복소수를 준다
sqrt(-9)                        % 0 + 3i
