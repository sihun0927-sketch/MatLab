% sol0854_2.m — 8.5.4 연습문제 2: 단위 변환, 대소문자 무시, otherwise 로 오류

clear; clc

units = {'km', "MI", 'Ft', "yard"};     % char 와 string 이 섞여 있다
value = 3;

for k = 1:numel(units)                  % (반복문은 9장)
    u = units{k};
    try
        switch lower(u)                 % 대소문자를 맞춘 뒤 비교
            case "km"
                m = value * 1000;
            case "mi"
                m = value * 1609.344;
            case "ft"
                m = value * 0.3048;
            otherwise
                error("모르는 단위: %s", u);
        end
        fprintf("%g %s = %.2f m\n", value, u, m);
    catch err
        fprintf("%s\n", err.message);
    end
end
