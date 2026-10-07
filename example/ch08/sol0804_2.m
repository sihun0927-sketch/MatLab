% sol0804_2.m — 8.4 연습문제 2: logical indexing 으로 학점 매기기

clear; clc

score = [95, 72, 88, 55, 90, 79, 61];

grade = strings(size(score));       % "" 로 채운 string 배열
grade(score >= 90)                 = "A";
grade(score >= 80 & score < 90)    = "B";
grade(score >= 70 & score < 80)    = "C";
grade(score < 70)                  = "F";

disp(table(score', grade', VariableNames=["Score", "Grade"]))

% 큰 기준부터 덮어쓰는 방법도 있다 (순서가 중요)
g2 = repmat("F", size(score));
g2(score >= 70) = "C";
g2(score >= 80) = "B";
g2(score >= 90) = "A";
isequal(grade, g2)                  % 1
