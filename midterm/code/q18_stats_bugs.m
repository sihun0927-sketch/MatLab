% 문제 18: 학생 4명의 시험 3회 점수. 학생별 평균, 학생별 최고점과 그 시험 번호,
%          시험 1 점수 기준으로 학생 행을 내림차순 정렬, 평균 75 이상 학생 출력.
clear, clc
scores = [78 92 65; 88 71 95; 60 85 79; 90 68 72];
max = max(scores)
avg = mean(scores, 1)'
[best, exam] = max(scores, 2)
ranked = sort(scores, 'descend')
pass = find(avg >= 75)
fprintf('Student %d passed with average %.1f\n', pass, avg(pass))
