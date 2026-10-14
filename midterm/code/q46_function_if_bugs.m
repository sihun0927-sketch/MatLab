% 문제 46: 나이 벡터를 받아 면허 종류를 돌려주는 함수. 기대 출력:
%   msg = "wait" "youth" "standard" "senior"
clear, clc
ages = [15 17 45 72];
msg = license_type(ages)

function out = license_type(age)
if age < 16
    out = "wait";
else if age < 18
    out = "youth";
elseif age < 70
    out = "standard";
else
    out = "senior";
end
end
