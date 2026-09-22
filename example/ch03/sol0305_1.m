% sol0305_1.m  (3.5 연습문제 1)
% 과목별/학생별 평균과 전체 최고점
clear; clc

scores = [88 92 75
          79 85 91
          93 70 84
          65 88 77];

disp("(a) 과목별 평균 = " + join(string(mean(scores)), "  "))
disp("(b) 학생별 평균 = " + join(string(round(mean(scores,2),2)'), "  "))

% 전체 최고점: 열별 최댓값을 한 번 더 max 에 넣는다
[colMax, rowIdx] = max(scores);
[best, colIdx]   = max(colMax);
fprintf("(c) 최고점 %d, 학생 %d번, 과목 %d\n", best, rowIdx(colIdx), colIdx)
