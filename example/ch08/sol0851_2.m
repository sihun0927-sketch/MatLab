% sol0851_2.m — 8.5.1 연습문제 2: if 가 참으로 보는 것

clear; clc

tests = {[], 'abc', [1 2 0], -0.5, 0, "", NaN};
names = ["[]", "'abc'", "[1 2 0]", "-0.5", "0", """""", "NaN"];

for k = 1:numel(tests)          % (반복문은 9장)
    v = tests{k};
    try
        if v
            r = "참";
        else
            r = "거짓";
        end
    catch err
        r = "오류: " + err.message;
    end
    fprintf("if %-8s → %s\n", names(k), r);
end
