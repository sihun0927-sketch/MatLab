% sol0601_3.m — 6.1 연습문제 3
% local function 을 써서 BMI 를 계산하고 등급을 붙인다.
% 두 함수 모두 이 파일 안에서만 쓸 수 있다.

clear; clc

name   = ["A" "B" "C" "D"];
mass   = [52 68 84 95];        % kg
height = [1.60 1.75 1.72 1.90];  % m

b = bmi(mass, height);
g = bmi_class(b);

for k = 1:numel(name)
    fprintf('%s: BMI %5.1f (%s)\n', name(k), b(k), g(k));
end

function value = bmi(m, h)
% BMI  체질량지수 m/h^2 을 계산한다.
value = m ./ h.^2;
end

function label = bmi_class(b)
% BMI_CLASS  BMI 값을 등급 문자열로 바꾼다.
label = strings(size(b));
label(b < 18.5)             = "저체중";
label(b >= 18.5 & b < 23)   = "정상";
label(b >= 23   & b < 25)   = "과체중";
label(b >= 25)              = "비만";
end
