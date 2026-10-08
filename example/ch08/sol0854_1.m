% sol0854_1.m — 8.5.4 연습문제 1: 월 → 날짜 수 (case 에 여러 값)

clear; clc

year = 2024;
for month = [1, 2, 4, 13]           % (반복문은 9장)
    switch month
        case {1, 3, 5, 7, 8, 10, 12}
            days = 31;
        case {4, 6, 9, 11}
            days = 30;
        case 2
            if mod(year, 4) == 0 && (mod(year, 100) ~= 0 || mod(year, 400) == 0)
                days = 29;
            else
                days = 28;
            end
        otherwise
            days = NaN;
    end
    fprintf("%d 년 %2d 월: %g 일\n", year, month, days);
end
