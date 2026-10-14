% 정답 46: 벡터 입력은 if가 아니라 logical indexing으로 분류한다
clear, clc
ages = [15 17 45 72];
msg = license_type(ages)
one = license_type(16)

function out = license_type(age)
out = strings(size(age));
out(age < 16) = "wait";
out(age >= 16 & age < 18) = "youth";
out(age >= 18 & age < 70) = "standard";
out(age >= 70) = "senior";
end
