% sol0853_1.m — 8.5.3 연습문제 1: elseif 로 학점, 경계값 확인

clear; clc

for score = [100, 90, 89.9, 80, 79, 70, 69, 0]     % (반복문은 9장)
    if score >= 90
        g = "A";
    elseif score >= 80
        g = "B";
    elseif score >= 70
        g = "C";
    else
        g = "F";
    end
    fprintf("%5.1f → %s\n", score, g);
end
