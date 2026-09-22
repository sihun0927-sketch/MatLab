% sol0533_1.m - 5.3.3 연습문제 1
% 학점별 인원수를 막대 그래프와 파이 차트로 나란히 표시한다.

clear; clc; close all

grades = ["A", "B", "C", "D", "E"];
counts = [4, 7, 9, 3, 1];

t = tiledlayout(1,2);
title(t, "Grade Distribution")

nexttile
bar(counts)
xticklabels(grades)             % 막대 아래에 학점 표시
xlabel("Grade"); ylabel("Number of Students")
title("Bar Graph")

nexttile
pie(counts, grades)             % 두 번째 입력이 조각 레이블
title("Pie Chart")
